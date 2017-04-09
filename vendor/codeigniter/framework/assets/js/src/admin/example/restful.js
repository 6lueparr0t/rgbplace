"use strict";

const result = document.querySelector("#result");
const apikey = document.querySelector("#apikey").innerHTML;

document.querySelector("#requestGet").addEventListener("click",		function () { requestGet()		});
document.querySelector("#requestPost").addEventListener("click",	function () { requestPost()		});
document.querySelector("#requestPut").addEventListener("click",		function () { requestPut()		});
document.querySelector("#requestDelete").addEventListener("click",	function () { requestDelete()	});

function requestGet() {
	let request = new XMLHttpRequest();
	let data = "";

	request.open('get', '/api/test', true);
	request.setRequestHeader ("Authorization", apikey);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			result.innerHTML = data.request+"/"+data.author;
			console.log(data);
			//console.log(request.getAllResponseHeaders());
		} else {
			// We reached our target server, but it returned an error
			// console.log(this.status);
		}
	};

	request.onprogress = function() {
		console.log("event.lengthComputable:"+event.lengthComputable);
		console.log("event.loaded:"+event.loaded);
		console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		// There was a connection error of some sort
	};

	request.send();
}

function requestPost() {
	let request = new XMLHttpRequest();
	let data = "";

	request.open('post', '/api/test', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			result.innerHTML = data.request;
			// console.log(data);
		} else {
			// We reached our target server, but it returned an error
			// console.log(this.status);
		}
	};

	request.onprogress = function() {
		console.log("event.lengthComputable:"+event.lengthComputable);
		console.log("event.loaded:"+event.loaded);
		console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		// There was a connection error of some sort
	};

	request.send();
}

function requestPut() {
	let request = new XMLHttpRequest();
	let data = "";

	request.open('put', '/api/test', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			result.innerHTML = data.request;
			// console.log(data);
		} else {
			// We reached our target server, but it returned an error
			// console.log(this.status);
		}
	};

	request.onprogress = function() {
		console.log("event.lengthComputable:"+event.lengthComputable);
		console.log("event.loaded:"+event.loaded);
		console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		// There was a connection error of some sort
	};

	request.send();
}

function requestDelete() {
	let request = new XMLHttpRequest();
	let data = "";

	request.open('delete', '/api/test', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			result.innerHTML = data.request;
			// console.log(data);
		} else {
			// We reached our target server, but it returned an error
			// console.log(this.status);
		}
	};

	request.onprogress = function() {
		console.log("event.lengthComputable:"+event.lengthComputable);
		console.log("event.loaded:"+event.loaded);
		console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		// There was a connection error of some sort
	};

	request.send();
}
