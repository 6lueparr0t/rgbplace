<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div class='admin'>

	<div id='key' class='none'> <?php echo GOOGLE_API_KEY; ?> </div>

	<input id='geolocation-submit' type='button' value='Get Api Result'>
	<input id='geolocation-submit-random' type='button' value='Get Api Result (test)'>

	<br/><br/>

	<div class='geocode'>
		<div class='result-area'> Result(Ko) : 
			<textarea id='geolocation-result-ko' class=''></textarea>
			 <div class='result-list' id='geolocation-list-ko'>
			 </div>
		</div>
		<div class='result-area'> Result(En) : 
			<textarea id='geolocation-result-en' class=''></textarea>
			 <div class='result-list' id='geolocation-list-en'>
			 </div>
		</div>

		<div id='creation'>
			Creation
		</div>
	</div>
</div>

<?php $this->root->end($path); ?>
