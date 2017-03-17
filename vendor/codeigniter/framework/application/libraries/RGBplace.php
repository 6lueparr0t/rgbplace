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

	public function sview($path)
	{
		//use in 'Controllers !!Dev Mode!!' Only
		$data['path'] = $path;

		// admin session check
		if($this->CI->session->userdata('admin') !== TRUE) {
			redirect("/");	
		}
		$this->CI->load->view($path, $data);
	}

	public function view($path)
	{
		//use in 'Controllers' Only
		$data['path'] = $path;

		$this->CI->load->view($path, $data);
	}

	public function start()
	{

		// Common Head Line
		echo("
<!DOCTYPE html>
<html lang='en'>
<head>
	<meta charset='utf-8'>
	<title>RGB place playground</title>
	<link rel='icon' type='image/png' href='/assets/img/ci-icon.png' />

	<link rel='stylesheet' href='/assets/css/style.min.css' />
	<script src='/assets/js/common/common.js'></script>

</head>
<body>
	<a class='none' id='home' href='".base_url()."'>Home</a>
		");
	}

	public function end($path) 
	{
//		$path_min   = "/assets/js/{$path}.min.js";
//		<script src=\"{$path_min}\"></script>

		echo ("
	<div id='push'>{$this->CI->session->flashdata('status')}</div>
</body>
</html>
		");
	}

	function warning($display = "none") {
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}

}
