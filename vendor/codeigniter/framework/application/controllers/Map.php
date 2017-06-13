<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Map extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->rgb->view("map/main");
	}

	public function search()
	{
		$data =   ['keyword' => $this->input->get('keyword')];
		$output = $this->base->map($data['keyword']);

		echo json_encode($output);
	}

	public function cover($map)
	{
		echo "{$map}";
	}

	public function post($map, $num = 0)
	{
		echo "{$map}, {$num}";
	}
}
