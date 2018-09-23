<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Api_model', 'api');
		$this->load->model('Map_model', 'map');
	}

	public function index()
	{
		redirect("/");
	}

	public function check()
	{
		$data = ['request' => $this->input->server('REQUEST_METHOD'), 'author' => $this->input->get_request_header('Authorization')];
		echo json_encode($data);

		return true;
	}

	public function admin($target = "", $data1 = "", $data2 = "", $data3 = "", $data4 = "")
	{
		$data = ['request' => $this->input->server('REQUEST_METHOD'), 'target' => $target, 'data1' => $data1, 'data2' => $data2, 'data3' => $data3 , 'data4' => $data4];

		if($this->session->userdata('admin') !== FALSE) redirect("/");
		switch($request) {
			case "get"		:
				echo $this->api->get($data);
				break;
			case "post"		:
				echo $this->api->post($data);
				break;
			case "patch"	:
			case "put"		:
				echo $this->api->put($data);
				break;
			case "delete"	:
				echo $this->api->delete($data);
				break;
			default :
		}
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
		unset($data['info']);

		switch ($type) {
		case 'edit':
			if($this->session->userdata('signed_in')) {
				switch($this->input->method()) {
				case 'get' :
					break;
				case 'post' :
					//save
					$ret = $this->map->post_insert($data, $info);
					break;
				case 'put':
					$ret = $this->map->post_update($data, $info);
					break;
				case 'delete':
					break;
				default :
					break;
				}
			} else {
				header('HTTP/1.1 401 Unauthorized');
				header('Content-Type: application/json; charset=UTF-8');
				$ret = 'login please';
			}
			break;
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
					if($ret = $this->map->reply_insert($data, $info)) {
						$this->map->reply_count_update('up', $info);
					}
				} else {
					header('HTTP/1.1 401 Unauthorized');
					header('Content-Type: application/json; charset=UTF-8');
					$ret = 'login please';
				}
				break;
			case 'put':
			case 'update' :
				if($this->session->userdata('signed_in')) {
					if($this->map->reply_update($data, $info)) {
						$ret = true;
					}
				} else {
					header('HTTP/1.1 401 Unauthorized');
					header('Content-Type: application/json; charset=UTF-8');
					$ret = 'login please';
				}
				break;
			case 'delete':
				if($this->session->userdata('signed_in')) {
					if($ret = $this->map->reply_delete($data, $info)) {
						$this->map->reply_count_update('down', $info);
					}
				} else {
					header('HTTP/1.1 401 Unauthorized');
					header('Content-Type: application/json; charset=UTF-8');
					$ret = 'login please';
				}
				break;
			default :
				break;
			}
			break;

		case 'post' :
			if($this->session->userdata('signed_in')) {
				switch($this->input->method()) {
				case 'delete' :
					$ret = $this->map->post_delete($info);
					break;
				default :
					break;
				}
			} else {
				header('HTTP/1.1 401 Unauthorized');
				header('Content-Type: application/json; charset=UTF-8');
				$ret = 'login please';
			}
			break;
		case 'vote' :
			if($this->map->vote($data, $info)) {
				$result = $this->map->post_select(null, $info, 'vote');
				$ret = $result->result()[0]->{$data['act']};
			}
			break;

		default :
			break;
		}

		echo $ret;
	}

	public function upload()
	{
		$this->load->library('upload');

		$config['upload_path'] = './upload';
		$config['allowed_types'] = 'gif|png|jpg|jpeg|bmp|txt|mp4|mp3|wmv|wav';
		$config['encrypt_name'] = true;
		$config['file_ext_tolower'] = true;
		//$config['max_size']      = '102400';
		//$config['file_name'] = "{$link}_{$count}";
		//
		$files = $_FILES;
		$data = [];
		$count = count($_FILES['userfile']['name']);
		for($i=0; $i<$count; $i++) {
			$_FILES['userfile']['name']= $files['userfile']['name'][$i];
			$_FILES['userfile']['type']= $files['userfile']['type'][$i];
			$_FILES['userfile']['tmp_name']= $files['userfile']['tmp_name'][$i];
			$_FILES['userfile']['error']= $files['userfile']['error'][$i];
			$_FILES['userfile']['size']= $files['userfile']['size'][$i];

			$this->load->library('upload', $config);
			$this->upload->initialize($config);
			if(!$this->upload->do_upload())
			{
				array_push($data, $this->upload->display_errors());
			} else {
				array_push($data, $this->upload->data());
				$data[$i]['file_path'] = $data[$i]['full_path'] = null;
				$data[$i]['default_path'] = UPLOAD_PATH;

				$this->base->setUploadList($data[$i], $this->session->userdata('admin'));
			}

		}

		echo json_encode($data);
	}
}
