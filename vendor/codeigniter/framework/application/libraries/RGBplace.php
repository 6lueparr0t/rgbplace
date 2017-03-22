<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : common function in RGB place (using 'rgb')
|
*/

class RGBplace {

	protected $CI;

    public function __construct()
    {
		$this->CI =& get_instance();
    }

	public function sview($path, $data = [])
	{
		//use in 'Controllers !!Dev Mode!!' Only
		$data['path'] = $path;

		// admin session check
		if($this->CI->session->userdata('admin') !== TRUE) {
			redirect("/");	
		}
		$this->CI->load->view($path, $data);
	}

	public function view($path, $data = [])
	{
		//use in 'Controllers' Only
		$data['path'] = $path;

		$this->CI->load->view($path, $data);
	}

	public function start()
	{

/* ---------------------------------------------------------------------- */
		echo("
<!DOCTYPE html>
<html lang='en'>
<head>
	<meta charset='utf-8'>
	<title>RGB place playground</title>
	<link rel='icon' type='image/png' href='/assets/img/ci-icon.png' />

	<link rel='stylesheet' href='/assets/css/dest/style.min.css' />
</head>
<body>
	<a class='' id='home' href='".base_url()."'>Home</a>
		");
/* ---------------------------------------------------------------------- */

		// Sign in check
		if(!$this->CI->session->userdata('signed_in')) {
			// #### setting 'Sign In' Form
			echo form_open('sign/in', ['class' => '', 'name' => 'sign-in', 'id' => 'sign-in'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10])
				.form_submit('in', 'Sign In')
				.form_close();

			// #### setting 'Sign Up' Form
			echo form_open('sign/up', ['class' => '', 'name' => 'sign-up', 'id' => 'sign-up'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6, 'pattern' => '[0-9A-Za-z_-]+'])
				.form_input('name', '', ['placeholder' => 'Nick Name', 'required' => 'true', 'minlength' => 2])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10])
				.form_password('conf', '', ['placeholder' => 'Confirm Password', 'required' => 'true'])
				.form_submit('up', 'Sign Up')
				.form_close();

		} else {
			// #### setting 'Sign Out'

			echo $this->CI->session->userdata('name');
			echo $this->CI->session->userdata('admin')?"<a href='/admin'>Admin</a> ":"";
			echo("<a href='/sign/out'>Sign Out</a>");
		}

	}

	public function end($path) 
	{
		if (substr_count($path,'/') >= 3 ) {
			$t = explode('/', $path);
			$path = "{$t[0]}/{$t[1]}/{$t[2]}";
		}

/* ---------------------------------------------------------------------- */
		echo ("
	<div id='push'></div>
	<script src='/assets/js/dest/common.min.js'></script>
	<script src='/assets/js/dest/{$path}.min.js'></script>
</body>
</html>
		");
/* ---------------------------------------------------------------------- */
	}

	function warning($display = "none") {
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}

}
