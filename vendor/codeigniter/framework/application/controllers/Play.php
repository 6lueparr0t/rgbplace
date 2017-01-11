<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Play extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->hotpm->view("play/main");
	}
	
	public function minify()
	{
		$data['minify'] = "on";
		$this->hotpm->sview("play/main", $data);
	}

}
