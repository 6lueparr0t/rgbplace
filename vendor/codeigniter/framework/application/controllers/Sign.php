<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sign extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Sign_model','sign');
	}

	public function index()
	{
		redirect('/', 'refresh');
	}

	public function in()
	{

	}

	public function out()
	{

	}
	
	public function up()
	{

	}
}
