<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Minify extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		redirect('/', 'refresh');
	}

	public function play($path)
	{
		$result = $this->gulp($path);
		echo $result;
	}

	function gulp($path)
	{
		if($this->session->userdata('admin') !== TRUE) redirect("/");

		$path_min   = "/assets/js/{$path}.min.js";

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

		return "done";
	}
}
