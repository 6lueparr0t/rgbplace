<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->menu();

echo form_open('admin/generate_hash', ['class' => '', 'name' => 'admform', 'id' => 'admform'])
	.form_input('pswd', '', ['placeholder' => 'Password', 'required' => 'true'])
	.form_submit('proc', 'Process')
	.form_close();

echo "Your Password : {$pswd}".br(2);
echo "Hash Value : {$hash}";

$this->rgb->end($path); ?>
