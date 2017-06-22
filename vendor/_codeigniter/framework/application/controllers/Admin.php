<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		redirect("/");
	}

/* ########################################
				Admin [admin]
######################################## */

	public function info()
	{
		$this->rgb->sview("admin/info");
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
		$this->rgb->sview('admin/example/generate_hash', $data);
	}

	public function restful()
	{
		$this->rgb->sview("admin/example/restful");
	}

	public function dragndrop_upload()
	{
		$this->rgb->sview("admin/example/dragndrop_upload");
	}
}
