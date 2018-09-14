<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<div id='edit'>

<!-- map/edit/<?=$map?>/<?=$type?>/<?=$num?> -->
<input type='hidden' id='edit-mode' name='edit-mode' value='<?=$mode?>' />
<input type='hidden' id='edit-upload' name='edit-upload' value='<?=$upload?>' />
<input type='text' id='edit-title' name='edit-title' value='<?=$title?>' />
<div id='edit-content' name='edit-content' contenteditable='true'>
<?=$content?>
</div>

<? echo form_open('', ['name' => 'upload', 'id' => 'upload']); ?>
  <label for="input_zone" class="drop_wait"></label>
  <input type="file" id="input_zone" name="userfile[]" multiple />
<? echo form_close(); ?>

<div class="button-group">
	<div class='enable' id='save' name='save'>SAVE</div>
	<div class='enable' id='cancel' name='cancel'>CANCEL</div>
</div>

</div>
<?php $this->root->end($path);?>
