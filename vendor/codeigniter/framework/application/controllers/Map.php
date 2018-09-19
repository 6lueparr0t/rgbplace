<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Map extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Map_model','map');
		//$this->allow=array('list', 'post', 'page', 'link', 'request', 'search');
	}

	public function index()
	{
		redirect("/");
	}

	public function search()
	{
		if($this->input->get('keyword')) {
			$data   = ['keyword' => $this->input->get('keyword')];
			$output = $this->base->getMap($data['keyword']);
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

		if(!$type) {
			redirect("/{$map}");
			exit();
		}
		redirect("/{$map}/{$type}/{$num}");
	}

	public function list($map, $type)
	{
		if(!$this->root->check($type)) redirect("/");

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
		if(!$this->root->check($type)) redirect("/");

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->root->view("map/post", $data);
	}

	public function edit($map, $type, $num = 0)
	{
		if(!$this->root->check($type)) {
			redirect("/");
		} else {
			if(!$this->session->userdata('signed_in')) {
				redirect("/{$type}/list");
			} 
		}

		$data['mode'] = 'post';
		$data['title'] = "";
		$data['content'] = "";
		//$data['upload'] = "[]";

		if($num > 0) {
			$info = [$map, $type, $num];
			$ret = $this->map->post_select(null, $info);

			if($ret->result()[0]->uid == $this->session->userdata('uid') || $this->session->userdata('admin')) {
				$data['mode'] = 'put';
				$data['title'] = htmlspecialchars_decode($ret->result()[0]->title);
				$data['content'] = htmlspecialchars_decode($ret->result()[0]->content);
				//$data['upload'] = htmlspecialchars_decode($ret->result()[0]->upload);
			} else {
				redirect("/{$map}/{$type}/{$num}");
			}
		}

		//$data['upload'] = "Z".base64_encode($data['upload']);

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->root->view("map/edit", $data);
	}

	public function _delete($map, $type, $num = 0)
	{
		if(!$this->root->check($type)) redirect("/");

		$data['map' ] = strtolower($map);
		$data['type'] = strtolower($type);
		$data['num' ] = $num;

		$this->root->view("map/delete", $data);
	}

}
