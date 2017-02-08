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
		$this->sessionChk("admin");
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
	}

	public function end($path, $minify) 
	{
		$this->common_bottom();
		ob_end_flush();

		$path_js    = "/module/js/{$path}.js";
		$path_min   = "/module/js/{$path}.min.js";

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
		echo("
			<!DOCTYPE html><html lang='en'><head>
				<meta charset='utf-8'>
				<title>RGB place playground</title>
				<link rel='icon' type='image/png' href='/assets/images/ci-icon.png' />

				<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
				<link rel='stylesheet' href='/module/css/style.css'>

				<script src='/module/js/common/react.min.js'></script>
				<script src='/module/js/common/react-dom.min.js'></script>

			</head><body>
		");

		$this->CI->session->flashdata('status');

		// Sign in check
		if(!$this->CI->session->userdata('signed_in')) {
		// setting form
			echo form_open('sign/in', ['class' => 'navbar', 'name' => 'navbar', 'id' => 'navbar'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true'])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true'])
				.form_submit('in', 'Sign In')
				.form_close();
		} else {
			echo $this->CI->session->userdata('uid');
		}
	}

	function common_bottom()
	{
		echo('</body></html>');
	}

	function sessionChk($uid)
	{
		if($this->CI->session->uid !== $uid) {
			redirect("/");	
		}
	}


}
