<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Board extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->rgb->view("board/main");
	}

	public function view($map, $num) {
		//echo "{$map}, {$num}";
	}
}
