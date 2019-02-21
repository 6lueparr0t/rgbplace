<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>
<?
if($mode==="run") {
    system("pkill push; go/push > /dev/null 2>/dev/null &");
    redirect('/admin/push');
}

if($mode==="kill") {
    shell_exec("pkill push");
    redirect('/admin/push');
}

?>

<input type="button" value="run" onclick="location.href='/admin/push/run';" /> <input type="button" value="kill" onclick="location.href='/admin/push/kill';" />

<pre>
<? system("pwd; ps -ef | grep 'go/push'") ?>
</pre>

<br/>

<div class='say'>
	<input type='text' id='message' />
	<button id='send'>Send</button>
	<button id='ajax'>AJAX Send</button>
</div>

<?php $this->root->end($path); ?>
