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

	document.querySelector('#creation').classList.remove('none');

}

function successCreation(data) {
	alert('Map was created');
}

function getResultList(data) {
	let country, code;
	let result = '';
	for(let i in data) {
		let addr = [];
		//{"address": ["괴안동", "소사구", "부천시", "경기도", "대한민국"]}
		for(let j in data[i].address_components) {
			//console.log(data.ko.results[i].address_components[j].long_name);
			if(data[i].address_components[j].types.includes('postal_code') ) continue;
			if(data[i].address_components[j].types.includes('country') ) {
				country = data[i].address_components[j].long_name;
				code = data[i].address_components[j].short_name;
			}
			addr.push('"'+data[i].address_components[j].long_name+'"');
		}

		//native.push({
		//'address' : native_addr
		//});

		result +=
			'<div class=\'row\' data-country=\''+country+'\' data-code=\''+code+'\'  data-array=\'['+addr+']\' data-id=\''+data[i].place_id+'\' >'+
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

function tabChange (element) {
	document.querySelectorAll('.'+element.parentElement.className+' div').forEach(function(element) {
		element.classList.remove('active');
		document.querySelector('#'+element.className+'-area').classList.add('none');
	});
	document.querySelector('#'+element.className+'-area').classList.remove('none');
	element.classList.add('active');
}

document.querySelector(".admin").addEventListener("click", function(event) {
    let t = event.target;
	console.log(t.className);
	
	switch(t.classList.item(0)) {
		case 'row' :
			document.querySelectorAll('#'+t.parentElement.id+' .row.selected').forEach(function(element) {
				element.classList.remove('selected');
			});
			t.classList.toggle('selected');
			break;
		case 'creation' :
		case 'destruction' :
			tabChange(t);
			break;
	}

	switch(t.id) {
		case 'geolocation-submit-random' :
			let latitude = getRandom(-90, 90);
			let longitude = getRandom(-180, 180);

			httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);
			break;
		case 'geolocation-submit' :
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function (position) {

					let latitude = position.coords.latitude;
					let longitude = position.coords.longitude;

					httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);

				});
			}
			break;
		case 'creation' :
			let address = [];
			let code = '';
			let country = [];

			document.querySelectorAll('.row.selected').forEach(function(element) {
				country.push(element.dataset.country);
				code = element.dataset.code;
				address.push(JSON.parse(element.dataset.array));
			});

			let data = {
				country:country,
				code:code,
				address:address
			};

			console.log(data);
			httpRequest('POST', '/api/map/creation', JSON.stringify(data), successCreation, null);
			break;

	}

});
