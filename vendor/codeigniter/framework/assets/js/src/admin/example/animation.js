"use strict";

function sleep(milliseconds) {
	var start = new Date().getTime();
	for (var i = 0; i < 1e7; i++) {
		if ((new Date().getTime() - start) > milliseconds){
			break;
		}
	}
}

function tick() {
    const element = new Date().toLocaleTimeString();
    document.getElementById('example').innerHTML = element;
}

function webkitAnimationEnd (event) {
	setTimeout(function() { this.style.display = 'none';}.bind(this), 2000);
}

window.addEventListener("beforeunload", onUnload);
document.getElementById('test').addEventListener('webkitAnimationEnd', webkitAnimationEnd);

setInterval(tick, 1000);
