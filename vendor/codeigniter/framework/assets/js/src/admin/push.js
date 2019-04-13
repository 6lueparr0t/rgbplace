"use strict";

document.querySelector("#send").addEventListener("click", (event) => {
    let t = event.target;
	let msg = document.querySelector("#message").value;
	//httpRequest('POST', '/api/map/creation', JSON.stringify(data), success, null);
	ws.send(msg);
});

document.querySelector("#ajax").addEventListener("click", (event) => {
	let data = [];
	let msg = document.querySelector("#message").value;

	data.push({
		'act': 'alert',
		'mode': 'broad',
		'msg': msg,
		'info': __URL__,
		'sn': user.sn,
		'uid': user.uid
	});

	httpRequest('POST', '/push/send/test', JSON.stringify(data), data => {}, null);
});

!(() => {
	//console.log('test');
})();
