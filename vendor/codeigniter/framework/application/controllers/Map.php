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

	public function page($map)
	{
		$mainPost = $this->base->getMainPost($map);

		if($mainPost) {
			$title = $mainPost->title;
			$content = html_entity_decode($mainPost->content);
			preg_match_all('/<img.*?src=.[\'"](.*?).[\'"]/i', $content, $img);

			$url = "/{$map}/{$mainPost->type}/{$mainPost->no}";
		}

		$data['scene'] = @($img[1][0])?$img[1][0]:"/assets/img/placeholder.jpg";
		$data['map'  ] = strtolower($map);
		$data['title'] = @$title;
		$data['url'  ] = @$url;

		$this->root->view("map/page", $data);
	}

	public function link($map, $num)
	{
		$map  = strtolower($map);
		$type = $this->map->link($map, $num);
		$num  = $num;

		$get = '';
		if($_SERVER['QUERY_STRING']) {
			$get = "?".$_SERVER['QUERY_STRING'];	
		}

		if(!$type) {
			redirect("/{$map}{$get}");
			exit();
		}
		redirect("/{$map}/{$type}/{$num}{$get}");
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

		$this->map->post_hit($data);

		$this->root->view("map/post", $data);
	}

	public function edit($map, $type, $num = 0)
	{
		if(!$this->root->check($type)) {
			redirect("/");
		} else {
			if(!$this->session->userdata('signed_in')) {
				redirect("/{$type}/list");
			} else if( in_array($type, array("best", "notice")) && !$this->session->userdata('admin')) {
				redirect("/");
			}
		}

		$this->session->set_userdata(['mode' => 'post']);
		$data['title'] = "";
		$data['content'] = "";
		//$data['upload'] = "[]";

		$this->session->unset_userdata('upload');

		if($num > 0) {
			$info = [null, $map, $type, $num];
			$ret = $this->map->post_select(null, $info);

			if( ( $ret->row()->uid == $this->session->userdata('uid') && !in_array($type, array("best", "notice")) ) || $this->session->userdata('admin')) {
				//$data['mode'] = 'update';
				$this->session->set_userdata(['mode' => 'put']);
				$data['title'] = stripslashes(preg_replace('/\\\n/i','\n',$ret->row()->title));
				$data['content'] = stripslashes( preg_replace('/\\\n/i','<br/>', htmlspecialchars($ret->row()->content) ) );

				$this->session->set_userdata('upload', $ret->row()->upload); 

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
