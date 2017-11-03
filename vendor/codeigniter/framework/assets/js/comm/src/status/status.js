let type = document.querySelector('#status-type');
let place= document.querySelector('#status-place');

if (type && place) type.addEventListener("change", function() {
	let url = "";

	if(type.value === '#') url = '/' + place.innerHTML; 
	url = '/'+place.innerHTML+'/'+type.value+'/list';

	window.location.href = url;
});
