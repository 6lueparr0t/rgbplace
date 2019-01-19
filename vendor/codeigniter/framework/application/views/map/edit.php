<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common();?>
<div id='edit'>

<!-- map/edit/<?=$map?>/<?=$type?>/<?=$num?> -->
<input type='text' id='edit-title' name='edit-title' value='<?=$title?>' />

<div class='tab'>
	<div class='view'>view</div>
	<div class='code'>code</div>
</div>

<div class='editor' id='edit-content' name='edit-content' contenteditable='true'>
<?php echo $content; ?>
</div>

<textarea class='editor' id='edit-content-code' name='edit-content-code'>
<?php echo $content; ?>
</textarea>

<div id='upload-list'>
	<div id='upload-list-toggle'>Upload List <i id='upload-list-switch' class="fa fa-caret-down"></i></div>
	<div class='upload-list group close'>
		<div class='upload-list table'>
			<div class='upload-list-result'>
				<ul class='file-list no-file'>
					<li class='file'>No File.</li>
				</ul>
			</div>
			<div class='upload-preview'>
				<img id='upload-preview-img' src='/assets/img/placeholder.jpg' />
			</div>
		</div>
	</div>
</div>

<? echo form_open('', ['class' => 'upload', 'name' => 'upload', 'id' => 'upload']); ?>
  <label for="input_zone" class="drop_wait"></label>
  <input type="file" id="input_zone" name="userfile[]" accept="audio/*,video/*,image/*" multiple />
<? echo form_close(); ?>

<div class="button-group">
	<div class='enable' id='save' name='save'>SAVE</div>
	<div class='enable' id='cancel' name='cancel'>CANCEL</div>
</div>

</div>
<?php $this->root->end($path);?>
