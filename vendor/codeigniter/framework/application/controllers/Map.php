<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Map extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Map_model','map');
	}

	public function index()
	{
		redirect("/");
	}

	public function search()
	{
		if($this->input->get('keyword')) {
			$data   = ['keyword' => $this->input->get('keyword')];
			$output = $this->base->get_map($data['keyword']);
		}

		if(empty($output)) $output = null;
		echo json_encode($output);
	}

	public function page($map)
	{
		$data['map' ] = strtolower($map);

		$this->rgb->view("map/page", $data);
	}

	public function list($map, $type)
	{
		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);

		$data['search']['page'   ] = urldecode($this->input->get('page'));
		$data['search']['method' ] = urldecode($this->input->get('method'));
		$data['search']['keyword'] = urldecode($this->input->get('keyword'));
		$data['search']['date'   ] = urldecode($this->input->get('date'));

		$this->rgb->view("map/list", $data);
	}

	public function post($map, $type, $num = 0)
	{
		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->rgb->view("map/post", $data);
	}

	public function edit($map, $type, $num = 0)
	{
		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->rgb->view("map/edit", $data);
	}

	public function delete($map, $type, $num = 0)
	{
		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->rgb->view("map/delete", $data);
	}

}
