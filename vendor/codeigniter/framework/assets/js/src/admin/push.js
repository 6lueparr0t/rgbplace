"use strict";

var loc = window.location;
var uri = 'ws:';
var port = ':1323';

if (loc.protocol === 'https:') {
	uri = 'wss:';
}
uri += '//' + loc.hostname + port + '/push';

//console.log(uri);

var ws = new WebSocket(uri)

ws.onopen = function() {
	//console.log('Connected')
}

ws.onmessage = function(event) {
	console.log(event.data);
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

document.querySelector("#ajax").addEventListener("click", (event) => {
	let data = [];

	data.push({
		'info': __URL__,
		'sn': user.sn,
		'uid': user.uid
	});

	httpRequest('POST', '/api/push/test', JSON.stringify(data), data => {}, null);
});

!(() => {
	//console.log('test');
})();
