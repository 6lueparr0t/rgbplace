<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
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
<?php
	// #### setting 'Sign Up' Form
	echo form_open('sign/change', ['class' => 'sign', 'name' => 'sign-chage', 'id' => 'sign-change']);
	echo "<div class='info-box'>"
		."<input class='mail' name='mail' type='email' placeholder='Mail Address' required='true' minlength=2 maxlength=255 />"
		."</div>";

	echo "<div class='info-box'>"
		."<input class='check' name='check' type='button' value='send mail code' onclick='sendCode();'/>"
		."<input class='info' name='code' type='text' placeholder='Auth-Code 60:00' required='true' minlength=6 maxlength=6 pattern='^.{1,6}[0-9]+' title='숫자만 입력 가능합니다.' />"
		."</div>";


	echo "<div class='info-box'><input class='info' name='pswd' type='password' placeholder='Password' required='true' minlength=10 maxlength=255 /></div>"
		."<div class='info-box'><input class='info' name='conf' type='password' placeholder='Confirm Password' required='true' minlength=10 maxlength=255 /></div>"
		."<input type='hidden' name='recaptcha_response' id='recaptchaResponse' />";

	echo "<div class='info-box'><button type='submit'>"
			."Change Password"
		."</button></div>";
	echo form_close();
?>
<?php $this->root->end($path); ?>
