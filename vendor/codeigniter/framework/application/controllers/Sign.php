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
		redirect('/', 'refresh');
	}

	public function in()
	{
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

		if ($this->form_validation->run() == TRUE) {
			//uid, pswd 검증 코드
			//세션 생성 후 종료, front에서 redirect 하여 갱신

			$data['uid'] = $this->input->post('uid');
			$data['pswd']= $this->input->post('pswd');

			if (strpos($data['uid'], "@") === false && $result=$this->sign->userCheck($data)) {

				$user = [
					'admin'=> FALSE,
					'uid'  => $data['uid'],
					'name' => $result['name'],
					'score'=> $result['score'],
					'code' => $result['code'],
					'signed_in' => TRUE
				];
				$this->session->set_userdata($user);
				$this->session->set_flashdata('status', '<p>Sign In</p>');

			} elseif (strpos($data['uid'], "@") !== false && $result=$this->sign->adminCheck($data)) {

				$admin = [
					'admin'=> TRUE,
					'uid'  => $data['uid'],
					'name'  => $result['name'],
					'signed_in' => TRUE
				];
				$this->session->set_userdata($admin);
				$this->session->set_flashdata('status', '<p>Login Success</p>');

			} else {
				$this->session->set_flashdata('status', '<p>check your ID and Password</p>');
			}
		} else {
			$this->session->set_flashdata('status', validation_errors());
		}

		//echo ("<script>setTimeout(function(){history.go(-1);},3000);</script>");
		redirect($this->input->server('http_referer'));
	}

	public function out()
	{
		$config = ['admin', 'uid', 'signed_in'];
		$this->session->unset_userdata($config);

		$this->session->set_flashdata('status', '<p>Sign Out</p>');

		redirect($this->input->server('http_referer'));
	}
	
	public function up()
	{
		$config = [
				[
					'field' => 'uid',
					'label' => 'Uid',
					'rules' => 'trim|alpha_dash|min_length[6]|max_length[100]|required'
				],
				[
					'field' => 'name',
					'label' => 'Nick Name',
					'rules' => 'trim|min_length[2]|max_length[20]|required'
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

		$this->form_validation->set_rules($config);

		if ($this->form_validation->run() == TRUE) {
			//uid, pswd 검증 코드
			//세션 생성 후 종료, front에서 redirect 하여 갱신

			$data['uid'] = $this->input->post('uid');
			$data['name']= $this->input->post('name');
			$data['pswd']= $this->input->post('pswd');
			$data['conf']= $this->input->post('conf');

			if ($this->sign->userMake($data)) {

				$user = [
					'uid'  => $data['uid'],
					'name'  => $data['name'],
					'signed_in' => TRUE
				];

				$this->session->set_userdata($user);
				$this->session->set_flashdata('status', '<p>Sign Up Complete !</p>');

			} else {
				$this->session->set_flashdata('status', '<p>Check your ID</p>');
			}
		} else {
			$this->session->set_flashdata('status', validation_errors());
		}

		//echo ("<script>setTimeout(function(){history.go(-1);},3000);</script>");
		redirect($this->input->server('http_referer'));
	}

}
