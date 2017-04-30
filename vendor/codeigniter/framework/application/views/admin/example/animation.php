<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); $this->rgb->common(); ?>

<?php $this->rgb->warning(); ?>
<style>
.animate-flicker {
    animation: fadeOutUp 1s 2 alternate;
	animation-delay: 2s;
	animation-fill-mode: forwards;
}


/* Safari 4.0 - 8.0 */
/*
@-webkit-keyframes mymove {
    from {top: 0px;}
    to {top: 200px;}
}

@keyframes mymove {
    from {top: 0px;}
    to {top: 200px;}
}
*/
</style>
<h1 id="example"></h1>
<h1 id="test" class="animate-flicker">Example</h1>

<?php $this->rgb->end($path); ?>
