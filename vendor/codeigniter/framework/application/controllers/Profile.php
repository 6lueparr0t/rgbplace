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

			$data = $this->profile->info($this->input->get('no'));
			if(!$data) redirect("/");
			$data['no'] = $this->input->get('no');

			$this->root->view("profile/main", $data);
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
