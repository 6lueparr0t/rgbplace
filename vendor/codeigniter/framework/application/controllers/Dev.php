<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dev extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Dev_model', 'dev');
	}

	public function index()
	{
		$data['dev_list'] = ["info", "start_page", "react_practise", "react_tutorial", "react_jquery", "generate_hash"];
		$this->rgb->sview('dev/main', $data);
	}

	public function minify($page = "main")
	{
		$data['minify'] = "on";
		$this->rgb->sview("dev/{$page}", $data);
	}

	public function start_page()
	{
		$this->rgb->sview("dev/example/start_page");
	}

	public function react_practise()
	{
		$this->rgb->sview("dev/example/react_practise");
	}

	public function react_tutorial()
	{
		$this->rgb->sview("dev/example/react_tutorial");
	}

	public function react_jquery($minify = "")
	{
		($minify === "minify")? $data['minify'] = "on":$data['minify'] = "off";
		$this->rgb->sview("dev/example/react_jquery", $data);
	}

	public function generate_hash($string)
	{
		$data['string'] = urldecode($string);
		$this->rgb->view('dev/example/generate_hash', $data);
	}

	public function info()
	{
		$this->rgb->adminCheck();
		phpinfo();
	}

}
