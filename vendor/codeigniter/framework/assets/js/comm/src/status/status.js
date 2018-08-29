let place= document.querySelector('#status-place');
let type = document.querySelector('#status-type');
let num = document.querySelector('#status-num');
let act = document.querySelector('#status-act');

if(URL_ARRAY.length>2) { 
	document.querySelector('#type-act-default').selected = true;
	document.querySelector('#type-'+URL_ARRAY[2]).selected = true;
	document.querySelector('#type-num').selected = true;
} else {
	document.querySelector('#status-type').selectedIndex = 0;
}

function goToURL () {
	let url = "";

	url = '/'+place.innerHTML+'/'+type.value+'/'+this;
	if(type.value === '#') url = '/' + place.innerHTML; 

	window.location.href = url;
}

type.addEventListener("change", goToURL.bind('list'));
num.addEventListener("change", goToURL.bind('list'));
act.addEventListener("change", goToURL.bind(URL_ARRAY[3]));
