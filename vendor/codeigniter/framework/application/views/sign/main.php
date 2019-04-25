<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<script src='https://www.google.com/recaptcha/api.js?render=6LftwYcUAAAAAMPx9v768MNJyjbkcBEM36o6J0sM'></script>
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
		<div style='width: 100px;'></div>
	</div>
	<div class='sign-cell'>
<?php
	// #### setting 'Sign In' Form
	echo form_open('sign/in', ['class' => 'sign', 'name' => 'sign-in', 'id' => 'sign-in'])
		."<input type='hidden' name='http_referer' value='{$_SERVER['HTTP_REFERER']}'/>"
		."<div class='info-box'><input class='info' name='uid' type='text' placeholder='ID' required='true' minlength=6 maxlength=100/></div>"
		."<div class='info-box'><input class='info' name='pswd' type='password' placeholder='Password' required='true' minlength=10 maxlength=255 /></div>";

	echo "<div class='info-box'><button type='submit' id='login' onclick='this.setCustomValidity(\"\")'> <i class='fas fa-sign-in-alt'></i> Sign in </button></div>";

	// Google Sign-in Tag
	echo '<div class="info-box"><div id="gSignInWrapper">'
		.'<div id="google" class="customGPlusSignIn">'
		.'<span class="icon"></span>'
		.'<span class="buttonText">Google</span>'
		.'</div></div></div>';

	echo form_close();


?>
    </div>
	<div class='sign-cell'>
		<div>or</div>
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
		<div style='width: 100px;'></div>
	</div>
  </div>
</div>
<?php $this->root->end($path); ?>
