<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		//show profile
		$this->root->view("profile/main");
	}

	public function config()
	{
		//set config
		$this->root->view("profile/config");
	}
}
