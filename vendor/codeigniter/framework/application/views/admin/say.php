<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div class='say'>
	<input type='text' id='message' />
	<button id='send'>Send</button>
</div>

<?php $this->root->end($path); ?>
