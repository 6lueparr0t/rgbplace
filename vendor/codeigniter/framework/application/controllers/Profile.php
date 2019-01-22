<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		if($this->session->userdata('signed_in') === true) {

			$no = base64_decode( urldecode($this->input->get('no')) );
			$data = $this->profile->info($no);
			if(!$data) {
				redirect("/");
			} else {
				$data['no'] = $no;
				$this->root->view("profile/main", $data);
			}

		} else {
			redirect("/");
		}
	}

	public function config()
	{
		//set config
		$this->root->view("profile/config");
	}
}
