<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<div id='profile'>
	<div class='tab'>
		<div class='info'>info</div>
		<div class='post'  >post</div>
		<div class='reply' >reply</div>
		<div class='upload'>upload</div>
<?php
		if(!$no) echo "<div class='message'>message</div>";
?>
	</div>
	<div id='info-area' class='page none'>
<?
$sw = ($no && $this->session->userdata("admin") == false)?'disabled':'enabled';
echo("
		<div class='table'>
			<div class='tr'>
				<div class='th'>uid</div>
				<div class='td' id='uid'>{$uid}</div>
			</div>
			<div class='tr'>
				<div class='th'>Name</div>
				<div class='td name'><input type='text' id='name' maxlength='20' value='{$name}' {$sw} /></div>
			</div>
			");

if($this->session->userdata("admin") === false || $no) {
	echo ("
			<div class='tr'>
				<div class='th'>Info</div>
				<div class='td'>Level : {$level} / Score : {$score}</div>
			</div>
	");

	if( !in_array($pswd, array('google')) ) {
	echo ("
			<div class='tr'>
				<div class='th'>mail</div>
				<div class='td mail'><input type='email' id='mail' maxlength='400' value='{$mail}' {$sw} /></div>
			</div>
		");
	}
	echo ("
			<div class='tr'>
				<div class='th'>First Date</div>
				<div class='td'>{$ctim}</div>
			</div>
	");
}
	echo("
			<div class='tr'>
				<div class='th'>Last Date</div>
				<div class='td'>{$atim}</div>
			</div>
	");

if($this->session->userdata("admin") === true || (!$no && !in_array($pswd, array('google'))) ) {
	echo("
			<div class='tr'>
				<div class='th'>Pass word</div>
				<div class='td pswd'><input type='password' id='pswd' maxlength='255' value=''/></div>
			</div>
			<div class='tr'>
				<div class='th'>Confirm</div>
				<div class='td conf'><input type='password' id='conf' maxlength='255' value=''/></div>
			</div>
	");
}

	echo("
		</div>
	");

echo("
		<div class='button-group'>
			<div class='{$sw}' id='save' name='save'>SAVE</div>
			<div class='{$sw}' id='cancel' name='cancel'>CANCEL</div>
			<div class='{$sw}' id='delete' name='delete'>DEL</div>
		</div>
");
?>
	</div>
	<div id='post-area' class='page none'>
		<div class='table'>
			<div class='tr'>
				<div class='th center'>No</div>
				<div class='th center'>Map</div>
				<div class='th center'>Info</div>
			</div>
			<div id='post-list' class='tr-group'>
			</div>
		</div>
		<div id='post-page' class='page'></div>
	</div>
	<div id='reply-area' class='page none'>
		<div class='table'>
			<div class='tr'>
				<div class='th center'>No</div>
				<div class='th center'>Map</div>
				<div class='th center'>Info</div>
			</div>
			<div id='reply-list' class='tr-group'>
			</div>
		</div>
		<div id='reply-page' class='page'></div>
	</div>
	<div id='upload-area' class='page none'>
		<div class='table'>
			<div class='tr'>
				<div class='th center'>No</div>
				<div class='th center'>Info</div>
			</div>
			<div id='upload-list'class='tr-group'>
			</div>
		</div>
		<div id='upload-page' class='page'></div>
	</div>
<?php
	if(!$no) {
		echo("<div id='message-area' class='page none'>
			<div class='table'>
				<div class='tr'>
					<div class='th center'>No</div>
					<div class='th center'>Map</div>
					<div class='th center'>Info</div>
				</div>
				<div id='message-list'class='tr-group'>
				</div>
			</div>
			<div id='message-page' class='page'></div>
		</div>");
	}
?>
</div>
<?php $this->root->end($path); ?>
