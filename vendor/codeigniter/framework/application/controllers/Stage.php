<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stage extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$stage = $this->session->userdata('stage');
		if($stage) redirect($stage);

		redirect("/".DEFAULT_MAP);
	}
}
