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
		if($this->CI->session->userdata('admin') !== TRUE) redirect("/");	

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
	<title>RGB place</title>
	<link rel='icon' type='image/png' href='/assets/img/ci-icon.png' />
	<link rel='stylesheet' href='/assets/css/dist/style.min.css' />
</head>
<body>
	<a class='' id='home' href='".base_url()."'>Home</a>
		");
/* ---------------------------------------------------------------------- */

		// Sign in check
		if(!$this->CI->session->userdata('signed_in')) {
			// #### setting 'Sign In' Form
			echo form_open('sign/in', ['class' => 'pure-form', 'name' => 'sign-in', 'id' => 'sign-in'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10]);

			echo "<button name='in' type='submit'><i class='fa fa-sign-in' aria-hidden='true'></i> Sign In</button>";
			echo form_close();

			// #### setting 'Sign Up' Form
			echo form_open('sign/up', ['class' => 'pure-form', 'name' => 'sign-up', 'id' => 'sign-up'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6, 'pattern' => '[0-9A-Za-z_-]+', 'title' => '영문 대소문자와 숫자만 가능합니다.'])
				.form_input('name', '', ['placeholder' => 'Nick Name', 'required' => 'true', 'minlength' => 2, 'pattern' => '[^\s]+', 'title' => '공백(space)을 제거해주세요.'])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10])
				.form_password('conf', '', ['placeholder' => 'Confirm Password', 'required' => 'true']);

			echo "<button name='up' type='submit'><i class='fa fa-user-plus' aria-hidden='true'></i> Sign Up</button>";
			echo form_close();

		} else {
			// #### setting 'Sign Out'

			echo $this->CI->session->userdata('name');
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
	<script src='/assets/js/comm/common.min.js'></script>
	<script src='/assets/js/dist/{$path}.min.js'></script>
</body>
</html>
		");
/* ---------------------------------------------------------------------- */
	}


	public function menu()
	{
		echo "<div class='user-menu'>";

		echo "</div>";
		if($this->CI->session->userdata('admin')) {
			
			$base_url = base_url()."admin";
			echo "<div class='admin-menu'><ul><a href='{$base_url}'>Admin</a>";
			$admin = $this->CI->base->getAdminMenu('admin');
			$exam = $this->CI->base->getAdminMenu('exam');


			for($i=0; $i<count($admin); $i++) {
				echo "<li><a href='{$base_url}/{$admin[$i]}' style='display:block;'>{$admin[$i]}</a></li>";
			}
			echo "</ul>";

			echo "<ul>Exam";
			for($i=0; $i<count($exam); $i++) {
				echo "<li><a href='{$base_url}/{$exam[$i]}' style='display:block;'>{$exam[$i]}</a></li>";
			}
			echo "</ul></div>";
		}

	}

	function warning($display = "none")
	{
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}

}
