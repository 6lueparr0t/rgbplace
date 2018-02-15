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
		//please check your session
		$data['path'] = $path;
		$admin=$this->CI->session->userdata('admin');

		// admin session check
		if($admin !== TRUE) redirect("/");
		$this->CI->load->view($path, $data);
	}

	public function view($path, $data = [])
	{
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
	<meta charset='UTF-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'/>
	<meta name='viewport' content='width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes'/>

	<title>RGB PLACE</title>

	<link rel='icon' href='data:;base64,iVBORw0KGgo='>
	<link rel='stylesheet' href='/assets/css/dist/style.min.css'/>
</head>
<body>
		");
/* ---------------------------------------------------------------------- */

		echo ("<div id='sign'>");
		// Sign in check
		if(!$sign) {
			// #### setting 'Sign In' Form
			echo form_open('sign/in', ['class' => 'sign', 'name' => 'sign-in', 'id' => 'sign-in'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10]);

			echo "<button type='submit'><i class='fa fa-sign-in' aria-hidden='true'></i> Sign In</button>";
			echo "<button type='button' onClick=\"location.href='/sign'\"><i class='fa fa-user-plus' aria-hidden='true'></i> Sign Up</button>";
			echo form_close();

		} else {
			// #### setting 'Sign Out'

			$name = $this->CI->session->userdata('name');

			echo ("<div class='sign'>{$name} <a href='/#'>Modify</a> <a href='/sign/out'>Sign Out</a></div>");

			if($admin === TRUE) {
				$apikey = $this->CI->base->getAdminApiKey($name);
				echo "<span id='apikey' style='display:none'>{$apikey}</span>";
			}
		}
		echo ("</div>");

		echo("
		<div id='logo'>
			<a href='".base_url().DEFAULT_MAP."'><span class='real'>R</span><span class='gains'>G</span><span class='by'>B</span><span class='place'> PLACE</span></a>
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

		/* -------------------------------------------------- MENU Start -------------------------------------------------- */

		echo("
        <input class='menu' type='checkbox' id='menu-toggle' />
        <label class='menu' id='menu-button' for='menu-toggle'>
        <i class='open fa fa-bars' aria-hidden='true'></i>
        <i class='close fa fa-times' aria-hidden='true'></i>
		</label>

		<ul id='menu'>
		");

		$admin = $this->CI->session->userdata('admin');
		if($admin === TRUE) {
		echo("
		  <label class='menu' for='menu-admin'><i class='fa fa-code' aria-hidden='true' ></i> Admin
            <input class='menu' type='checkbox' id='menu-admin' />
              <i class='open fa fa-caret-up' aria-hidden='true'></i>
              <i class='close fa fa-caret-down' aria-hidden='true'></i>
		      <ul>
		        <label class='menu' for='menu-admin-1'>Admin
                  <input class='menu' type='checkbox' id='menu-admin-1' />
                  <i class='open fa fa-minus' aria-hidden='true'></i>
                  <i class='close fa fa-plus' aria-hidden='true'></i>
		          <ul>
		            <a class='menu' href='/admin/info' target='_blank'><li>Version</li></a>
		            <a class='menu' href='/admin/db'><li>Database Management</li></a>
		          </ul>
                </label>
		        <label class='menu' for='menu-admin-2'>Exam
                  <input class='menu' type='checkbox' id='menu-admin-2' />
                  <i class='open fa fa-minus' aria-hidden='true'></i>
                  <i class='close fa fa-plus' aria-hidden='true'></i>
		          <ul>
		            <a class='menu' href='/admin/generate_hash'><li>Generate Hash</li></a>
		            <a class='menu' href='/admin/animation'><li>Animation</li></a>
		            <a class='menu' href='/admin/restful'><li>RESTful Test</li></a>
		            <a class='menu' href='/admin/dragndrop_upload'><li>Drag & Drop Upload</li></a>
		          </ul>
                </label>
		      </ul>
          </label>
		");
		}

		echo("
		  <label class='menu' id='menu-map' for='map-search'>
            <input class='menu' type='text' id='map-search-box' placeholder='Map Search'/><i class='fa fa-search' id='map-search-button' aria-hidden='true'></i>
			<input class='menu' type='checkbox' id='map-search' />
            <i class='open fa fa-caret-up' aria-hidden='true'></i>
            <i class='close fa fa-caret-down' aria-hidden='true'></i>
			<ul>
			  <label class='menu' id='map-result' for=''>
			    <a href='#'><li>No Results</li></a>
			  </label>
			</ul>
          </label>
		  <a class='menu' href='/stage'>
            <i class='fa fa-street-view' aria-hidden='true'></i> Stage
		  </a>
          <!-- <label for='menu-stage'><i class='fa fa-street-view' aria-hidden='true'></i> Stage
            <input class='menu' type='checkbox' id='menu-stage' />
              <div class='menu' id='menu-stage-box'>
              </div>
          </label> -->
		  <!-- <label class='menu' for='menu-comments'><i class='fa fa-commenting-o' aria-hidden='true' ></i>
            <input class='menu' type='checkbox' id='menu-comments' />
              <div class='menu' id='menu-comments-box'>
			  </div>
          </label> -->
		  <label class='menu' for='menu-favorite'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>
            <input class='menu' type='checkbox' id='menu-favorite' /> Like
			  <div class='menu' id='menu-favorite-box'>
              </div>
          </label>
		  <label class='menu' for='menu-config'><i class='fa fa-cog' aria-hidden='true'></i>
            <input class='menu' type='checkbox' id='menu-config' />
            <i class='open fa fa-caret-up' aria-hidden='true'></i>
            <i class='close fa fa-caret-down' aria-hidden='true'></i>
		    <ul>
                <label class='menu' for='menu-config-1'>Fix On</label>
			</ul>
          </label>
		</ul>
		");
		/* -------------------------------------------------- MENU End -------------------------------------------------- */

		//if($this->CI->session->has_userdata('tab1') === false) $this->CI->session->set_userdata('tab1');

		$tab1 = $this->CI->uri->segment(1, "#");

		$tab2 = $this->CI->uri->segment(2, "none");
		$tab2_text = ($tab2=="none")?"#":$tab2;

		$tab3 = $this->CI->uri->segment(3, "#");
		if($tab3=="list" || $tab3=="#") {
			$tab3_class = "none";
			$tab3_text = "#";
		} else {
			$tab3_class = "num";
			$tab3_text = $tab3;
		}

		$tab4 = $this->CI->uri->segment(4, "#");
		
		echo ("
        <div class='status' id='status'>
          <a class='status type' href='/{$tab1}'>
            <span id='status-place'>{$tab1}</span>
          </a>
          <label class='status type {$tab2}'>
            <select class='status {$tab2}' id='status-type'>
			  <option>{$tab2_text}</option>
			  ");

		$type = ['#', 'best', 'free', 'info', 'photo', 'food', 'life', 'news', 'dev', 'public'];

		for($i=0; $i<count($type); $i++) {
			if($tab2_text === $type[$i]) continue;
			echo "<option>{$type[$i]}</option>";
		}

		echo("
            </select>
          </label>
          <a class='status type {$tab2} {$tab3_class}' href='/{$tab1}/{$tab2}/{$tab3}'>
            <span>{$tab3_text}</span>
          </a>
          <a class='status type none' href='/{$tab1}/{$tab2}/{$tab3}/{$tab4}'>
            <span>{$tab4}</span>
          </a>
        </div>
		");

	}
/*
	function warning($display = "none")
	{
		echo ("<p class='marquee {$display}'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>");
	}
*/
}
