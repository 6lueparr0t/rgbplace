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
		$data['adm_list'] = ["user", "map", "info"];
		$data['ex_list'] = ["generate_hash", "start_page", "react_tutorial", "react_practise", "react_animation"];
		$this->rgb->sview('admin/index', $data);
	}

// ####################################################################################################################
// Admin
// ####################################################################################################################

	public function user()
	{
		$this->rgb->sview("admin/user");
	}

	public function map()
	{
		$this->rgb->sview("admin/map");
	}

	public function info()
	{
		$this->rgb->sview("admin/info");
	}

// ####################################################################################################################
// Example
// ####################################################################################################################

	public function start_page()
	{
		$this->rgb->sview("admin/example/start_page");
	}

	public function react_practise()
	{
		$this->rgb->sview("admin/example/react_practise");
	}

	public function react_tutorial()
	{
		$this->rgb->sview("admin/example/react_tutorial");
	}

	public function react_animation()
	{
		$this->rgb->sview("admin/example/react_animation");
	}

	public function generate_hash()
	{
		$data["pswd"] = $this->input->post("pswd")?:"null";
		$data["hash"] = base64_encode(password_hash($data["pswd"], PASSWORD_DEFAULT, ['cost'=>12]));
		$this->rgb->view('admin/example/generate_hash', $data);
	}

}
