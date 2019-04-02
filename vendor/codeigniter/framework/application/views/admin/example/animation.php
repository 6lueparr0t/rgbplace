<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<p class='marquee'>Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning! Warning!</p>

<style>
.animate-flicker {
    animation: mymove 1s 2 alternate;
	animation-delay: 2s;
	animation-fill-mode: forwards;
	position:absolute;
	top:350px;
}


/* Safari 4.0 - 8.0 */
@-webkit-keyframes mymove {
    from {top: 350px;}
    to {top: 700px;}
}

@keyframes mymove {
    from {top: 350px;}
    to {top: 700px;}
}
</style>
<h1 id="example"></h1>
<h1 id="test" class="animate-flicker">Example</h1>

<?php $this->root->end($path); ?>
