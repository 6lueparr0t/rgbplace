<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();

$key = bin2hex($this->encryption->create_key(16));

echo $key;

echo form_open('admin/generate_hash', ['class' => '', 'name' => 'admform', 'id' => 'admform'])
	.form_input('pswd', '', ['placeholder' => 'Password', 'required' => 'true'])
	.form_submit('proc', 'Process')
	.form_close();

echo "Your Password : {$pswd}".br(2);
echo "Hash Value : {$hash}";

$this->root->end($path); ?>
