<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<div id='profile'>
	<div class='tab'>
		<div class='info'>info</div>
		<div class='upload'>upload</div>
		<div class='post'  >post</div>
		<div class='reply' >reply</div>
		<div class='vote'  >vote</div>
		<div class='report'>report</div>
	</div>
	<div id='info-area' class='none'>
		<div class='info'>
<?php

	echo ("<div class='tr'>");
		echo ("<div class='th'>uid</div>");
		echo ("<div class='td' id='uid'>{$uid}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Name</div>");
		echo ("<div class='td name'><input type='text' id='name' maxlength='20' value='{$name}' ".(($this->session->userdata("admin"))?'disabled':'')."/></div>");
	echo ("</div>");
if($this->session->userdata("admin") === false) {
	echo ("<div class='tr'>");
		echo ("<div class='th'>Info</div>");
		echo ("<div class='td'>Level : {$level} / Score : {$score}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>email</div>");
		echo ("<div class='td email'><input type='email' id='email' maxlength='400' value='{$email}'/></div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>First Date</div>");
		echo ("<div class='td'>{$ctim}</div>");
	echo ("</div>");
}
	echo ("<div class='tr'>");
		echo ("<div class='th'>Last Date</div>");
		echo ("<div class='td'>{$atim}</div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Password</div>");
		echo ("<div class='td pswd'><input type='password' id='pswd' maxlength='255' value=''/></div>");
		//echo ("<div class='td pswd'><input type='text' id='pswd' value='Not Yet ..'/></div>");
	echo ("</div>");
	echo ("<div class='tr'>");
		echo ("<div class='th'>Confirm</div>");
		echo ("<div class='td conf'><input type='password' id='conf' maxlength='255' value=''/></div>");
		//echo ("<div class='td conf'><input type='text' id='conf' value='Not Yet ..'/></div>");
	echo ("</div>");
?>
		</div>

		<div class="button-group">
			<div class='enable' id='save' name='save'>SAVE</div>
			<div class='enable' id='cancel' name='cancel'>CANCEL</div>
		</div>
	</div>

	<div id='upload-area'>
	</div>
	<div id='post-area'  >
	</div>
	<div id='reply-area' >
	</div>
	<div id='vote-area'  >
	</div>
	<div id='report-area'>
	</div>

</div>
<?php $this->root->end($path); ?>
