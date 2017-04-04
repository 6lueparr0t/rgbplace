function signInCheck (recv) {
	let form = new FormData(recv);

	let request = new XMLHttpRequest();
	let data = "";

	request.open('post', '/sign/in/check', true);

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

let signin = document.querySelector("#sign-in");
if (signin) signin.addEventListener("submit", function () { event.preventDefault(); signInCheck(signin); });
