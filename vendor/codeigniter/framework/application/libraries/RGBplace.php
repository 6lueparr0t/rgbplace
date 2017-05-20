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
		$admin=$this->CI->session->userdata('admin');

		// admin session check
		if($admin !== TRUE) redirect("/");

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

		$sign=$this->CI->session->userdata('signed_in');
		$admin=$this->CI->session->userdata('admin');
/* ---------------------------------------------------------------------- */
		echo("
<!DOCTYPE html>
<html lang='en'>
<head>
	<meta charset='utf-8'>
	<title>RGB place</title>
	<link rel='icon' href='data:;base64,iVBORw0KGgo='>
	<link rel='stylesheet' href='/assets/css/dist/style.min.css' />
</head>
<body>
		");
/* ---------------------------------------------------------------------- */

		// Sign in check
		if(!$sign) {
			// #### setting 'Sign In' Form
			echo form_open('sign/in', ['class' => 'sign', 'name' => 'sign-in', 'id' => 'sign-in'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10]);

			echo "<button type='submit'><i class='fa fa-sign-in' aria-hidden='true'></i> Sign In</button>";
			echo form_close();

			// #### setting 'Sign Up' Form
			echo form_open('sign/up', ['class' => 'sign', 'name' => 'sign-up', 'id' => 'sign-up'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6, 'pattern' => '[0-9A-Za-z_-]+', 'title' => '영문 대소문자와 숫자만 가능합니다.'])
				.form_input('name', '', ['placeholder' => 'Nick Name', 'required' => 'true', 'minlength' => 2, 'pattern' => '[^\s]+', 'title' => '공백(space)을 제거해주세요.'])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10])
				.form_password('conf', '', ['placeholder' => 'Confirm Password', 'required' => 'true']);

			echo "<button type='submit'><i class='fa fa-user-plus' aria-hidden='true'></i> Sign Up</button>";
			echo form_close();

		} else {
			// #### setting 'Sign Out'

			$name = $this->CI->session->userdata('name');

			echo ("<div class='status'>{$name} <a href='/#'>Modify</a> <a href='/sign/out'>Sign Out</a></div>");

			if($admin === TRUE) {
				$apikey = $this->CI->base->getAdminApiKey($name);
				echo "<span id='apikey' style='display:none'>{$apikey}</span>";
			}
		}

		echo("
		<div id='title'>
			<a href='".base_url()."'><span class='real'>R</span><span class='gains'>G</span><span class='by'>B</span><span class='place'> place</span></a>
		</div>
		");
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


	public function common()
	{

		//setting Common Menu
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 

		li : Menu Name
			- ul : Sub Menu Start
				- li : Sub Menu Name
				...
				- /li
			- /ul
		/li

		test code
		echo("<li>test<ul><li>wow<ul><li>testmenu</li></ul></li></ul></li>");

		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */

		/* ********** MENU Start ********** */
		echo("
        <input type='checkbox' id='menu-toggle' />
        <label id='menu-button' for='menu-toggle'>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </label>
		<ul id='menu'>
		");

		$admin = $this->CI->session->userdata('admin');
		if($admin === TRUE) {
		echo("
		  <label for='menu-admin'><i class='fa fa-code' aria-hidden='true' ></i> Admin
            <input type='checkbox' id='menu-admin' />
              <i class='open fa fa-caret-up' aria-hidden='true'></i>
              <i class='close fa fa-caret-down' aria-hidden='true'></i>
		      <ul>
		        <label for='menu-admin-1'>Admin
                  <input type='checkbox' id='menu-admin-1' />
                  <i class='open fa fa-minus' aria-hidden='true'></i>
                  <i class='close fa fa-plus' aria-hidden='true'></i>
		          <ul>
		            <a href='/admin/info' target='_blank'><li>PHP Info</li></a>
		          </ul>
                </label>
		        <label for='menu-admin-2'>Exam
                  <input type='checkbox' id='menu-admin-2' />
                  <i class='open fa fa-minus' aria-hidden='true'></i>
                  <i class='close fa fa-plus' aria-hidden='true'></i>
		          <ul>
		            <a href='/admin/generate_hash'><li>Generate Hash</li></a>
		            <a href='/admin/animation'><li>Animation</li></a>
		            <a href='/admin/restful'><li>RESTful Test</li></a>
		          </ul>
                </label>
		      </ul>
          </label>
		");
		}
		echo("
		  <label for='menu-map'><i class='fa fa-map-o' aria-hidden='true' ></i> Map
            <input type='checkbox' id='menu-map' />
              <i class='open fa fa-caret-up' aria-hidden='true'></i>
              <i class='close fa fa-caret-down' aria-hidden='true'></i>
              <div id='menu-map-box'>
              </div>
          </label>
		  <label for='menu-stage'><i class='fa fa-street-view' aria-hidden='true'></i> Stage
            <input type='checkbox' id='menu-stage' />
              <div id='menu-stage-box'>
              </div>
          </label>
<!--
		  <label for='menu-comments'><i class='fa fa-commenting-o' aria-hidden='true' ></i>
            <input type='checkbox' id='menu-comments' />
              <div id='menu-comments-box'>
			  </div>
          </label>
-->
		  <label for='menu-favorite'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>
            <input type='checkbox' id='menu-favorite' /> Like
			  <div id='menu-favorite-box'>
              </div>
          </label>
		  <label for='menu-config'><i class='fa fa-cog' aria-hidden='true'></i>
            <input type='checkbox' id='menu-config' />
              <div id='menu-config-box'>
              </div>
		    <ul></ul> 
          </label>
		</ul>
		");

		/* ********** MENU END ********** */
	}

	function warning($display = "none")
	{
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}

}
