<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Map extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		redirect("/stage");
	}

	public function post($map, $num = 0) {
		
		echo "{$map}, {$num}";
	}
}
