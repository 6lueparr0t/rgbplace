"use strict";

function webkitAnimationEnd (event) {
	setTimeout(function() { this.style.display = 'none';}.bind(this), 2000);
}

function onUnload(event) { // the method that will be used for both add and remove event
	//console.log("Test")
	event.returnValue = 1;
}

function sleep(milliseconds) {
	var start = new Date().getTime();
	for (var i = 0; i < 1e7; i++) {
		if ((new Date().getTime() - start) > milliseconds){
			break;
		}
	}
}

window.addEventListener("beforeunload", this.onUnload);
document.getElementById('test').addEventListener('webkitAnimationEnd', this.webkitAnimationEnd);
