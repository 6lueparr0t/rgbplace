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

	public function view($path, $minify="off")
	{
		//use in 'Controllers' Only
		$data['path']	= $path;
		$data['minify']	= $minify;

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
			$babel_script=Babel\Transpiler::transformFile(".{$path_js}", [ 'blacklist' => [ 'useStrict' ] ]);

			shell_exec("echo '{$babel_script}' > .{$path_min}");

			$minifier = new Minify\JS(".{$path_min}");
			$minifier->minify(".{$path_min}");

			redirect(current_url()."/../");
		} else {
			echo ("<script src=\"{$path_min}\"></script>");
		}
	}

	public function script()
	{
		echo (" <script src=\"/module/js/common/react.min.js\">     </script>\n");
		echo (" <script src=\"/module/js/common/react-dom.min.js\"> </script>\n");
	}

}
