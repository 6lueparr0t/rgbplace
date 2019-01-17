"use strict"

let onUnload = function () {
    event.returnValue = 1;
}

// ["127.0.0.1", "space", "best", "1"]
var __URL__ = (window.location.hostname + window.location.pathname);
var __URL_ARRAY__ = __URL__.split("/");
var __REPLY_LIST_ROWS_LIMIT__ = 20;

window.addEventListener("dragover",function(){ event.preventDefault(); });
window.addEventListener("drop",function(){ event.preventDefault(); });

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;
	//console.log(t);
	if (t.className.search("menu") == -1 && t.className.search("switch") == -1 && t.className.search("status") == -1 && t.nodeName != 'I') {
		let menu = document.querySelectorAll("input[class='menu']");
		[].filter.call( menu, function( el ) {
			el.checked = false;
		});
	}
});

const onSignIn = googleUser => {
	var profile = googleUser.getBasicProfile();

	let data = [{
		name : profile.getName(),
		mail : profile.getEmail()
	}];

	httpRequest('post', '/api/google', JSON.stringify(data), data => { location.reload(); }, null);
}

console.log(
	'%cR%cG%cB %cPLACE',
	'color: #ff6b6b;font-size:2rem;font-weight:bold',
	'color: #51cf66;font-size:2rem;font-weight:bold',
	'color: #339af0;font-size:2rem;font-weight:bold',
	'color: #000000;font-size:2rem;font-weight:bold'
);
