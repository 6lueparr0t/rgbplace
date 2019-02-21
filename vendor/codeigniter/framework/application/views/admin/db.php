<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>
<?
if($mode==="clear") {
	shell_exec("cat /dev/null > log/db");
	redirect('/admin/db');
}

if($mode==="backup") {
	shell_exec("shell/backup");
	redirect('/admin/db');
}

if($mode==="restore") {
	shell_exec("shell/restore");
	redirect('/admin/db');
}
?>

<pre>
<? system("cat log/db") ?>
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
<?php $this->root->end($path); ?>
