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

	public function test()
	{
		//$realm = 'test';

		////user => password
		//$users = array('admin' => 'mypass', 'guest' => 'guest');


		//if (empty($_SERVER['PHP_AUTH_DIGEST'])) {
		//	$this->output->set_header('HTTP/1.1 401 Unauthorized');
		//	$this->output->set_header('WWW-Authenticate: Digest realm="'.$realm.
		//			'",qop="auth",nonce="'.uniqid().'",opaque="'.md5($realm).'"');

		//	die('사용자가 취소 버튼을 눌렀을 때 보내지는 텍스트');
		//}

		//// PHP_AUTH_DIGEST 변수 조사
		//if (!($data = $this->_http_digest_parse($_SERVER['PHP_AUTH_DIGEST'])) || !array_key_exists(trim($data['username'], '"'), $users))
		//	die('Wrong Credentials!');

		//// ok, 유효한 username & password
		//echo $data['username'] . '으로 로그인 되었습니다.';


		//$data = ['request' => $this->input->server('REQUEST_METHOD')];

		//echo json_encode($data);

		//return true;
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
	// http auth 헤더를 처리하는 함수
	function _http_digest_parse($txt)
	{
		// 빠진 데이터에 대한 보호
		$needed_parts = array('nonce'=>1, 'username'=>1, 'uri'=>1, 'response'=>1);
		$data = array();

		preg_match_all('/(\w+)=(?:([\'"])([^\2]+)]\2|([^\s,]+))/', $txt, $matches, PREG_SET_ORDER);

		foreach ($matches as $m) {
			$data[$m[1]] = trim($m[3]?$m[3]:$m[4], '"');
			unset($needed_parts[$m[1]]);
		}

		return $needed_parts ?false:$data;
	}

}
