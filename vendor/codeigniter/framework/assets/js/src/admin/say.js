"use strict";

var loc = window.location;
var uri = 'ws:';
var port = ':1213';

if (loc.protocol === 'https:') {
	uri = 'wss:';
}
uri += '//' + loc.host + port + '/ws';

console.log(uri);

var ws = new WebSocket(uri)

ws.onopen = function() {
	//console.log('Connected')
}

ws.onmessage = function(event) {
	alert(event.data);
	//var out = document.getElementById('output');
	//out.innerHTML += event.data + '<br>';
	//console.log(event);
}

document.querySelector("#send").addEventListener("click", (event) => {
    let t = event.target;
	let msg = document.querySelector("#message").value;
	//httpRequest('POST', '/api/map/creation', JSON.stringify(data), success, null);
	ws.send(msg);
});

/*
function success (data) {

}
*/

!(() => {
	//console.log('test');
})();
