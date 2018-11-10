<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<?php
	// #### setting 'Sign Up' Form
	echo form_open('profile/modify', ['class' => 'profile', 'name' => 'profile', 'id' => 'profile']);

	echo form_close();
?>
<?php $this->root->end($path); ?>
