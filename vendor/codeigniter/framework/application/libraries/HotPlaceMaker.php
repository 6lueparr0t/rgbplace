<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : common function in HotPlaceMaker (using 'hotpm')
|
*/

use MatthiasMullie\Minify;

class HotPlaceMaker {

	protected $CI;

    public function __construct()
    {
		$this->CI =& get_instance();
    }

	public function sview($path, $data)
	{
		if(!array_key_exists('minify', $data)) $data['minify'] = "off";

		//use in 'Controllers !!Dev Mode!!' Only
		$data['path'] = $path;

		// admin session check
		$this->sessionChk("admin");
		$this->CI->load->view($path, $data);
	}

	public function view($path, $data)
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
	}

	public function end($path, $minify) 
	{
		ob_end_flush();

		$path_js    = "/module/js/{$path}.js";
		$path_min   = "/module/js/{$path}.min.js";

		if($minify === "on") {
			$babel_script = Babel\Transpiler::transformFile(".{$path_js}", [ 'blacklist' => [ 'useStrict' ] ]);
			$babel_script = str_replace("\"", "\\\"", $babel_script);

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

	public function script()
	{
		echo (" <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.slim.min.js\">     </script>\n");

		echo (" <script src=\"/module/js/common/react.min.js\">     </script>\n");
		echo (" <script src=\"/module/js/common/react-dom.min.js\"> </script>\n");
	}

	function sessionChk($uid) {
		if($this->CI->session->uid !== $uid) {
			redirect("/");	
		}
	}

}
