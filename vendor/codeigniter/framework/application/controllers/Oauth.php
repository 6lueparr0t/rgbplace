<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Oauth extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('Api_model', 'api');
	}

	public function index() {
		redirect("/");
	}

	public function google()
	{
		$method = $this->input->method();

		$ret = false;
		if($method == 'post') {
			$data = (array)json_decode($this->input->raw_input_stream)[0];
			
			//$name = explode(' ', $data['name']);
			$uid = explode('@', $data['mail'])[0];
			$mail = $data['mail'];

			$param = array(
				'name' => $uid,
				'mail' => $mail
			);

			if( $ret = $this->api->googleSignUpAndLoginCheck($param) ) {
				$googleUser = [
					'sn'        => $ret['sn'],
					'uid'       => $mail,
					'name'      => $ret['name'],
					'admin'     => FALSE,
					'oauth'    => 'google',
					'signed_in' => TRUE
				];

				$this->session->set_userdata($googleUser);

				$ret = true;
			}
		}

		echo json_encode($ret);
	}

	public function kakao()
	{
		$method = $this->input->method();

		$ret = false;
		if($method == 'post') {
			$data = (array)json_decode($this->input->raw_input_stream)[0];
			
			$uid = $data['uid'];
			$name = $data['name'];

			$param = array(
				'uid' => $uid,
				'name' => $name
			);

			if( $ret = $this->api->kakaoSignUpAndLoginCheck($param) ) {
				$kakaoUser = [
					'sn'        => $ret['sn'],
					'uid'       => $ret['uid'],
					'name'      => $ret['name'],
					'admin'     => FALSE,
					'oauth'    => 'kakao',
					'signed_in' => TRUE
				];

				$this->session->set_userdata($kakaoUser);

				$ret = true;
			}
		}

		echo json_encode($data);
	}

}
