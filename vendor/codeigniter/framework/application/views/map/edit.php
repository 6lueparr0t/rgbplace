<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>

<? echo form_open('/', ['class' => '', 'name' => '', 'id' => '']); ?>
<!-- map/edit/<?=$map?>/<?=$type?>/<?=$num?> -->
<input type='text' id='edit-title' name='edit-title' value='' />
<input type='hidden' id='edit-content' name='edit-content' value='' />
<div id='edit-content-div' name='edit-content-div' contenteditable='true'>
</div>
<? echo form_close(); ?>

<? echo form_open('admin/upload', ['name' => 'upload', 'id' => 'upload']); ?>
  <label for="input_zone" class="drop_wait"></label>
  <input type="file" id="input_zone" name="userfile[]" multiple />
<? echo form_close(); ?>

<?php $this->root->end($path);?>
