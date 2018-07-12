let type = document.querySelector('#status-type');
let place= document.querySelector('#status-place');

if(URL_ARR.length>2) { 
	document.querySelector('#type-'+URL_ARR[2]).selected = true;
} else {
	document.querySelector('#status-type').selectedIndex = 0;
}

if (type && place) type.addEventListener("change", function() {
	let url = "";

	if(type.value === '#') url = '/' + place.innerHTML; 
	url = '/'+place.innerHTML+'/'+type.value+'/list';

	window.location.href = url;
});
