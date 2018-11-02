<?php defined('BASEPATH') OR exit('No direct script access allowed'); $this->root->start(); $this->root->common(); ?>
<style>
#pac-input {
	z-index: 0;
	position: absolute;
	left: 152px;
	top: 0px;

	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;

	margin: .5rem;
	height: 2.4rem;
  }

#pac-input:focus {
	border-color: #4d90fe;
}
</style>

<div class='admin'>

	<div class='tab'>
		<div class='creation'>Creation</div>
		<div class='destruction'>Destruction</div>
	</div>
	<div id='key' class='none'><?php echo GOOGLE_API_KEY; ?></div>

	<div id='creation-area' class='none'>
		<div id="map"></div>
		<input id="pac-input" class="controls" type="text" placeholder="Search">
		<input id='geolocation-submit' type='button' value='Get Api Result'>
		<input id='geolocation-submit-random' type='button' value='Get Api Result (test)'>
		<input id='geolocation-submit-custom' type='button' value='Get Api Result (custom)'>
		<input id='geolocation-submit-custom-lat' type='text' value='' placeholder='latitude'>
		<input id='geolocation-submit-custom-lng' type='text' value='' placeholder='longitude'>

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

<script async defer src="https://maps.googleapis.com/maps/api/js?key=<?php echo GOOGLE_API_KEY; ?>&libraries=places&callback=googleMap"></script>
<?php $this->root->end($path); ?>
