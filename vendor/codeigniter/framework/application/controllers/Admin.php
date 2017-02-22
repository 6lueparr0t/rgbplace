<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Admin_model', 'admin');
	}

	public function index()
	{
		$data['adm_list'] = ["pixel", "map", "info"];
		$data['ex_list'] = ["generate_hash", "start_page", "react_tutorial", "react_practise", "react_animation"];
		$this->rgb->sview('admin/index', $data);
	}

	public function minify()
	{
		$data['minify'] = "on";
		$this->rgb->sview("admin/index", $data);
	}

// ####################################################################################################################
// Admin
// ####################################################################################################################

	public function pixel($act = "")
	{
		$data['minify'] = ($act === "minify")?"on":"off";

		$this->admin->pixel("select");
		$this->rgb->sview("admin/pixel", $data);
	}

	public function pixeller($act)
	{
		$this->admin->pixel($act);
	}

	public function map($act = "")
	{
		$data['minify'] = ($act === "minify")?"on":"off";

		$this->admin->map("select");
		$this->rgb->sview("admin/map", $data);
	}

	public function mapper($act)
	{
		$this->admin->map($act);
	}

	public function info()
	{
		$data['minify'] = "none";
		$this->rgb->sview("admin/info", $data);
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

	public function react_animation($act = "")
	{
		($act === "minify")? $data['minify'] = "on":$data['minify'] = "off";
		$this->rgb->sview("admin/example/react_animation", $data);
	}

	public function generate_hash()
	{
		$data["pswd"] = $this->input->post("pswd")?:"null";
		$data["hash"] = base64_encode(password_hash($data["pswd"], PASSWORD_DEFAULT, ['cost'=>12]));
		$this->rgb->view('admin/example/generate_hash', $data);
	}

}
