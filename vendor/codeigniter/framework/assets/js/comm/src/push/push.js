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

ws.onopen = () => {
	//console.log('Websocket Connected.')
}

ws.onmessage = (event) => {
	let push = JSON.parse(event.data);

	switch (push['act']) {
		case 'alert':
			//push['map'] push['post'] push['reply'] push['recv'] push['data']
			switch (push['mode']) {
				case 'uni' :
					console.log(push['msg']);
					break;
				case 'multi' :
					console.log(push['msg']);
					break;
				case 'broad' :
					console.log(push['msg']);
					break;
			}
			break;
		case 'noti':
			switch (push['mode']) {
				case 'count' :
					document.getElementById('counter').innerHTML = push['data'].toLocaleString();
					break;
			}
			break;
	}
	//var out = document.getElementById('output');
	//out.innerHTML += event.data + '<br>';
	//console.log(event);
}
