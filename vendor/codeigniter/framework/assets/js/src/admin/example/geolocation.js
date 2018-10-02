"use strict";

/*
Latitude : 90.00000 ~ -90.000000
Longitude : 180.000000 ~ -180.000000
*/

function successGeolocation(data) {
	console.log(data);
	document.querySelector("#geolocation-result").innerHTML = JSON.stringify(data, null, 2);

	if(data.results.length > 0) {
		console.log(data.results[data.results.length-1].address_components[0].long_name);
		console.log(data.results[data.results.length-1].address_components[0].short_name);
	}
}

function getRandom(start, end) {

	let result = Math.random() * (end - start) + start;

	return result;

}

document.querySelector("#geolocation-submit").addEventListener("click", function(event) {

	let latitude = getRandom(-90, 90);
	let longitude = getRandom(-180, 180);

	httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);

});


