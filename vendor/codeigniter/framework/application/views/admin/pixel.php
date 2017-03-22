<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); ?>

<?php

echo form_open('admin/pixel/insert', ['class' => '', 'name' => 'test', 'id' => 'test'])
                .form_input('test_input', '', ['placeholder' => 'test_input', 'required' => 'true', 'minlength' => 6])
                .form_submit('test_submit', 'test')
                .form_close();


?>

<?php $this->rgb->end($path); ?>
