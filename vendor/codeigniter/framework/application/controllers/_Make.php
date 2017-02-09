<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Make extends CI_Controller {

	//make place and maker

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		redirect('/', 'refresh');
	}

	public function api()
	{

	}
}
