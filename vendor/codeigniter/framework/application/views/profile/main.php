<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<div id='profile'>
	<div class='info'>
<?php

if($this->session->userdata("admin") === true) {
	echo ("<div class='tr'>");
		echo ("<div class='th'>uid</div>");
		echo ("<div class='td' id='uid'>{$uid}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Name</div>");
		echo ("<div class='td' id='name' contenteditable='true'>{$name}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Last Date</div>");
		echo ("<div class='td'>{$atim}</div>");
	echo ("</div>");
} else {
	echo ("<div class='tr'>");
		echo ("<div class='th'>uid</div>");
		echo ("<div class='td' id='uid'>{$uid}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Name</div>");
		echo ("<div class='td' id='name' contenteditable='true'>{$name}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>email</div>");
		echo ("<div class='td email' id='email'  contenteditable='true'>{$email}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>First Date</div>");
		echo ("<div class='td'>{$ctim}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Last Date</div>");
		echo ("<div class='td'>{$atim}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Info</div>");
		echo ("<div class='td'>Level : {$level} / Score : {$score}</div>");
	echo ("</div>");
}
?>
	</div>

	<div class="button-group">
		<div class='enable' id='save' name='save'>SAVE</div>
		<div class='enable' id='cancel' name='cancel'>CANCEL</div>
	</div>
</div>
<?php $this->root->end($path); ?>
