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
<?php
$sw = ($no && $this->session->userdata("admin") == false)?'disabled':'enabled';
echo("<div class='table'>");

if( $this->session->userdata("admin") === true || !$no ) {
	echo ("
		<div class='tr'>
			<div class='th'>uid</div>
			<div class='td' id='uid'>{$uid}</div>
		</div>
	");
}

echo("
	<div class='tr'>
		<div class='th'>Name</div>
		<div class='td name'><input type='text' id='name' maxlength='20' value='{$name}' data-restore='{$name}' {$sw} /></div>
	</div>
");

if($this->session->userdata("admin") === false || $no) {
	echo ("
			<div class='tr'>
				<div class='th'>Info</div>
				<div class='td'>Level : {$level} / Score : {$score}</div>
			</div>
	");

	if( !in_array($pswd, OAUTH_LIST) && !$no ) {
	echo ("
			<div class='tr'>
				<div class='th'>mail".(($sw=='enabled')?"<input type='button' class='check' id='check' name='check' value='check' />":"")."
				</div>
				<div class='td mail {$sw}'>
					<input type='email' id='mail' name='mail' maxlength='400' value='{$mail}' data-restore='{$mail}' {$sw}/>
				</div>
			</div>
			<div class='tr hidden'>
				<div class='th'>Auth Code</div>
				<div class='td code'>
					<input type='text' id='code' name='code' placeholder='Expiry Time - 60:00' required='true' minlength=6 maxlength=6 pattern='^.{1,6}[0-9]+' title='숫자만 입력 가능합니다.' />
				</div>
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

if($this->session->userdata("admin") === true || (!$no && !in_array($pswd, OAUTH_LIST)) ) {
	echo("
			<div class='tr'>
				<div class='th'>Pass word</div>
				<div class='td pswd'><input type='password' id='pswd' maxlength='255' value='' autocomplete='new-password' /></div>
			</div>
			<div class='tr'>
				<div class='th'>Confirm</div>
				<div class='td conf'><input type='password' id='conf' maxlength='255' value='' autocomplete='new-password' /></div>
			</div>
	");
}

	echo("
		</div>
	");

echo("
		<div class='button-group'>
			<div class='{$sw}' id='save' name='save'>SAVE</div>
			<div class='{$sw}' id='reset' name='reset'>RESET</div>
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
echo("
	<div id='message-area' class='page none'>
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
	</div>
");
	}
?>
</div>
<?php $this->root->end($path); ?>
