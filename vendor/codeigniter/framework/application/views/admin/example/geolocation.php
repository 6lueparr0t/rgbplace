<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div class='admin'>

<!--
	<div>
		<?php echo GOOGLE_API_KEY; ?>
	</div>
-->
	<input id='geolocation-submit' type='button' value='Get Api Result'>
	<input id='geolocation-submit-random' type='button' value='Get Api Result (test)'>

	<br/><br/>

	<div class='geocode'>
		<div>Result(Ko) : 
			<textarea id='geolocation-result-ko' style='font-size: 0.8rem;'></textarea>
		</div>
		<div>Result(En) : 
			<textarea id='geolocation-result-en' style='font-size: 0.8rem;'></textarea>
		</div>
	</div>
</div>

<?php $this->root->end($path); ?>
