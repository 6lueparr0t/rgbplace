"use strict";

/*
Latitude : 90.00000 ~ -90.000000
Longitude : 180.000000 ~ -180.000000
*/

function successGeolocation(data) {
	console.log(data);
	document.querySelector("#geolocation-result-ko").value = JSON.stringify(data.ko, null, 2);
	document.querySelector("#geolocation-result-en").value = JSON.stringify(data.en, null, 2);

	if(data.en.results.length > 0) {
		console.log(data.en.results[data.en.results.length-1].address_components[0].long_name);
		console.log(data.en.results[data.en.results.length-1].address_components[0].short_name);
	}
}

function getRandom(start, end) {

	let result = Math.random() * (end - start) + start;

	return result;

}

document.querySelector("#geolocation-submit").addEventListener("click", function(event) {

	if(navigator.geolocation) {

		navigator.geolocation.getCurrentPosition(function (position) {

			let latitude = position.coords.latitude;
			let longitude = position.coords.longitude;

			httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);

		});
	}

});

document.querySelector("#geolocation-submit-random").addEventListener("click", function(event) {

	let latitude = getRandom(-90, 90);
	let longitude = getRandom(-180, 180);

	httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);

});


