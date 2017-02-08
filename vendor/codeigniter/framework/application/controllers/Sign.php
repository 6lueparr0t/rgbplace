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
					'rules' => 'required'
				],
				[
					'field' => 'pswd',
					'label' => 'PassWord',
					'rules' => 'required',
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

			if (strpos($data['uid'], "@") === false && $this->sign->userCheck($data)) {

				$user = [
					'uid'  => $data['uid'],
					'signed_in' => TRUE
				];
				$this->session->set_userdata($user);
				$this->session->set_flashdata('status', '<p>Sign In</p>');

			} elseif (strpos($data['uid'], "@") !== false && $this->sign->adminCheck($data)) {

				$admin = [
					'admin'=> TRUE,
					'uid'  => $data['uid'],
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

	}

}
