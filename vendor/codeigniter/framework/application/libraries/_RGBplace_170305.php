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
		if($this->CI->session->userdata('admin') !== TRUE) {
			redirect("/");	
		}
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
		$this->common_bottom($path, $minify);
		ob_end_flush();
	}

	function common_top()
	{

		// Common Head Line
		echo("
			<!DOCTYPE html><html lang='en'><head>
				<meta charset='utf-8'>
				<title>RGB place playground</title>
				<link rel='icon' type='image/png' href='/assets/img/ci-icon.png' />

				<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.2/semantic.min.css' />
				<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css' />
				<link rel='stylesheet' href='/assets/css/style.css' />

			</head><body>
			<a href='".base_url()."play'>Home</a>
			<script src='/assets/js/common/bundle.js'></script>
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

			$minify_url = strpos(current_url(), 'minify')?current_url():current_url()."/minify";
			echo $this->CI->session->userdata('name');
			echo $this->CI->session->userdata('admin')?"<a href='/admin'>Admin</a> <a href='{$minify_url}'>Minify</a> ":"";
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

	function common_bottom($path, $minify)
	{
		$path_arr = explode('/', uri_string());
		if(count($path_arr) >= 2) {
			echo("<p><a href='".current_url()."/..'>Back</a></p>");
		}

		// Push Alert
		echo ("<div id='notice'>"
			.$this->CI->session->flashdata('status').
			"</div>");

		$path_js    = "/assets/js/{$path}.js";
		$path_min   = "/assets/js/{$path}.min.js";

		if($minify === "on") {
			/*
			$babel_script = Babel\Transpiler::transformFile(".{$path_js}", [ 'blacklist' => [ 'useStrict' ] ]);
			$babel_script = str_replace("\"", "\\\"", $babel_script);

			shell_exec("echo \"{$babel_script}\" > .{$path_min}");

			$minifier = new Minify\JS(".{$path_min}");
			$minifier->minify(".{$path_min}");
			*/

			$path_arr= explode('/', $path);
			$length  = count($path_arr);

			$dir  = ".";
			$file = $path_arr[$length-1];

			for($i=0; $i<$length-1; $i++) {
				$dir .= "/".$path_arr[$i];
			}

			putenv("PATH=/usr/local/bin/");
			$output = shell_exec("
				gulp init  --dir={$dir} --file={$file};
				gulp babel --dir={$dir} --file={$file};
			");

			echo "<pre>{$output}<br/>Complete.</pre>";
		} elseif($minify === "off") {
			echo ("<script src='/assets/js/common/library.js'></script>");
			echo ("<script src=\"{$path_min}\"></script>");
		}
		echo ("</body></html>");

	}

	function warning($display = "none") {
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}

}