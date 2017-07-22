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
		if($this->input->get('keyword')) {
			$data   = ['keyword' => $this->input->get('keyword')];
			$output = $this->base->get_map($data['keyword']);
		} else {
			$output = [];
		}
		echo json_encode($output);
	}

	public function page($map)
	{
		//echo "{$map}";
		$data['map'] = $map;
		$this->rgb->view("map/main", $data);
	}

	public function post($map, $num = 0)
	{
		//echo "{$map}, {$num}";
		$data['map'] = $map;
		$data['num'] = $num;
		$this->rgb->view("map/main", $data);
	}

}
