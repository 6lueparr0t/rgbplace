<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div style='margin:2rem;'>
	<input id='geolocation-submit' type='button' value='Get Api Result (Random)'>
	<br/><br/>
	<div>Result(Eng) : </div>
	<pre id='geolocation-result'></pre>

	<div>Result(Local) : </div>
	<pre id='geolocation-result-local'></pre>

</div>

<?php $this->root->end($path); ?>
