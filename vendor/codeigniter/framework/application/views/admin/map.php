<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>

<div class='admin'>

	<div class='tab'>
		<div class='creation'>Creation</div>
		<div class='destruction'>Destruction</div>
	</div>
	<div id='key' class='none'> <?php echo GOOGLE_API_KEY; ?> </div>

	<div id='creation-area' class='none'>
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

			<div class='map-info'>
				<input type="text" id="map-description" value="" placeholder="Description" />
				<input type="text" id="map-keyword" value="" placeholder="Keyword" />
			</div>

			<div id='creation'>
				Creation
			</div>
		</div>
	</div>

	<div id='destruction-area' class='none'>
		<div class='navigation'>
			<div class='result-list' id='map-list'>
			</div>

			<div id='destruction'>
				Destruction
			</div>
		</div>
	</div>
</div>

<?php $this->root->end($path); ?>
