"use strict";

var map;
var markers = [];

function googleMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 12,
	});

	// Create the search box and link it to the UI element.
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	// Bias the SearchBox results towards current map's viewport.
	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});

	searchBox.addListener('places_changed', function() {
		var places = searchBox.getPlaces();

		if (places.length == 0) {
			return;
		}

		// Clear out the old markers.
		markers.forEach(function(marker) {
			marker.setMap(null);
		});

		// For each place, get the icon, name and location.
		var bounds = new google.maps.LatLngBounds();
		//var location_tmp;
		places.forEach(function(place) {
			if (!place.geometry) {
				console.log("Returned place contains no geometry");
				return;
			}
			var icon = {
				url: place.icon,
				size: new google.maps.Size(71, 71),
				origin: new google.maps.Point(0, 0),
				anchor: new google.maps.Point(17, 34),
				scaledSize: new google.maps.Size(25, 25)
			};

			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
				//location_tmp = place.geometry.viewport;
			} else {
				bounds.extend(place.geometry.location);
				//location_tmp = place.geometry.location;
			}
		});

		//console.log(location_tmp);
		//document.querySelector("#geolocation-submit-custom-lat").value = location_tmp.l.j;
		//document.querySelector("#geolocation-submit-custom-lng").value = location_tmp.j.j;
		map.fitBounds(bounds);
	});

	var marker = new google.maps.Marker({
		map: map,
	});

	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (position) {
			var initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			map.setCenter(initialLocation);
			var marker = new google.maps.Marker({
				position: {lat: position.coords.latitude, lng: position.coords.longitude}
			});
		});
	}

	map.addListener('click', function( event ){
		var marker = new google.maps.Marker({
			position: {lat: event.latLng.lat(), lng: event.latLng.lng()},
			map: map
		});

		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}

		markers.push(marker);

		document.querySelector("#geolocation-submit-custom-lat").value = event.latLng.lat();
		document.querySelector("#geolocation-submit-custom-lng").value = event.latLng.lng();
	});
}

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

	document.querySelector('#geolocation-list-ko').innerHTML = getResultList(data.ko.results, 'geo', 'ko');
	document.querySelector('#geolocation-list-en').innerHTML = getResultList(data.en.results, 'geo', 'en');

	document.querySelector('#creation').classList.remove('none');

}

function successNavigation(data) {
	console.log(data);
	document.querySelector("#map-list").innerHTML = getResultList(data, 'navi');
}

function successCreation(data) {

	if(data === true) {
		alert('Place was created');
	} else {
		alert('Empty Value!');
	}

}

function successDestruction(data) {

	if(data) {
		alert('Place was destroyed');
	} else {
		alert('Empty Value!');
	}

	httpRequest('GET', '/api/request/map?info='+__URL__, null, successNavigation, null);
}

function getResultList(data, type, custom) {
	let country, code;
	let result = '';

	switch(type) {
		case 'geo' :
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
			break;
		case 'navi' :
			for(let i in data) {
				result += '<div class=\'row\' data-code=\''+data[i].code+'\' data-num=\''+data[i].num+'\' >' +data[i].global+'<br/>'+data[i].native+ '</div>';

				//console.log(data.ko.results[i].formatted_address);
				//console.log(data.ko.results[i].place_id);
			}
			break;

	}

	switch(custom) {
		case 'ko' :
			result += '<div class=\'row custom-'+custom+'\' data-country=\''+country+'\' data-code=\''+code+'\'  data-array=\'[]\' data-id=\'\' contenteditable=\'true\' placeholder=\'ex)대한민국/서울특별시/동작구/흑석동\'></div>';
			break;
		case 'en' :
			result += '<div class=\'row custom-'+custom+'\' data-country=\''+country+'\' data-code=\''+code+'\'  data-array=\'[]\' data-id=\'\' contenteditable=\'true\' placeholder=\'ex)Heukseok-dong/Dongjak-gu/Seoul/South Korea/\'></div>';
			break;
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
	//console.log(t.className);
	
	switch(t.classList.item(0)) {
		case 'row' :
			document.querySelectorAll('#'+t.parentElement.id+' .row.selected').forEach(function(element) {
				element.classList.remove('selected');
			});
			t.classList.toggle('selected');

			if(t.classList.value.includes('custom')) {
			}
			break;
		case 'creation' :
			tabChange(t);
			break;
		case 'destruction' :
			tabChange(t);
			httpRequest('GET', '/api/request/map?info='+__URL__, null, successNavigation, null);
			break;
	}

	let data = '';
	let latitude = 0, longitude = 0;
	//console.log(t.id);

	switch(t.id) {
		case 'geolocation-submit-custom' :
			latitude = document.querySelector("#geolocation-submit-custom-lat").value;
			longitude = document.querySelector("#geolocation-submit-custom-lng").value;

			if(!latitude || !longitude) return false;

			httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);
			break;
		case 'geolocation-submit-random' :
			latitude = getRandom(-90, 90);
			longitude = getRandom(-180, 180);

			document.querySelector("#geolocation-submit-custom-lat").value = latitude;
			document.querySelector("#geolocation-submit-custom-lng").value = longitude;

			httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);
			break;
		case 'geolocation-submit' :
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function (position) {

					let latitude = position.coords.latitude;
					let longitude = position.coords.longitude;

					console.log(latitude);

					document.querySelector("#geolocation-submit-custom-lat").value = latitude;
					document.querySelector("#geolocation-submit-custom-lng").value = longitude;

					httpRequest('GET', '/api/geocode?latlng='+latitude+','+longitude, null, successGeolocation, null);

				});
			}
			break;
		case 'navi-request-submit' :
			httpRequest('GET', '/api/request/map?info='+__URL__, null, successNavigation, null);
			break;
		case 'creation' :
			let address = [];
			let code = '';
			let country = [];
			let description = document.querySelector('#map-description').value;
			let keyword = document.querySelector('#map-keyword').value;
			latitude = document.querySelector("#geolocation-submit-custom-lat").value;
			longitude = document.querySelector("#geolocation-submit-custom-lng").value;

			document.querySelectorAll('.row.selected').forEach(function(element) {

				country.push(element.dataset.country);
				code = element.dataset.code;

				switch (element.classList.item(1)) {
					case 'custom-ko':
						address.push(element.innerHTML.split('/').reverse());
						break;
					case 'custom-en':
						address.push(element.innerHTML.split('/'));
						break;
					default:
						address.push(JSON.parse(element.dataset.array));
						break;
				}
			});

			data = {
				country:country,
				code:code,
				address:address,
				description:description,
				keyword:keyword,
				latitude:latitude,
				longitude:longitude
			};

			console.log(data);
			httpRequest('POST', '/api/map/creation', JSON.stringify(data), successCreation, null);
			break;
		case 'destruction' :
			let num = '';

			document.querySelectorAll('.row.selected').forEach(function(element) {
				code = element.dataset.code;
				num = element.dataset.num;
			});

			data = {
				code:code,
				num:num
			};

			console.log(data);
			httpRequest('POST', '/api/map/destruction', JSON.stringify(data), successDestruction, null);
			break;

	}

});

!function() {
	document.querySelector(".creation").click();
}();
