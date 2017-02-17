<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : common function in RGB place (using 'rgb')
|
*/

use MatthiasMullie\Minify;

class RGBplace {

	protected $CI;

    public function __construct()
    {
		$this->CI =& get_instance();
    }

	public function sview($path, $data = ['minify' => "off"])
	{
		if(!array_key_exists('minify', $data)) $data['minify'] = "off";

		//use in 'Controllers !!Dev Mode!!' Only
		$data['path'] = $path;

		// admin session check
		$this->adminCheck();
		$this->CI->load->view($path, $data);
	}

	public function view($path, $data = ['minify' => "off"])
	{
		if(!array_key_exists('minify', $data)) $data['minify'] = "off";

		//use in 'Controllers' Only
		$data['path'] = $path;

		$this->CI->load->view($path, $data);
	}

	public function start()
	{
		function output($buffer) {

			$search = array(
					'/\>[^\S ]+/s',  // strip whitespaces after tags, except space
					'/[^\S ]+\</s',  // strip whitespaces before tags, except space
					'/(\s)+/s'       // shorten multiple whitespace sequences
					);

			$replace = array(
					'>',
					'<',
					'\\1'
					);

			$buffer = preg_replace($search, $replace, $buffer);

			return $buffer;
		}

		ob_start("output");
		$this->common_top();

		$this->common_left();
		$this->common_right();

	}

	public function end($path, $minify) 
	{
		$this->common_bottom();
		ob_end_flush();

		$path_js    = "/assets/js/{$path}.js";
		$path_min   = "/assets/js/{$path}.min.js";

		if($minify === "on") {
			$babel_script = Babel\Transpiler::transformFile(".{$path_js}", [ 'blacklist' => [ 'useStrict' ] ]);
			$babel_script = str_replace("\"", "\\\"", $babel_script);

			echo("<p><a href='".current_url()."/..'>뒤로가기</a></p>");

			shell_exec("echo \"{$babel_script}\" > .{$path_min}");

			$minifier = new Minify\JS(".{$path_min}");
			$minifier->minify(".{$path_min}");

			/* activate 2 line if you hate 'slash' */
			//$path_arr	= explode('/', current_url());
			//redirect("/{$path_arr[(count($path_arr)-2<0?0:count($path_arr)-2)]}");
			//redirect(current_url()."/..");
		} else {
			echo ("<script src=\"{$path_min}\"></script>");
		}
	}

	public function warning($display = "none") {
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}

	function common_top()
	{

		// Common Head Line
		echo("
			<!DOCTYPE html><html lang='en'><head>
				<meta charset='utf-8'>
				<title>RGB place playground</title>
				<link rel='icon' type='image/png' href='/assets/images/ci-icon.png' />

				<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
				<link rel='stylesheet' href='/assets/css/style.css'>

				<script src='/assets/js/libs/react.min.js'></script>
				<script src='/assets/js/libs/react-dom.min.js'></script>

			</head><body>
		");
	}
	
	function common_left()
	{
		// Sign In, Out, Up
		echo ("<div id='sidemenu-left'>");

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
				.form_password('conf', '', ['placeholder' => 'Confirm Password', 'required' => 'true', 'oninput' => 'a(this)'])
				.form_submit('up', 'Sign Up')
				.form_close();

			echo ("<script>");
			Babel\Transpiler::transform("function a(i) {
				if (i.value != document.querySelector('#sign-up input[name=\'pswd\']').value) {
					i.setCustomValidity('패스워드를 확인해주세요.\\nPlease Check your Password.');
				} else {
					i.setCustomValidity('');
				}
			}");
			echo ("</script>");

		} else {
			// #### setting 'Sign Out'
			echo $this->CI->session->userdata('name');
			echo("<a href='/sign/out'>Sign Out</a>");
		}

		echo ("</div>");
	}

	function common_right()
	{
		echo ("<div id='sidemenu-right'>");
		// Chat System
		echo ("</div>");
	}

	function common_bottom()
	{
		// Push Alert
		echo ("<div id='notice'>"
			.$this->CI->session->flashdata('status').
			"</div>");

		echo('</body></html>');
	}

	function adminCheck()
	{
		if($this->CI->session->userdata('admin') !== TRUE) {
			redirect("/");	
		}
	}


}
