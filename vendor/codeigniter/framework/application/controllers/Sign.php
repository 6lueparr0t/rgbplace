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
			$this->root->view("sign/main");
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
					'uid'  => $data['uid'],
					'name' => $result['name'],
					'score'=> $result['score'],
					'map' => $result['map'],
					'signed_in' => TRUE
				];
				$this->session->set_userdata($user);

			} elseif (strpos($data['uid'], "@") !== false && $result=$this->sign->adminCheck($data)) {

				$admin = [
					'admin'=> TRUE,
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
		
		header('Location: '.$_SERVER['HTTP_REFERER']);
	}

	public function out()
	{
		$config = ['admin', 'uid', 'name', 'signed_in'];
		$this->session->unset_userdata($config);

		header('Location: '.$_SERVER['HTTP_REFERER']);
	}
	
	public function up($check="")
	{
		if (
			!$this->input->post('uid')
			|| !$this->input->post('name')
			|| !$this->input->post('pswd')
			|| !$this->input->post('conf')
		) redirect("/");

		$config = [
				[
					'field' => 'uid',
					'label' => 'Uid',
					'rules' => 'trim|alpha_dash|min_length[6]|max_length[100]|required'
				],
				[
					'field' => 'name',
					'label' => 'Nick Name',
					'rules' => 'trim|callback_is_space|min_length[2]|max_length[20]|required'
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
			$data['pswd']= $this->input->post('pswd');
			$data['conf']= $this->input->post('conf');

			if ($check === "check") {
				if($this->sign->uidValid($data)) {
					$output['valid'] = true;
					$output['msg'] = "";
				} else {
					$output['valid'] = false;
					$output['msg'] = "사용할 수 없는 아이디입니다.\nalready used Input ID.";
				}

				echo json_encode($output);

				return true;
			} 

			if ($check === "" && $this->sign->userMake($data)) {

				$user = [
					'uid'  => $data['uid'],
					'name'  => $data['name'],
					'signed_in' => TRUE
				];

				$this->session->set_userdata($user);
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

	function is_space($str)
	{
		return ( preg_match("/[^\S]/i", $str)) ? FALSE : TRUE;
	} 

}
