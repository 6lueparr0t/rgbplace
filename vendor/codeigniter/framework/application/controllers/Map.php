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

	public function request($type=null, $val=null, $api_key=null)
	{
		//if(!$this->session->userdata('signed_in') || $type) exit;
		if($this->input->method() == 'get') {
			$data = $this->input->get();
		} else {
			$data = (array)json_decode($this->input->raw_input_stream)[0];
		}

		$info = explode('/', $data['info']);

		//echo json_encode($data);
		//exit;

		switch ($type) {
		case 'reply': 
			//$act : insert, modify, delete ..
			switch($this->input->method()) {
			case 'get':
				if(!isset($data['page'])) {
					$start = $page = 'last';
				} else {
					$page = $data['page'];
					$start = (($page>1)?$page-1:0)*REPLY_LIST_ROWS_LIMIT;
				}

				$search = [
					'page' => $page
				];

				$ret = json_encode($this->map->reply($info[1], $info[2], $info[3], $start, 0, $search));
				break;
			case 'post':
				if($this->session->userdata('signed_in')) {
					if($this->map->reply_insert($data, $info)) {
						$ret = $this->map->reply_count_update('up', $info);
					}
				} else {
					header('HTTP/1.1 401 Unauthorized');
					header('Content-Type: application/json; charset=UTF-8');
					$ret = 'login please';
				}
				break;
			case 'put':
			case 'update':
				break;
			case 'delete':
				break;
			default :
				break;
			}
			break;

		case 'post' :
			break;

		default :
			break;
		}

		echo $ret;
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

		$type_list = TYPE_LIST;
		if(in_array($type, $type_list)) {
			return true;	
		} else {
			return false;
		}
	}

}
