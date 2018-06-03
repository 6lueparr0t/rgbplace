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

	public function request($type=null, $act=null)
	{
		$this->session->userdata();
		if($type === "reply") {
			//$act : insert, modify, delete ..
			switch($act) {

			}
		}
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

		$this->root->view("map/page", $data);
	}

	public function link($map, $num)
	{
		$map  = strtolower($map);
		$type = $this->map->link($map, $num);
		$num  = $num;

		redirect("/{$map}/{$type}/{$num}");
	}

	public function list($map, $type)
	{
		if(!$this->check($type)) redirect("/");

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);

		$data['search']['page'   ] = urldecode($this->input->get('page'));

		// Map_model, search list ['title', 'content', 'reply', 'name', 'tag', 'date'];
		$data['search']['title'  ] = urldecode($this->input->get('title'));
		$data['search']['content'] = urldecode($this->input->get('content'));
		$data['search']['reply'  ] = urldecode($this->input->get('reply'));
		$data['search']['name'   ] = urldecode($this->input->get('name'));
		$data['search']['tag'    ] = urldecode($this->input->get('tag'));
		$data['search']['date'   ] = urldecode($this->input->get('date'));

		$this->root->view("map/list", $data);
	}

	public function post($map, $type, $num = 0)
	{
		if(!$this->check($type)) redirect("/");

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->root->view("map/post", $data);
	}

	public function edit($map, $type, $num = 0)
	{
		if(!$this->check($type)) redirect("/");

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->root->view("map/edit", $data);
	}

	public function delete($map, $type, $num = 0)
	{
		if(!$this->check($type)) redirect("/");

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->root->view("map/delete", $data);
	}

	private function check($type) {

		if(in_array($type, ['best','free','info','photo','food','life','news','dev','public'])) {
			return true;	
		} else {
			return false;
		}
	}

}
