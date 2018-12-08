<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<div id='profile'>
	<div class='tab'>
		<div class='info'>info</div>
		<div class='post'  >post</div>
		<div class='upload'>upload</div>
		<div class='reply' >reply</div>
		<div class='vote'  >vote</div>
	</div>
	<div id='info-area' class='page none'>
		<div class='table'>
<?
echo("
	<div class='tr'>
		<div class='th'>uid</div>
		<div class='td' id='uid'>{$uid}</div>
	</div>
	<div class='tr'>
		<div class='th'>Name</div>
		<div class='td name'><input type='text' id='name' maxlength='20' value='{$name}' ".(($this->session->userdata("admin"))?'disabled':'')."/></div>
	</div>
");
if($this->session->userdata("admin") === false) {
	echo ("
	<div class='tr'>
		<div class='th'>Info</div>
		<div class='td'>Level : {$level} / Score : {$score}</div>
	</div>
	<div class='tr'>
		<div class='th'>email</div>
		<div class='td email'><input type='email' id='email' maxlength='400' value='{$email}'/></div>
	</div>
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
	<div class='tr'>
		<div class='th'>Pass word</div>
		<div class='td pswd'><input type='password' id='pswd' maxlength='255' value=''/></div>
	</div>
	<div class='tr'>
		<div class='th'>Confirm</div>
		<div class='td conf'><input type='password' id='conf' maxlength='255' value=''/></div>
	</div>
		</div>

		<div class='button-group'>
			<div class='enable' id='save' name='save'>SAVE</div>
			<div class='enable' id='cancel' name='cancel'>CANCEL</div>
		</div>
	</div>
");
?>
	<div id='post-area' class='page'>
<?php
	//echo $post;
?>
	</div>
	<div id='upload-area' class='page'>
		<div class='table'>
		<div class='tr'>
			<div class='th center'>No</div>
			<div class='th center'>Info</div>
		</div>
<?php
$upload_array = (array)json_decode($upload)->history;
for ( $i = count($upload_array)-1; $i >= 0; $i--) {
	if(!isset($upload_array[$i]->date)) {
		$upload_array[$i]->date = '';
	}

	echo("
		<div class='tr'>
			<div class='td center width-50'>{$i}</div>
			<div class='td'>
				{$upload_array[$i]->client_name}<br/>
				{$upload_array[$i]->file_type}<br/>
				{$upload_array[$i]->file_size} KB<br/>
				{$upload_array[$i]->date}<br/>
			</div>
		</div>
	");
}
?>
		</div>
	</div>
	<div id='reply-area' class='page'>
<?php
	//echo $reply;
?>
	</div>
	<div id='vote-area' class='page'>
<?php
	//echo $vote;
?>
	</div>

</div>
<?php $this->root->end($path); ?>
