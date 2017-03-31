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

	public function admin($request, $table = "", $id = "", $data1 = "", $data2 = "")
	{

		$data = ['request' => $request, 'table' => $table, 'id' => $id, 'data1' => $data1, 'data2' => $data2];

		if($this->session->userdata('admin') !== FALSE) redirect("/");
		switch($request) {
			case "get"		:
				echo $this->api->get($data);
				break;
			case "post"		:
				echo $this->api->post($data);
				break;
			case "update"	:
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
}
