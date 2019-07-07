<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sign extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Sign_model','sign');
	}

	public function index()
	{
		if($this->session->userdata('signed_in')) {
			redirect('/');
		} else {
			$this->session->set_userdata(array('http_referer' => (isset($_SERVER['HTTP_REFERER'])?$_SERVER['HTTP_REFERER']:null) ));
			//회원가입 임시 제한
			$this->root->view("sign/main");
		}
	}

	public function find()
	{
		if($this->session->userdata('signed_in')) {
			redirect('/');
		} else {
			$this->session->set_userdata(array('http_referer' => (isset($_SERVER['HTTP_REFERER'])?$_SERVER['HTTP_REFERER']:null) ));
			//회원가입 임시 제한
			$this->root->view("sign/find");
		}
	}

	public function in($check="")
	{
		if(!$this->input->post('uid') || !$this->input->post('pswd')) redirect("/");

		$config = [
				[
					'field' => 'uid',
					'label' => 'Uid',
					'rules' => 'trim|min_length[6]|max_length[100]|required'
				],
				[
					'field' => 'pswd',
					'label' => 'PassWord',
					'rules' => 'trim|min_length[10]|max_length[255]|required',
					'errors' => [
						'required' => 'You must provide a %s.',
					],
				]
			];

		$this->form_validation->set_rules($config);
		$validation = $this->form_validation->run();

		if ($validation) {

			$data['uid'] = $this->input->post('uid');
			$data['pswd']= $this->input->post('pswd');
			$output = ['valid' => false, 'msg' => ""];

			if ($check === "check") {
				if (strpos($data['uid'], "@") === false && $this->sign->userCheck($data) === false) {
					$result = $this->sign->failCount($data);
					if($result) {
						$output['msg'] = "로그인에 실패하였습니다.\nLogin fail.\n\n {$result['atim']}, {$result['fail']}/20";
					} else {
						$output['msg'] = "로그인에 실패하였습니다.\nLogin fail.";
					}

				} elseif (strpos($data['uid'], "@") !== false && $this->sign->adminCheck($data) === false) {
					$result = $this->sign->failCount($data);
					//$output['msg'] = "로그인에 실패하였습니다.\n\n {$result['atim']}, {$result['fail']}/5번 실패";
					$output['msg'] = "로그인에 실패하였습니다.\nLogin fail.";

				} else {
					$output['valid'] = true;
					$output['msg'] = "";
				}

					echo json_encode($output);

					return true;
			} 

			if (strpos($data['uid'], "@") === false && $result=$this->sign->userCheck($data)) {

				$user = [
					'admin'=> FALSE,
					'sn' => $result['sn'],
					'uid'  => $data['uid'],
					'name' => $result['name'],
					'stage' => $result['map'],
					'darkmode'=> $result['dark_sw'],
					'signed_in' => TRUE
				];
				$this->session->set_userdata($user);

			} elseif (strpos($data['uid'], "@") !== false && $result=$this->sign->adminCheck($data)) {

				$admin = [
					'admin'=> TRUE,
					'sn' => $result['sn'],
					'uid'  => $data['uid'],
					'name'  => $result['name'],
					'signed_in' => TRUE
				];
				$this->session->set_userdata($admin);

			}
		//validation === false
		} else if($check === "check") { 
			$output['valid'] = false;
			$output['msg'] = "잘못된 정보입니다.\ncheck your account.";

			echo json_encode($output);

			return false;
		}


		//echo ("<script>setTimeout(function(){history.go(-1);},3000);</script>");
		
		//header('Location: '.$_SERVER['HTTP_REFERER']);
		header('Location: '.$this->input->post('http_referer'));
	}

	public function out()
	{
		$config = ['admin', 'sn', 'uid', 'name', 'signed_in', 'oauth'];
		$this->session->unset_userdata($config);

		header('Location: '.$_SERVER['HTTP_REFERER']);
	}
	
	public function up($check="")
	{
		if (
			!$this->input->post('uid')
			|| !$this->input->post('name')
			|| !$this->input->post('mail')
			|| !$this->input->post('pswd')
			|| !$this->input->post('conf')
		) redirect("/");

		$config = [
				[
					'field' => 'uid',
					'label' => 'Uid',
					'rules' => 'trim|alpha_dash|min_length[6]|max_length[255]|required'
				],
				[
					'field' => 'name',
					'label' => 'Nick Name',
					'rules' => 'trim|callback_is_space|min_length[2]|max_length[20]|required'
				],
				[
					'field' => 'mail',
					'label' => 'mail',
					'rules' => 'trim|callback_is_space|min_length[2]|max_length[255]|required'
				],
				[
					'field' => 'pswd',
					'label' => 'PassWord',
					'rules' => 'trim|min_length[10]|max_length[255]|required',
					'errors' => [
						'required' => 'You must provide a %s.',
					]
				],
				[
					'field' => 'conf',
					'label' => 'Confirm Password',
					'rules' => 'trim|min_length[10]|max_length[255]|required|matches[pswd]'
				]
			];

		//uid, pswd 검증 코드
		$this->form_validation->set_rules($config);
		$validation = $this->form_validation->run();

		if ($validation) {

			$data['uid'] = $this->input->post('uid');
			$data['name']= $this->input->post('name');

			$data['mail']= $this->input->post('mail');
			$data['code']= $this->input->post('code');

		 	$data['pswd']= $this->input->post('pswd');
			$data['conf']= $this->input->post('conf');

			if ($check === "check") {
				if($this->sign->uidValid($data)) {
					$output['valid'] = true;
					$output['msg'] = "";
				} else {
					$output['valid'] = false;
					$output['msg'] = "{$data['uid']} : 사용할 수 없는 아이디입니다.\n{$data['uid']} : already used This ID.";
				}

				if ($this->session->tempdata('mail') != $data['mail'] || $this->session->tempdata('code') != $data['code']) {
					$output['valid'] = false;
					$output['msg'] = "인증된 메일과 코드를 확인해주세요.\nCheck your Auth-Mail and Auth-Code.";
				}
				echo json_encode($output);

				return true;
			}

			if ($check === "") {
				// Build POST request:
				$recaptcha_url = 'https://www.google.com/recaptcha/api/siteverify';
				$recaptcha_secret = RECAPTCHA_SECRET;
				$recaptcha_response = $this->input->post('recaptcha_response');

				// Make and decode POST request:
				$recaptcha = file_get_contents($recaptcha_url . '?secret=' . $recaptcha_secret . '&response=' . $recaptcha_response);
				$recaptcha = (array)json_decode($recaptcha);

				$score = @isset($recaptcha['score'])?$recaptcha['score']:1;

				// Take action based on the score returned:
				if ($score >= 0.5) {
					$sn = $this->sign->userMake($data);
				} else {
					echo ("<script>alert('로봇인가요?\nAre you bot?')history.go(-1);</script>");
					return false;
				}
			}
		//validation === false
		} else if($check === "check") {
			$output['valid'] = false;
			$output['msg'] = "잘못된 정보입니다.\ncheck your account.";

			echo json_encode($output);

			return false;
		}

		//세션 생성 후 종료, front에서 redirect 하여 갱신
		//echo ("<script>setTimeout(function(){history.go(-1);},3000);</script>");

		$user = [
			'admin'=> FALSE,
			'sn' => $sn,
			'uid'  => $data['uid'],
			'name' => $data['name'],
			'stage' => '',
			'darkmode'=> 0,
			'signed_in' => TRUE
		];

		$this->session->set_userdata($user);

		redirect($this->input->server('http_referer'));
	}

	public function change($check="")
	{
		if (
			!$this->input->post('mail')
			|| !$this->input->post('pswd')
			|| !$this->input->post('conf')
		) redirect("/");

		$config = [
				[
					'field' => 'mail',
					'label' => 'mail',
					'rules' => 'trim|callback_is_space|min_length[2]|max_length[255]|required'
				],
				[
					'field' => 'pswd',
					'label' => 'PassWord',
					'rules' => 'trim|min_length[10]|max_length[255]|required',
					'errors' => [
						'required' => 'You must provide a %s.',
					]
				],
				[
					'field' => 'conf',
					'label' => 'Confirm Password',
					'rules' => 'trim|min_length[10]|max_length[255]|required|matches[pswd]'
				]
			];

		//uid, pswd 검증 코드
		$this->form_validation->set_rules($config);
		$validation = $this->form_validation->run();

		if ($validation) {

			$data['mail']= $this->input->post('mail');
			$data['code']= $this->input->post('code');

		 	$data['pswd']= $this->input->post('pswd');
			$data['conf']= $this->input->post('conf');

			if ($check === "check") {
				if ($this->session->tempdata('mail') != $data['mail'] || $this->session->tempdata('code') != $data['code']) {
					$output['valid'] = false;
					$output['msg'] = "인증된 메일과 코드를 확인해주세요.\nCheck your Auth-Mail and Auth-Code.";
				} else {
					$output['valid'] = true;
					$output['msg'] = "";
				}
				echo json_encode($output);

				return true;
			}

			if ($check === "") {
				// Build POST request:
				$recaptcha_url = 'https://www.google.com/recaptcha/api/siteverify';
				$recaptcha_secret = RECAPTCHA_SECRET;
				$recaptcha_response = $this->input->post('recaptcha_response');

				// Make and decode POST request:
				$recaptcha = file_get_contents($recaptcha_url . '?secret=' . $recaptcha_secret . '&response=' . $recaptcha_response);
				$recaptcha = (array)json_decode($recaptcha);

				$score = @isset($recaptcha['score'])?$recaptcha['score']:1;

				// Take action based on the score returned:
				if ($score >= 0.5) {
					$sn = $this->sign->passwordChange($data);
				} else {
					echo ("<script>$score alert('로봇인가요?\nAre you bot?')history.go(-1);</script>");
					return false;
				}
			}
		//validation === false
		} else if($check === "check") {
			$output['valid'] = false;
			$output['msg'] = "잘못된 정보입니다.\ncheck your account.";

			echo json_encode($output);

			return false;
		}

		//세션 생성 후 종료, front에서 redirect 하여 갱신
		//echo ("<script>setTimeout(function(){history.go(-1);},3000);</script>");
		redirect($this->input->server('http_referer'));
	}

	public function mailAuth() {
		//mailtest. success complete
		//redirect('/');
		if($this->sign->mailCount() >= 9000) {
			echo json_encode(array('send' => 'over'));
			return true;
		}

		$data = (array)json_decode($this->input->raw_input_stream);

		if($this->sign->mailValid($data) === false) {
			echo json_encode(array('send' => 'already'));
			return true;
		}

		$data['code'] = random_int(100000, 999999);
		$this->session->set_tempdata('code', $data['code'], 60*60);
		$this->session->set_tempdata('mail', $data['mail'], 60*60);

		$config = array (
			'protocol' => 'sendmail',
			'mailpath' => '/usr/sbin/sendmail',
			'smtp_host' => SMTP_HOST,
			'smtp_port' => SMTP_PORT,
			'smtp_user' => SMTP_USER,
			'smtp_pass' => SMTP_PASS,
			'smtp_timeout' => 10,

			'charset' => 'utf-8',
			'wordwrap' => TRUE,
			'mailtype' => "html",

			'_bit_depths' => array('7bit', '8bit', 'base64'),
			'_encoding' => 'base64',
		);

		$this->load->library('email', $config);
		/* 메일전송 시작 */

		$this->email->from('admin@rgbplace.com', 'RGB place');
		$this->email->to($data['mail']);
		$this->email->reply_to('admin@rgbplace.com', 'RGB place');

		$this->email->subject("RGB Place - 인증번호(Auth-Code) 안내 메일입니다.");

		$this->email->message("
			<html>
			<head>
			<title>RGB Place</title>
			</head>
			<body>
				인증번호 숫자 6자리를 입력해 주세요.<br/>
				Please enter the six-digit authentication code number<br/><br/>

				Auth-Code : {$data['code']}
			</body>
			</html>
		");

		$this->email->send();
		echo json_encode(array('send' => $this->sign->mailLog($data)));

		/* 전송 결과 로그 */
		//echo $this->email->print_debugger();


		/* 메일전송 끝 */

	}

	function is_space($str)
	{
		return ( preg_match("/[^\S]/i", $str)) ? FALSE : TRUE;
	} 

}
