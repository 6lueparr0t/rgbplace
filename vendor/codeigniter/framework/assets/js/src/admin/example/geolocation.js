"use strict";

/*
Latitude : 90.00000 ~ -90.000000
Longitude : 180.000000 ~ -180.000000
*/

function successGeolocation(data) {
	console.log(data);
	document.querySelector("#geolocation-result").innerHTML = JSON.stringify(data, null, 2);
}

function getRandom(start, end) {

	let result = Math.random() * (end - start) + start;

	return result;

}

document.querySelector("#geolocation-submit").addEventListener("click", function(event) {

	let latitude = getRandom(-90, 90);
	let longitude = getRandom(-180, 180);

	let result_type = 'administrative_area_level_1|administrative_area_level_2|administrative_area_level_3|sublocality_level_1|sublocality_level_2|sublocality_level_3';

	let url = 'https://maps.googleapis.com/maps/api/geocode/json?sensor=false&latlng='+latitude+','+longitude+'&language=en&key='+__API_KEY__+'&result_type'+result_type;

	//console.log(url);

	httpRequest('GET', url, null, successGeolocation, null);

});


