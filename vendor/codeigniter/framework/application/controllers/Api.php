<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {

	/**
	 * 
	 * Comments : ..
	 * 
	 */

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Admin_model', 'admin');
	}

	public function index()
	{
		$this->rgb->sview('admin/main');
	}

/* ########################################
				Admin [admin]
######################################## */

	public function info()
	{
		$this->rgb->sview("admin/info");
	}

	public function user()
	{
		$this->rgb->sview("admin/user");
	}

	public function map()
	{
		$this->rgb->sview("admin/map");
	}

/* ########################################
				Example	[exam]
######################################## */

	public function animation()
	{
		$this->rgb->sview("admin/example/animation");
	}

	public function generate_hash()
	{
		$data["pswd"] = $this->input->post("pswd")?:"null";
		$data["hash"] = base64_encode(password_hash($data["pswd"], PASSWORD_DEFAULT, ['cost'=>12]));
		$this->rgb->view('admin/example/generate_hash', $data);
	}

}
