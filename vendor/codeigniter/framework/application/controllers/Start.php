<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Start extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->allow=[];
	}

	public function index()
	{
		redirect(current_url()."play");
	}

}
