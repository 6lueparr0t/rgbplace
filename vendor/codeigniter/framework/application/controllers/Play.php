<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Play extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->allow=[];
	}

	public function index()
	{
		$this->rgb->view("play/main");
	}

	public function _board()
	{
		$this->rgb->view("play/board");
	}

	public function _config()
	{
		$this->rgb->view("play/config");
	}

	public function minify($page = "main")
	{
		$data['minify'] = "on";
		$this->rgb->sview("play/{$page}", $data);
	}

}
