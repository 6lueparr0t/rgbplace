function signUpCheck (recv) {
	var form = new FormData(recv);

	var request = new XMLHttpRequest();
	var data = "";

	window.addEventListener("beforeunload", onUnload);
	request.open('post', '/sign/up/check', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			if(data.valid) {
				recv.submit();
			} else {
				 alert(data.msg);
			}
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

	request.send(form);
}

var signup = document.querySelector("#sign-up");
if (signup) signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
