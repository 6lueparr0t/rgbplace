function httpRequest(method, url, data, success, fail, error = null, progress = null) {
	let request = new XMLHttpRequest();

	request.open(method, url, true);

	request.onload = function() {
		let ret; 
		if (this.status >= 200 && this.status < 400) {
			ret = JSON.parse(this.response);
			// Success!
			success(ret);
		} else {
			// fail..
			fail(this);
		}
	};

	request.onerror = function() {
		//There was a connection error of some sort
		error();
	};

	request.onprogress = progress;

	//request.onprogress = function() {
		////console.log("event.lengthComputable:"+event.lengthComputable);
		////console.log("event.loaded:"+event.loaded);
		////console.log("event.total:"+event.total);
	//};

	request.send(data);
}

