<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Play extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->rgb->view("play/main");
	}
	
	public function minify()
	{
		$data['minify'] = "on";
		$this->rgb->sview("play/main", $data);
	}

}
