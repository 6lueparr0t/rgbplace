<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Push extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('Config_model', 'conf');
	}

	public function index() {
		redirect("/");
	}

	public function send ($type = null, $act = null) {
		$method = $this->input->method();
		$data = (array)json_decode($this->input->raw_input_stream)[0];

		if(!$data) redirect("/");
        $data = $this->db->escape_str($data);
        $info = explode('/', $this->db->escape_str($data['info']));
        unset($data['info']);

		// act : alert, noti
		// mode : uni, multi, broad
		// recv : id1, 'id1|id2', ''
		// map : map1, 'map1|map2', ''
		// post : post number, ''
		switch($type) {
		case 'test' :
			//$data['act'] = 'alert';
			//$data['mode'] = 'broad';
			$data['recv'] = '';
			$data['map' ] = $info[1];
			//$data['msg'] = 'test';
			$data['key' ] = WS_KEY;
			$this->push->send(json_encode($data));
			break;
		}

		echo json_encode(true);
	}

	private function curl ($method, $url, $data) {

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
