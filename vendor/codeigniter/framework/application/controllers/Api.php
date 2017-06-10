<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Api_model', 'api');
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

	public function user($request)
	{
		
	}

	public function map_search()
	{

	}
}
