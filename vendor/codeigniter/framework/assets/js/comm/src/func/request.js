function httpRequest(method, url, data, success, error = null) {
	let request = new XMLHttpRequest();

	request.open(method, url, true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			let ret = JSON.parse(this.response);
			success(ret);
		}
	};

	request.onprogress = function() {
		//console.log("event.lengthComputable:"+event.lengthComputable);
		//console.log("event.loaded:"+event.loaded);
		//console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		//There was a connection error of some sort
		error();
	};

	request.send(data);
}

