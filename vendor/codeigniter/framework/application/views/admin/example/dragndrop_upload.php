<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common(); ?>

<? echo form_open('admin/upload', ['name' => 'upload', 'id' => 'upload']); ?>
  <label for="input_zone" class="drop_wait"></label>
  <input type="file" id="input_zone" name="userfile[]" multiple /> 
<? echo form_close(); ?>
<?php $this->rgb->end($path); ?>