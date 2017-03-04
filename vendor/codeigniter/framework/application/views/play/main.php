<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->rgb->start(); ?>

	<div id="action"></div>
	<div id='push'><?=$this->session->flashdata('status')?></div>

<?php $this->rgb->end($path); ?>
