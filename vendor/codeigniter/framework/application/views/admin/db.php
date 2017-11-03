<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common(); ?>
<?
if($method==="clear") {
	shell_exec("cat /dev/null > shell/log");
}

if($method==="backup") {
	shell_exec("shell/backup");
}

if($method==="restore") {
	shell_exec("shell/restore");
}
?>

<pre>
<? system("cat shell/log") ?>
</pre>

<?

echo form_open('admin/db/backup', ['name' => 'backup', 'id' => 'backup'])
	.('<input type="submit" value="backup" />')
	.form_close();

echo form_open('admin/db/restore', ['name' => 'restore', 'id' => 'restore'])
	.('<input type="submit" value="restore" />')
	.form_close();

echo form_open('admin/db/clear', ['name' => 'clear', 'id' => 'clear'])
	.('<input type="submit" value="log clear" />')
	.form_close();

?>
<?php $this->rgb->end($path); ?>
