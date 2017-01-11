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
		$this->hotpm->sview('dev/main');
	}

	public function minify()
	{
		$data['minify'] = "on";
		$this->hotpm->sview('dev/main', $data);
	}

	public function on($pswd)
	{
		$data['pswd'] = $pswd;

		if($this->dev->adminPasswdChk($data) && $this->session->uid !=='admin') {
			//admin session create
			$admin = array(
					'uid'  => 'admin',
					'logged_in' => TRUE
			);
			$this->session->set_userdata($admin);
			echo ("<script>alert('Dev Switch On');location.href = '/';</script>");
		} else {
			redirect('/');
		}
	}

	public function off()
	{
		$this->hotpm->sessionChk('admin');

		//admin session delete
		$admin = array('uid');
		$this->session->unset_userdata($admin);
		echo ("<script>alert('Dev Swicth Off');location.href = '/';</script>");
	}

	public function start_page()
	{
		$this->hotpm->sview("dev/example/start_page");
	}

	public function react_practise()
	{
		$this->hotpm->sview("dev/example/react_practise");
	}

	public function react_tutorial()
	{
		$this->hotpm->sview("dev/example/react_tutorial");
	}

	public function generate_hash($string)
	{
		$data['string'] = urldecode($string);
		$this->hotpm->view('dev/example/generate_hash', $data);
	}

	public function info()
	{
		$this->hotpm->sessionChk('admin');
		phpinfo();
	}

}
