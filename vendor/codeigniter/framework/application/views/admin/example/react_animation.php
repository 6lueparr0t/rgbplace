<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); ?>

<?php $this->rgb->warning(); ?>
<style>
.animate-flicker {
    animation: fadeOutUp 1s 2 alternate;
	animation-delay: 2s;
	animation-fill-mode: forwards;
}
</style>
<h1 id="test" class="animate-flicker">Example</h1>
<div id="action"></div>

<?php $this->rgb->end($path, $minify); ?>