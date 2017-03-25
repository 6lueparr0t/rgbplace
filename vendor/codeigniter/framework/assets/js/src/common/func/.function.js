function check() {
    if (this.value != document.querySelector('#sign-up input[name=\'pswd\']').value) {
        this.setCustomValidity('패스워드를 확인해주세요.\nPlease Check your Password.');
    } else {
        this.setCustomValidity('');
    }
}

function newFormTest(recv) {
	var form = new FormData(recv);

	var request = new XMLHttpRequest();
	var data = "";

	request.open('post', '/sign/test', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			//recv.submit();
			console.log(data);
		} else {
			// We reached our target server, but it returned an error
			console.log(this.status);
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

	request.send(form);
}
