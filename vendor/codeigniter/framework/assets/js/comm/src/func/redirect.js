function redirect (link) {
	location.replace('/'+__URL_ARRAY__[1]+'/'+__URL_ARRAY__[2]+'/'+link);
}

function back() {
	location.replace(document.referrer);
}
