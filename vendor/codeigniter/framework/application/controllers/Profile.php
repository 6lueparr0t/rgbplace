<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->allow=[];
	}

	public function index()
	{
		$this->rgb->view("profile/info");
	}

	public function config()
	{
		$this->rgb->view("profile/config");
	}
}
