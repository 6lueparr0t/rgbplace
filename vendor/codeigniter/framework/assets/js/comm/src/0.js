"use strict"

let onUnload = function () {
    event.returnValue = 1;
}

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