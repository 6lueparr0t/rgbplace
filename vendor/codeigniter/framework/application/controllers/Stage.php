<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stage extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		// bring data from user_info 'code' column
		$uid = $this->session->userdata('uid');
		$adm = $this->session->userdata('admin');
		$map = $this->base->getStage($this->session->userdata('uid'))['map'];

		if($uid && !$admin && $map) redirect($map);

		//redirect("/".DEFAULT_MAP);
	}
}
