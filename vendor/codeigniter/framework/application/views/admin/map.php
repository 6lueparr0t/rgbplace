<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div class="grid" name="map" id="map">
	<div class="row" name="grid-head" id="grid-head">
		<span class="col1">no</span>
		<span class="col6">name</span>
		<span class="col1">code</span>
		<span class="col1">post</span>
		<span class="col1">reply</span>
		<span class="col1">ctim</span>
	</div>
	<div class="row" name="grid-body" id="grid-body">
	</div>
</div>

<?php $this->root->end($path); ?>
