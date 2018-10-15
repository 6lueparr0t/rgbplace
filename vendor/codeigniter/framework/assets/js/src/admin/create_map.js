"use strict";

/*
Latitude : 90.00000 ~ -90.000000
Longitude : 180.000000 ~ -180.000000
*/

function successGeolocation(data) {
	console.log(data);
	document.querySelector("#geolocation-result-ko").value = JSON.stringify(data.ko, null, 2);
	document.querySelector("#geolocation-result-en").value = JSON.stringify(data.en, null, 2);

	/*
	
	"results" : [
		  {
			 "address_components" : [
				{
				   "long_name" : "Winnetka",
				   "short_name" : "Winnetka",
				   "types" : [ "locality", "political" ]
				},
				{
				   "long_name" : "New Trier",
				   "short_name" : "New Trier",
				   "types" : [ "administrative_area_level_3", "political" ]
				},
				{
				   "long_name" : "Cook County",
				   "short_name" : "Cook County",
				   "types" : [ "administrative_area_level_2", "political" ]
				},
				{
				   "long_name" : "Illinois",
				   "short_name" : "IL",
				   "types" : [ "administrative_area_level_1", "political" ]
				},
				{
				   "long_name" : "United States",
				   "short_name" : "US",
				   "types" : [ "country", "political" ]
				}
			 ],
			 "formatted_address" : "Winnetka, IL, USA",
			 "place_id" : "ChIJW8Va5TnED4gRY91Ng47qy3Q",
		  }
	   ]
	*/

	document.querySelector('#geolocation-list-ko').innerHTML = getResultList(data.ko.results);
	document.querySelector('#geolocation-list-en').innerHTML = getResultList(data.en.results);

	document.querySelector('#create_map').classList.remove('none');

}

function getResultList(data) {
	let result = '';
	for(let i in data) {
		let addr = [];
		//{"address": ["괴안동", "소사구", "부천시", "경기도", "대한민국"]}
		for(let j in data[i].address_components) {
			//console.log(data.ko.results[i].address_components[j].long_name);
			if(data[i].address_components[j].types[0] == 'postal_code') continue;
			addr.push('"'+data[i].address_components[j].long_name+'"');
		}

		//native.push({
		//'address' : native_addr
		//});

		result +=
			'<div class=\'row\'  data-array=\'['+addr+']\' data-id=\''+data[i].place_id+'\' >'+
			data[i].formatted_address+
			'</div>';

		//console.log(data.ko.results[i].formatted_address);
		//console.log(data.ko.results[i].place_id);
	}

	return result;
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

document.querySelector(".geocode").addEventListener("click", function(event) {
    let t = event.target;
	//console.log(t.className);
	
	switch(t.className) {
		case 'row' :
		case 'row selected' :
			document.querySelectorAll('#'+t.parentElement.id+' .row.selected').forEach(function(element) {
				element.classList.remove('selected');
			});
			t.classList.toggle('selected');
			break;
	}

});

document.querySelector("#create_map").addEventListener("click", function(event) {
	let data = [];
	document.querySelectorAll('.row.selected').forEach(function(element) {
		data.push({
			'address':JSON.parse(element.dataset.array)
		});
	});

	console.log(data);
});
