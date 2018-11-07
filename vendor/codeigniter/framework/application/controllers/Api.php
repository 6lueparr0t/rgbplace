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

	public function search()
    {
        if($this->input->get('keyword')) {
            $data   = ['keyword' => $this->input->get('keyword')];
            $output = $this->base->getMap($data['keyword']);
        }

        if(empty($output)) $output = null;
        echo json_encode($output);
    }

	public function request($type=null, $val=null, $api_key=null)
	{
		$method = $this->input->method();
		if($method == 'get') {
			$data = $this->input->get();
		} else {
			$data = (array)json_decode($this->input->raw_input_stream)[0];
		}

		if(!$data) redirect("/");
		$info = explode('/', $data['info']);
		unset($data['info']);

		switch ($type) {
		case 'map':
			switch($this->input->method()) {
			case 'get':
				$ret = json_encode($this->map->navigation());
				break;
			}
			break;
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
					if($ret = $this->map->reply_insert($data, $info) && $data['message']) {
						$this->map->reply_count_update('up', $info);
					} else {
						$ret = 'Input Text Message';
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
			switch($val) {
			case 'post' :
				$ret = -1;
				if($this->map->vote($data, $info)) {
					$result = $this->map->post_select(null, $info, 'vote');
					$ret = $result->result()[0]->{$data['act']};

					if($ret > 20 && in_array($result->result()[0]->type, array('free', 'info')) ) {
						$this->map->move_to_best($data, $info);
					}	
				}
				break;
			case 'reply' :
				$ret = -1;
				if($this->map->vote($data, $info)) {
					$replyTable = $this->db->escape_str("map_{$info[1]}_reply");
					$result = $this->map->reply_select($replyTable, $info[3]);
					$ret = $result[$data['act']];
				}
				break;
			}
			break;

		case 'report' :
			if($this->map->report($data, $info)) {
				$ret = 1;
			} else {
				$ret = -1;
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
		$config['max_size']      = '102400';
		//$config['file_name'] = "{$link}_{$count}";
		
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

	public function geocode()
	{
		$latlng = $this->input->get('latlng');

		$result_type = 'administrative_area_level_1|administrative_area_level_2|sublocality_level_1|sublocality_level_2|sublocality_level_3';

		$url = 'https://maps.googleapis.com/maps/api/geocode/json?sensor=false&latlng='.$latlng.'&key='.GOOGLE_API_KEY.'&result_type='.$result_type;

		$ko = $this->curl('GET', $url.'&language=ko', null);
		$en = $this->curl('GET', $url.'&language=en', null);

		$data = array(
			'ko' => json_decode($ko),
			'en' => json_decode($en)
		);

		echo json_encode($data);
	}

	public function map($mode) {

		if($this->session->userdata('admin') !== FALSE) echo false;

		$data = (array)json_decode($this->input->raw_input_stream);

		if(!$data) redirect("/");

		/*
			Array
			(
				[0] => stdClass Object
				(
					[ko] => Array
					(
						[0] => 괴안동
						[1] => 소사구
						[2] => 부천시
						[3] => 경기도
						[4] => 대한민국
					)
				)
				[1] => stdClass Object
				(
					[en] => Array
					(
						[0] => Goean-dong
						[1] => Sosa-gu
						[2] => Bucheon-si
						[3] => Gyeonggi-do
						[4] => South Korea
					)
				)
			)
		 */

		//foreach($stdArray as $twoWayArray) {
			//foreach($twoWayArray as $key => $value) {
				//$data[$key] = (array)$value;
			//}
		//}

		switch($mode) {
		case 'creation' :
			echo $this->base->createMap($data);
			break;
		case 'destruction' :
			echo $this->base->destroyMap($data);
			break;
		} 
	}

	private function curl($method, $url, $data){

		## Reference : https://www.weichieprojects.com/blog/curl-api-calls-with-php/

		$curl = curl_init();

		switch ($method){
		case "POST":
			curl_setopt($curl, CURLOPT_POST, 1);
			if ($data)
				curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
			break;
		case "PUT":
		case "UPDATE":
		case "DELETE":
			curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
			if ($data)
				curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
			break;
		case "GET":
		default:
		if ($data)
			$url = sprintf("%s?%s", $url, http_build_query($data));
		}

		// OPTIONS:
		//curl_setopt($curl, CURLOPT_HTTPHEADER, array(
			//'APIKEY: 111111111111111111111',
			//'Content-Type: application/json',
		//));
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);

		// EXECUTE:
		$result = curl_exec($curl);
		if(!$result){die("Connection Failure");}
		curl_close($curl);
		return $result;
	}

}
