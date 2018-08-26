let num = document.querySelector('#status-num');
let type = document.querySelector('#status-type');
let place= document.querySelector('#status-place');

if(URL_ARR.length>2) { 
	document.querySelector('#type-'+URL_ARR[2]).selected = true;
	document.querySelector('#type-num').selected = true;
} else {
	document.querySelector('#status-type').selectedIndex = 0;
}

function goToList () {
	let url = "";

	if(type.value === '#') url = '/' + place.innerHTML; 
	url = '/'+place.innerHTML+'/'+type.value+'/list';

	window.location.href = url;
}

type.addEventListener("change", goToList);
num.addEventListener("change", goToList);
