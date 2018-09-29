"use strict"

let onUnload = function () {
    event.returnValue = 1;
}

// !! ATTENTION !!
var __API_KEY__ = 'AIzaSyCLfqh2kzDo3DzclIyQ5IWF8GUjGwOyjnc';

// ["127.0.0.1", "space", "best", "1"]
var __URL__ = (window.location.hostname + window.location.pathname);
var __URL_ARRAY__ = __URL__.split("/");
var __REPLY_LIST_ROWS_LIMIT__ = 20;

window.addEventListener("dragover",function(){ event.preventDefault(); });
window.addEventListener("drop",function(){ event.preventDefault(); });

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;
	if (t.className.search("menu") == -1 && t.className.search("status") == -1 && t.nodeName != 'I') {
		let menu = document.querySelectorAll("input[class='menu']");
		[].filter.call( menu, function( el ) {
			el.checked = false;
		});
	}
});
