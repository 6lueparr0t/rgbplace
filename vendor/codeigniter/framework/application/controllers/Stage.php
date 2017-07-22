<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stage extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		// bring data from user_info 'code' column
		if($this->session->userdata('uid') && !$this->session->userdata('admin')) {
			redirect($this->base->get_stage($this->session->userdata('uid'))['map']);
		}

		redirect("/dmz");
	}
}
