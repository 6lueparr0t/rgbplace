<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

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
		$data['adm_list'] = ["info", "user", "map"];
		$data['ex_list'] = ["generate_hash", "animation"];
		$this->rgb->sview('admin/index', $data);
	}

/* ############################################
					Admin
############################################ */

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

/* ############################################
					Example	
############################################ */

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
