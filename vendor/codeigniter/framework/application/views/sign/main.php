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

<?php
	// #### setting 'Sign Up' Form
	echo form_open('sign/up', ['class' => 'sign', 'name' => 'sign-up', 'id' => 'sign-up'])
		."<div class='info-box'><input class='info' name='uid' type='text' placeholder='ID' required='true' minlength=6 maxlength=100 pattern='[0-9A-Za-z_-]+' title='영문 대소문자, 숫자_- 만 가능합니다.' /></div>"
		."<div class='info-box'><input class='info' name='name' type='text' placeholder='Nick Name' required='true' minlength=2 maxlength=20 pattern= '^.{1,20}[^\s\\x22\\x27](?!.*[\s\\x22\\x27])'title='2 ~ 20자 이상만 가능하고, 공백과 따옴표는 사용할 수 없습니다.'/></div>";


	echo "<br/><div class='info-box'>"
		."<input class='mail' name='mail' type='email' placeholder='Mail' required='true' minlength=2 maxlength=255 />"
		."<input class='check' name='check' type='button' value='check' onclick='sendCode();'/>"
		."</div>";

	echo "<div class='info-box'><input class='info' name='code' type='text' placeholder='Mail Auth Code - 60:00' required='true' minlength=6 maxlength=6 pattern='^.{1,6}[0-9]+' title='숫자만 입력 가능합니다.' /></div>";


	echo "<br/><div class='info-box'><input class='info' name='pswd' type='password' placeholder='Password' required='true' minlength=10 maxlength=255 /></div>"
		."<div class='info-box'><input class='info' name='conf' type='password' placeholder='Confirm Password' required='true' minlength=10 maxlength=255 /></div>"
		."<input type='hidden' name='recaptcha_response' id='recaptchaResponse' />";

	echo "<button class='fas fa-user-plus' type='submit'>"
			."&nbsp;&nbsp;Sign Up"
		."</button>";
	echo form_close();
?>
<?php $this->root->end($path); ?>
