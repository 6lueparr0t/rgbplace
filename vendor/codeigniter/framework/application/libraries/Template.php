<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|
|	Role : common function in Template (using 'root')
|
*/

class Template {

	protected $CI;
	//Doctrine ORM
	protected $em;

    public function __construct()
    {
        $this->CI =& get_instance();
		$this->CI->allow=array('');
		$this->CI->load->library('doctrine');
		$this->em = $this->CI->doctrine->em;
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

    public function start($pageName = '')
    {
        $sign=$this->CI->session->userdata('signed_in');
        $admin=$this->CI->session->userdata('admin');
        
        
        
        /* ---------------------------------------------------------------------- */
        echo "<!DOCTYPE html>"
        ."<html lang='en'>"
        ."<head>"
        ."<meta charset='UTF-8'>"
        ."<meta http-equiv='X-UA-Compatible' content='IE=edge'/>";
        //content='width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes'

        echo "<meta name='viewport' content='width=device-width'/>"
        ."<meta name='keywords' content='RGBplace, RGB, 알지비, 플레이스, 한국, korea, 지역, 커뮤니티, 지역 기반, 여행, trip'/>"
        ."<meta name='description' content='RGBplace : 지역 기반 커뮤니티'/>"
        ."<meta property='og:title' content='RGBplace'/>"
        ."<!-- <meta property='og:image' content=''/> -->"
        ."<meta property='og:url' content='https://rgbplace.com'/>"
        ."<meta property='og:site_name' content='RGBplace'/>"
        ."<meta property='og:keywords' content='RGBplace, RGB, 알지비, 플레이스, 한국, korea, 지역, 커뮤니티, 지역 기반, 여행, trip'/>"
        ."<meta property='og:description' content='RGBplace : 지역 기반 커뮤니티'/>";

        echo "<title>".(($pageName === '')?"RGB place":$pageName)."</title>"
        //."<link rel='icon' href='data:;base64,iVBORw0KGgo='>"
		."<link rel='icon' href='/assets/img/favicon.ico'>"
        ."<link rel='stylesheet' href='/assets/ext/sweetalert2.min.css'/>"
        ."<link rel='stylesheet' href='/assets/css/dist/style.min.css'/>";

        // Google Tag Manager
        echo "<!-- Google Tag Manager -->"
            ."<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':"
            ."new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],"
            ."j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src="
            ."'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);"
            ."})(window,document,'script','dataLayer','GTM-59R2NC9');</script>"
            ."<!-- End Google Tag Manager -->";

        echo "<script>var user={sn:'".base64_encode($this->CI->session->userdata('sn')?$this->CI->session->userdata('sn'):0)."',uid:'".base64_encode($this->CI->session->userdata('uid')?$this->CI->session->userdata('uid'):'')."'};</script>";

        echo "</head>";

        $darkmode = ($this->CI->session->userdata('darkmode')==='on')?'dark':'';
		echo "<body class='{$darkmode}'>";
		echo '<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-59R2NC9"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->';
        /* ---------------------------------------------------------------------- */

        echo "<div id='sign'>";
        // Sign in check
        if(!$sign) {
            //회원가입 임시 제한
			echo "<button id='sign-btn' type='button' onClick=\"location.href='/sign'\"> Sign in </button>";
			echo "<span id='sign-in-tooltip' class='tooltip sign-in' style='display:none;'>Here!</span>";

        } else {
            // #### setting 'Sign Out'

            $name = $this->CI->session->userdata('name');
			$sn = $this->CI->session->userdata('sn');

			if($admin === true) {
				$msg = $this->em->find('Admin_info', $sn)->getMsgCount();
			} else {
				$msg = $this->em->find('User_info', $sn)->getMsgCount();
			}

            echo "<a href='/profile?tab=info'>{$name}</a>";
            echo "<div class='alert far fa-comment-dots' onclick='location.href=\"/profile?tab=message\"'>"."<span class='badge ".(($msg>0)?'show':'nobody')."'>{$msg}</span>"."</div>";

			switch($this->CI->session->userdata('oauth')) {
			case 'google' :
				echo "<div id='googleSignOut' class='g-signin2' style='display:none;'></div>";
				echo "<button onclick='signOut();document.location.href=\"/sign/out\";'> Sign out </button>";
				/* Google Sign-in js */
                echo "<script src='https://apis.google.com/js/api:client.js'></script>";
				break;
			case 'kakao' :
			case 'naver' :
			default :
				echo "<button onclick='document.location.href=\"/sign/out\";'> Sign out </button>";
				break;
			}

            if($admin === TRUE) {
                $apikey = $this->CI->base->setAdminApiKey($name);
                //echo "<span id='apikey' style='display:none'>{$apikey}</span>";
            }
        }
        echo "</div>";

        echo "<div class='counter'>
			<i class='fas fa-child'></i> : <span id='counter'> </span>
		</div>";

        echo "<div id='logo'>"
        ."<a href='".base_url().DEFAULT_MAP."'>"
        ."<span class='red'>R</span><span class='green'>G</span><span class='blue'>B</span><span class='place'>PLACE</span>"
        ."</a>"
        ."</div>";
    }

    public function end($path)
    {
        if (substr_count($path,'/') >= 3 ) {
            $t = explode('/', $path);
            $path = "{$t[0]}/{$t[1]}/{$t[2]}";
        }

        /* ---------------------------------------------------------------------- */
        echo "<div id='push'></div>";

        echo "<script src='/assets/ext/sweetalert2.min.js'></script>";
		//Include a polyfill for ES6 Promises (optional) for IE11
		echo "<script src='https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js'></script>";

        echo "<script src='/assets/js/comm/common.min.js'></script>"
        ."<script src='/assets/js/dist/{$path}.min.js'></script>";

        echo "<div id='footer'>"
        ."Suggestion"
        ."<div class='link'>"
        ."<a class='about' href='http://about.rgbplace.com'>about</a> / ".safe_mailto('admin@rgbplace.com', 'mail', array('class'=>'mail'))." / <a class='blog' href='https://blog.rgbplace.com'>blog</a>"
        ."</div>"
        ."</div>";

        echo "</body>"
        ."</html>";
        /* ---------------------------------------------------------------------- */
    }


    public function common()
    {

        //setting Common Menu

        /* -------------------------------------------------- MENU Start -------------------------------------------------- */

        echo "<input class='menu' type='checkbox' id='menu-toggle' />"
        ."<label class='menu' id='menu-button' for='menu-toggle'>"
        ."<i class='open fa fa-bars'></i>"
        ."<i class='close fa fa-times'></i>"
        ."</label>";

        echo("<ul id='menu'>");

        $admin = $this->CI->session->userdata('admin');
        if($admin === TRUE) {
            echo "<label class='menu' for='menu-admin'><i class='fa fa-code' ></i> Admin"
                ."<input class='menu' type='checkbox' id='menu-admin' />"
                ."<i class='open fa fa-caret-up'></i>"
                ."<i class='close fa fa-caret-down'></i>"
                ."<ul>"
                    ."<label class='menu' for='menu-admin-1'>Admin"
                    ."<input class='menu' type='checkbox' id='menu-admin-1' />"
                    ."<i class='open fa fa-minus'></i>"
                    ."<i class='close fa fa-plus'></i>"
                ."<ul>"
                    ."<a class='menu' href='/admin/info' target='_blank'><li>Version</li></a>"
                    ."<a class='menu' href='/admin/db'><li>Database Management</li></a>"
                    ."<a class='menu' href='/admin/map'><li>Map</li></a>"
                    ."<a class='menu' href='/admin/push'><li>Push</li></a>"
                    ."<a class='menu' href='/admin/image'><li>image</li></a>"
                    //."<a class='menu' href='/admin/geolocation'><li>Google Geolocation Api Test</li></a>"
                ."</ul>"
                ."</label>"
                    ."<label class='menu' for='menu-admin-2'>Exam"
                    ."<input class='menu' type='checkbox' id='menu-admin-2' />"
                    ."<i class='open fa fa-minus'></i>"
                    ."<i class='close fa fa-plus'></i>"
                ."<ul>";

            /* Admin Menu */

            echo "<a class='menu' href='/admin/generate_hash'><li>Generate Hash</li></a>"
            ."<a class='menu' href='/admin/animation'><li>Animation</li></a>"
            ."<a class='menu' href='/admin/restful'><li>RESTful Test</li></a>"
            ."<a class='menu' href='/admin/dragndrop_upload'><li>Drag & Drop Upload</li></a>";

            /* Admin Menu */

            echo "</ul>"
            ."</label>"
            ."</ul>"
            ."</label>";
        }

        echo "<label class='menu' id='menu-map' for='map-search'>"
        ."<input class='menu' type='text' id='map-search-box' placeholder='Map Search' autocomplete='nope' /><i class='fa fa-search' id='map-search-button'></i>"
        ."<input class='menu' type='checkbox' id='map-search' />"
        ."<i class='open fa fa-caret-up'></i>"
        ."<i class='close fa fa-caret-down'></i>"
        ."<ul>"
        ."<label class='menu' id='map-result' for=''>"
        ."<a href='/space/notice/1'><li>모든 지역 보기(View All List of Places)</li></a>"
        ."</label>"
        ."</ul>"
        ."</label>"
        ."<a class='menu' href='/stage'><i class='fa fa-street-view'></i> Stage</a>"
        ."<!-- <label for='menu-stage'><i class='fa fa-street-view'></i> Stage"
        ."<input class='menu' type='checkbox' id='menu-stage' />"
        ."<div class='menu' id='menu-stage-box'>"
        ."</div>"
        ."</label> -->"
        ."<!-- <label class='menu' for='menu-comments'><i class='fa fa-commenting-o' ></i>"
        ."<input class='menu' type='checkbox' id='menu-comments' />"
        ."<div class='menu' id='menu-comments-box'>"
        ."</div>"
        ."</label> -->"
        ."<a class='menu' id='menu-favorite'><i class='far fa-thumbs-up'></i> Like</a>";

        echo "<label class='menu' for='menu-config'><i class='fa fa-cog'></i>"
        ."<input class='menu' type='checkbox' id='menu-config' />"
        ."<i class='open fa fa-caret-up'></i>"
        ."<i class='close fa fa-caret-down'></i>"
        ."<ul>"
        ."<label class='menu switch'>dark mode";

        $darkmode_checked = ($this->CI->session->userdata('darkmode')==='on')?'checked':'';
        echo "<input class='switch' id='dark-mode' type='checkbox' {$darkmode_checked}>"
        ."<span class='switch slider round'></span>"
        ."</label>"
        ."</ul>"
        ."</label>"
        ."</ul>";
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

        echo "<div class='status' id='status'>"

        ."<a class='status type' href='/{$tab1}'>"
        ."<span id='status-place'>{$tab1}</span>"
        ."</a>"

        ."<label class='status type {$tab2}'>"
        ."<select class='status {$tab2}' id='status-type'>"
        ."<option id='type-{$tab2}'>{$tab2_text}</option>";
        for($i=0; $i<count($type); $i++) {
            if($tab2_text === $type[$i]) continue;
            echo "<option id='type-{$type[$i]}' >{$type[$i]}</option>";
        }
        echo "</select>"
        ."</label>";

        echo "<label class='status type {$tab2} num' href='/{$tab1}/{$tab2}/{$tab3}'>"
        ."<select class='status {$tab2} {$tab3_class}' id='status-num'>"
        ."<option id='type-num'>{$tab3_text}</option>"
        ."{$tab3_list}"
        ."</select>"
        ."</label>";

        echo "<label class='status type {$tab2} act' href='/{$tab1}/{$tab2}/{$tab3}/{$tab4}'>"
        ."<select class='status {$tab2}' id='status-act'>"
        ."<option id='type-act-default'>{$tab4}</option>"
        //."{$tab4_list}"
        ."</select>"
        ."</label>"

        ."</div>";

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

            echo "<div id='native-address'>"
                ."<a class='status type' href='/{$tab1}'>{$native_address}</a>"
            ."</div>"
            ."<div id='global-address'>"
                ."<a class='status type' href='/{$tab1}'>{$global_address}</a>"
            ."</div>";
        }

        echo "</div>";

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
