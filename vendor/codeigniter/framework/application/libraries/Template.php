<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Used Table : None
|
|	Role : common function in Template (using 'root')
|
*/

class Template {

	protected $CI;

    public function __construct()
    {
		$this->CI =& get_instance();
		$this->CI->allow=array('');
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
		echo("<!DOCTYPE html>");
		echo("<html lang='en'>");
		echo("<head>");
		echo("<meta charset='UTF-8'>");
		echo("<meta http-equiv='X-UA-Compatible' content='IE=edge'/>");
		//content='width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes'
		echo("<meta name='viewport' content='width=device-width'/>");

		echo("<title>RGB place</title>");

		echo("<link rel='icon' href='data:;base64,iVBORw0KGgo='>");
		echo("<link rel='stylesheet' href='/assets/ext/sweetalert2.min.css'/>");
		echo("<link rel='stylesheet' href='/assets/css/dist/style.min.css'/>");

		// Google Tag Manager
		echo ("<!-- Google Tag Manager -->".
			"<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':".
			"new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],".
			"j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=".
			"'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);".
			"})(window,document,'script','dataLayer','GTM-59R2NC9');</script>".
			"<!-- End Google Tag Manager -->");

		echo("<script>var user={sn:'".base64_encode($this->CI->session->userdata('sn')?$this->CI->session->userdata('sn'):0)."',uid:'".base64_encode($this->CI->session->userdata('uid')?$this->CI->session->userdata('uid'):'')."'};</script>");

		echo("</head>");

		$darkmode = ($this->CI->session->userdata('darkmode')==='on')?'dark':'';
		echo("<body class='{$darkmode}'>");
/* ---------------------------------------------------------------------- */

		echo ("<div id='sign'>");
		// Sign in check
		if(!$sign) {
			// #### setting 'Sign In' Form
			echo form_open('sign/in', ['class' => 'sign', 'name' => 'sign-in', 'id' => 'sign-in'])
				.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6])
				.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10]);

			echo "<button type='submit' id='login' onclick='this.setCustomValidity(\"\")'> <i class='fas fa-sign-in-alt'></i> Sign In </button>";
			echo "<button type='button' id='logout' onClick=\"location.href='/sign'\"> <i class='fa fa-user-plus'></i> Sign Up </button><br/>";

			// Google Sign-in Tag
			//echo "<div id='google' class='g-signin2' data-onsuccess='onSignIn' data-width='164' data-height='20' data-longtitle='true' > </div>";

			echo '<div id="gSignInWrapper">'
				.'<div id="google" class="customGPlusSignIn">'
					.'<span class="icon"></span>'
					.'<span class="buttonText">Google</span>'
				.'</div>'
			.'</div>';
			echo form_close();

		} else {
			// #### setting 'Sign Out'

			$name = $this->CI->session->userdata('name');

			echo "<div class='sign'>";
			echo "<a href='/profile?tab=info'>{$name}</a>";

			if($this->CI->session->userdata('google')) {
				echo "<div class='g-signin2' style='display:none;'></div>";
				echo "<button onclick='signOut();document.location.href=\"/sign/out\";'> <i class='fas fa-sign-out-alt'></i> Sign Out </button>";
			} else {
				echo "<button onclick='document.location.href=\"/sign/out\";'> <i class='fas fa-sign-out-alt'></i> Sign Out </button>";
			}
			echo "</div>";

			if($admin === TRUE) {
				$apikey = $this->CI->base->setAdminApiKey($name);
				//echo "<span id='apikey' style='display:none'>{$apikey}</span>";
			}
		}
		echo ("</div>");

		echo "<div class='counter'>
			<i class='fas fa-child'></i> : <span id='counter'> </span>
		</div>";

		echo("<div id='logo'>");
		echo("<a href='".base_url().DEFAULT_MAP."'>");
		echo("<span class='red'>R</span><span class='green'>G</span><span class='blue'>B</span><span class='place'>PLACE</span>");
		echo("</a>");
		echo("</div>");
	}

	public function end($path) 
	{
		if (substr_count($path,'/') >= 3 ) {
			$t = explode('/', $path);
			$path = "{$t[0]}/{$t[1]}/{$t[2]}";
		}

/* ---------------------------------------------------------------------- */
		echo "<div id='push'></div>";

		/* Google Sign-in js */
		echo "<script src='https://apis.google.com/js/api:client.js'></script>";
		echo "<script src='/assets/js/comm/common.min.js'></script>"
		."<script src='/assets/js/dist/{$path}.min.js'></script>"
		."<script src='/assets/ext/sweetalert2.min.js'></script>";

		echo("
<div id='footer'>
	Suggestion
	<div class='link'>
		<a class='page' href='http://git.rgbplace.com' target='_blank'>page</a> / ".safe_mailto('admin@rgbplace.com', 'mail', array('class'=>'mail'))."
	</div>
	<div>
	</div>
</div>
		");

		echo("</body>");
		echo("</html>");
/* ---------------------------------------------------------------------- */
	}


	public function common()
	{

		//setting Common Menu

		/* -------------------------------------------------- MENU Start -------------------------------------------------- */

		echo("<input class='menu' type='checkbox' id='menu-toggle' />");
		echo("<label class='menu' id='menu-button' for='menu-toggle'>");
		echo("<i class='open fa fa-bars'></i>");
		echo("<i class='close fa fa-times'></i>");
		echo("</label>");

		echo("<ul id='menu'>");

		$admin = $this->CI->session->userdata('admin');
		if($admin === TRUE) {
			echo("<label class='menu' for='menu-admin'><i class='fa fa-code' ></i> Admin");
			echo("<input class='menu' type='checkbox' id='menu-admin' />");
			echo("<i class='open fa fa-caret-up'></i>");
			echo("<i class='close fa fa-caret-down'></i>");
			echo("<ul>");
			echo("<label class='menu' for='menu-admin-1'>Admin");
			echo("<input class='menu' type='checkbox' id='menu-admin-1' />");
			echo("<i class='open fa fa-minus'></i>");
			echo("<i class='close fa fa-plus'></i>");
			echo("<ul>");
			echo("<a class='menu' href='/admin/info' target='_blank'><li>Version</li></a>");
			echo("<a class='menu' href='/admin/db'><li>Database Management</li></a>");
			echo("<a class='menu' href='/admin/map'><li>Map</li></a>");
			echo("<a class='menu' href='/admin/push'><li>Push</li></a>");
			//echo("<a class='menu' href='/admin/geolocation'><li>Google Geolocation Api Test</li></a>");
			echo("</ul>");
			echo("</label>");
			echo("<label class='menu' for='menu-admin-2'>Exam");
			echo("<input class='menu' type='checkbox' id='menu-admin-2' />");
			echo("<i class='open fa fa-minus'></i>");
			echo("<i class='close fa fa-plus'></i>");
			echo("<ul>");

			/* Admin Menu */

			echo("<a class='menu' href='/admin/generate_hash'><li>Generate Hash</li></a>");
			echo("<a class='menu' href='/admin/animation'><li>Animation</li></a>");
			echo("<a class='menu' href='/admin/restful'><li>RESTful Test</li></a>");
			echo("<a class='menu' href='/admin/dragndrop_upload'><li>Drag & Drop Upload</li></a>");

			/* Admin Menu */

			echo("</ul>");
			echo("</label>");
			echo("</ul>");
			echo("</label>");
		}

		echo("<label class='menu' id='menu-map' for='map-search'>");
		echo("<input class='menu' type='text' id='map-search-box' placeholder='Map Search'/><i class='fa fa-search' id='map-search-button'></i>");
		echo("<input class='menu' type='checkbox' id='map-search' />");
		echo("<i class='open fa fa-caret-up'></i>");
		echo("<i class='close fa fa-caret-down'></i>");
		echo("<ul>");
		echo("<label class='menu' id='map-result' for=''>");
		echo("<a href='#'><li>No Results</li></a>");
		echo("</label>");
		echo("</ul>");
		echo("</label>");
		echo("<a class='menu' href='/stage'><i class='fa fa-street-view'></i> Stage</a>");
		echo("<!-- <label for='menu-stage'><i class='fa fa-street-view'></i> Stage");
		echo("<input class='menu' type='checkbox' id='menu-stage' />");
		echo("<div class='menu' id='menu-stage-box'>");
		echo("</div>");
		echo("</label> -->");
		echo("<!-- <label class='menu' for='menu-comments'><i class='fa fa-commenting-o' ></i>");
		echo("<input class='menu' type='checkbox' id='menu-comments' />");
		echo("<div class='menu' id='menu-comments-box'>");
		echo("</div>");
		echo("</label> -->");
		echo("<a class='menu' id='menu-favorite'><i class='far fa-thumbs-up'></i> Like</a>");

		echo("<label class='menu' for='menu-config'><i class='fa fa-cog'></i>");
			echo("<input class='menu' type='checkbox' id='menu-config' />");
				echo("<i class='open fa fa-caret-up'></i>");
				echo("<i class='close fa fa-caret-down'></i>");
			echo("<ul>");
				echo("<label class='menu switch'>dark mode");

					$darkmode_checked = ($this->CI->session->userdata('darkmode')==='on')?'checked':'';
					echo("<input class='switch' id='dark-mode' type='checkbox' {$darkmode_checked}>");
					echo("<span class='switch slider round'></span>");
				echo("</label>");
			echo("</ul>");
		echo("</label>");

		echo("</ul>");
		/* -------------------------------------------------- MENU End -------------------------------------------------- */

		//if($this->CI->session->has_userdata('tab1') === false) $this->CI->session->set_userdata('tab1');
		$type = ['#'];
		$type = array_merge(TYPE_LIST);

		$tab1 = $this->CI->uri->segment(1, "#");

		$tab2 = $this->CI->uri->segment(2, "none");
		$tab2_text = (!in_array($tab2, $type))?"#":$tab2;

		$tab3 = $this->CI->uri->segment(3, "#");
		if($tab3=="list" || $tab2=="#") {
			$tab3_class = "none";
			$tab3_text = "LIST";
			$tab3_list = "";
		} else {
			$tab3_class = "num";
			$tab3_text = $tab3;
			$tab3_list = "<option id='type-list'>LIST</option>";
		}

		$tab4 = $this->CI->uri->segment(4, "#");
		if($tab3=="list" || $tab3=="#") {
			$tab4 = '#';
		} else {
			$tab4 = ($tab4!='#')?$tab4:'view';
			//$tab4_list = "";
		}
		
		echo("<div class='status' id='status'>");

		echo("<a class='status type' href='/{$tab1}'>");
		echo("<span id='status-place'>{$tab1}</span>");
		echo("</a>");

		echo("<label class='status type {$tab2}'>");
		echo("<select class='status {$tab2}' id='status-type'>");
		echo("<option id='type-{$tab2}'>{$tab2_text}</option>");
		for($i=0; $i<count($type); $i++) {
			if($tab2_text === $type[$i]) continue;
			echo "<option id='type-{$type[$i]}' >{$type[$i]}</option>";
		}
		echo("</select>");
		echo("</label>");

		echo("<label class='status type {$tab2} num' href='/{$tab1}/{$tab2}/{$tab3}'>");
		echo("<select class='status {$tab2} {$tab3_class}' id='status-num'>");
		echo("<option id='type-num'>{$tab3_text}</option>");
		echo("{$tab3_list}");
		echo("</select>");
		echo("</label>");

		echo("<label class='status type {$tab2} act' href='/{$tab1}/{$tab2}/{$tab3}/{$tab4}'>");
		echo("<select class='status {$tab2}' id='status-act'>");
		echo("<option id='type-act-default'>{$tab4}</option>");
		//echo("{$tab4_list}");
		echo("</select>");
		echo("</label>");

		echo("</div>");

		// get map title
		echo ("<div class='address'>");
		if($this->CI->session->userdata('map') != $this->CI->uri->segment(1)) {
			$this->CI->session->set_userdata(
				array(
					'map' => $this->CI->uri->segment(1)
				)
			);

			$map_name = $this->CI->session->userdata('map');
			$address = $this->CI->base->getMapTItle($map_name);

			if($address) {
				$this->CI->session->set_userdata(array('map_detail' => $address));
			} else {
				$this->CI->session->set_userdata(array('map_detail' => ''));
			}
		}

		$map_detail = $this->CI->session->userdata('map_detail');
		if($map_detail) {
			$native = (array)json_decode($map_detail['native'][0]);
			$global = (array)json_decode($map_detail['global'][0]);

			$native_address =  implode(" ", array_reverse($native['address']) );
			$global_address =  implode(", ", $global['address'] );

			echo ("<div id='native-address'>");
			echo ("<a class='status type' href='/{$tab1}'>{$native_address}</a>");
			echo ("</div>");

			echo ("<div id='global-address'>");
			echo ("<a class='status type' href='/{$tab1}'>{$global_address}</a>");
			echo ("</div>");
		}

		echo ("</div>");

	}

	public function check($type) {

        $type_list = TYPE_LIST;
        if(in_array($type, $type_list)) {
            return true;
        } else {
            return false;
        }
    }

}
