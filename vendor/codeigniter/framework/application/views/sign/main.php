<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<?php
	// #### setting 'Sign Up' Form
	echo form_open('sign/up', ['class' => 'sign', 'name' => 'sign-up', 'id' => 'sign-up'])
		.form_input('uid', '', ['placeholder' => 'ID', 'required' => 'true', 'minlength' => 6, 'maxlength' => 100, 'pattern' => '[0-9A-Za-z_-]+', 'title' => '영문 대소문자와 숫자만 가능합니다.'])
		.form_input('name', '', ['placeholder' => 'Nick Name', 'required' => 'true', 'minlength' => 2, 'maxlength' => 20, 'pattern' => '^.{2,20}[^\s\x22\x27](?!.*[\s\x22\x27])', 'title' => '공백(space)을 제거해주세요.'])
		.form_password('pswd', '', ['placeholder' => 'Password', 'required' => 'true', 'minlength' => 10, 'maxlength' => 255])
		.form_password('conf', '', ['placeholder' => 'Confirm Password', 'required' => 'true', 'minlength' => 10, 'maxlength' => 255]);

	echo "<button type='submit'><i class='fa fa-user-plus' aria-hidden='true'></i> Sign Up</button>";
	echo form_close();
?>
<?php $this->root->end($path); ?>
