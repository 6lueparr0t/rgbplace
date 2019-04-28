<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src='//www.google.com/recaptcha/api.js?render=6LftwYcUAAAAAMPx9v768MNJyjbkcBEM36o6J0sM'></script>
<script>
grecaptcha.ready(function() {
grecaptcha.execute('6LftwYcUAAAAAMPx9v768MNJyjbkcBEM36o6J0sM', {action: 'homepage'})
	.then(function(token) {
		var recaptchaResponse = document.getElementById('recaptchaResponse');
		recaptchaResponse.value = token;
	});
});
</script>
<div class='sign-table'>
  <div class='sign-row'>
	<div class='sign-cell'>
		<div class='space'></div>
	</div>
	<div class='sign-cell'>
<?php
	// #### setting 'Sign In' Form
	echo form_open('sign/in', ['class' => 'sign', 'name' => 'sign-in', 'id' => 'sign-in'])
		."<input type='hidden' name='http_referer' value='".@(($this->session->userdata('http_referer'))?$this->session->userdata('http_referer'):'/sign')."'/>"
		."<div class='info-box'><input class='info' name='uid' type='text' placeholder='ID' required='true' minlength=6 maxlength=100/></div>"
		."<div class='info-box'><input class='info' name='pswd' type='password' placeholder='Password' required='true' minlength=10 maxlength=255 /></div>";

	echo "<div class='info-box'><button type='submit' id='login' onclick='this.setCustomValidity(\"\")'> <i class='fas fa-sign-in-alt'></i> Sign in </button></div>";

	// Google Sign-in Tag
	echo '<div class="info-box"><div id="gSignInWrapper">'
		.'<div id="google" class="customGPlusSignIn">'
		.'<svg fill="currentColor" preserveAspectRatio="xMidYMid meet" height="1em" width="1em" viewBox="0 0 40 40"><g><path d="m20.1 17.5h16.2q0.3 1.5 0.3 2.9 0 4.8-2 8.7t-5.8 5.9-8.7 2.1q-3.5 0-6.6-1.3t-5.5-3.7-3.7-5.4-1.3-6.7 1.3-6.7 3.7-5.4 5.5-3.7 6.6-1.3q6.7 0 11.5 4.4l-4.6 4.5q-2.8-2.6-6.9-2.6-2.8 0-5.3 1.4t-3.9 4-1.4 5.4 1.4 5.4 3.9 4 5.3 1.4q2 0 3.6-0.5t2.7-1.3 1.8-1.9 1.2-1.9 0.5-1.8h-9.8v-5.9z"></path></g></svg>'
		.'<div class="buttonText">Sign in with <span class="bolder">Google<span></div>'
		.'</div>'
		.'</div></div>';

	// Kakao Sign-in Tag
	echo '<div class="info-box">'
		.'<div id="kakao" class=" ">'
		.'<svg preserveAspectRatio="xMidYMid meet" width="1em" height="1em" viewBox="0 0 200.000000 184.000000" ><g transform="translate(0,184) scale(0.1,-0.1)" fill="#000000" stroke="none"> <path d="M772 1806 c-346 -66 -618 -271 -720 -544 -19 -52 -26 -92 -30 -182 -5 -139 9 -207 70 -330 35 -69 60 -102 138 -180 58 -58 122 -110 163 -134 81 -46 79 -23 18 -248 -32 -122 -37 -150 -26 -164 7 -11 19 -15 29 -11 10 4 106 67 214 140 l197 133 70 -8 c223 -26 514 40 706 161 344 216 465 573 305 897 -80 160 -219 289 -410 380 -157 74 -259 96 -471 100 -125 2 -202 -1 -253 -10z"/> </g> </svg>'
		.'<div class="buttonText">Sign in with <span class="bolder">KAKAO<span></div>'
		.'</div>'
		.'</div>';

	// Naver Sign-in Tag
	echo '<div class="info-box">'
		.'<div id="naverIdLogin"></div>'
		.'<div id="naver" class="">'
		.'<svg preserveAspectRatio="xMidYMid meet" width="1em" height="1em" viewBox="0 0 510.000000 474.000000"><g transform="translate(0.000000,474.000000) scale(0.100000,-0.100000)" fill="#FFFFFF" stroke="none"> <path d="M0 2370 l0 -2370 920 0 920 0 2 1002 3 1001 714 -1001 714 -1002 914 0 913 0 0 2370 0 2370 -910 0 -910 0 -2 -1048 -3 -1047 -710 1017 c-390 560 -714 1031 -720 1048 l-9 30 -918 0 -918 0 0 -2370z"/> </g> </svg>'
		.'<div class="buttonText">Sign in with <span class="bolder">Naver<span></div>'
		.'</div>'
		.'</div>';

	echo form_close();


?>
    </div>
	<div class='sign-cell divider'>
		<div class='or'>or</div>
	</div>
    <div class='sign-cell'>
<?php
	// #### setting 'Sign Up' Form
	echo form_open('sign/up', ['class' => 'sign', 'name' => 'sign-up', 'id' => 'sign-up'])
		."<div class='info-box'><input class='info' name='uid' type='text' placeholder='ID' required='true' minlength=6 maxlength=100 pattern='[0-9A-Za-z_-]+' title='영문 대소문자, 숫자_- 만 가능합니다.' /></div>"
		."<div class='info-box'><input class='info' name='name' type='text' placeholder='Nick Name' required='true' minlength=2 maxlength=20 pattern= '^.{1,20}[^\s\\x22\\x27](?!.*[\s\\x22\\x27])'title='2 ~ 20자 이상만 가능하고, 공백과 따옴표는 사용할 수 없습니다.'/></div>";


	echo "<div class='info-box'>"
		."<input class='mail' name='mail' type='email' placeholder='Mail Address' required='true' minlength=2 maxlength=255 />"
		."</div>";

	echo "<div class='info-box'>"
		."<input class='check' name='check' type='button' value='send mail code' onclick='sendCode();'/>"
		."<input class='info none' name='code' type='text' placeholder='Mail Auth-Code - 60:00' required='true' minlength=6 maxlength=6 pattern='^.{1,6}[0-9]+' title='숫자만 입력 가능합니다.' />"
		."</div>";


	echo "<div class='info-box'><input class='info' name='pswd' type='password' placeholder='Password' required='true' minlength=10 maxlength=255 /></div>"
		."<div class='info-box'><input class='info' name='conf' type='password' placeholder='Confirm Password' required='true' minlength=10 maxlength=255 /></div>"
		."<input type='hidden' name='recaptcha_response' id='recaptchaResponse' />";

	echo "<div class='info-box'><button type='submit'>"
			."<i class='fas fa-user-plus'></i>&nbsp;&nbsp;Sign up"
		."</button></div>";
	echo form_close();
?>
    </div>
	<div class='sign-cell'>
		<div class='space'></div>
	</div>
  </div>
</div>
<?php $this->root->end($path); ?>
