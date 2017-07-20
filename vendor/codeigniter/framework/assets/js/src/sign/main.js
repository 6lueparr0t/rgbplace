"use strict";
function signUpCheck (recv) {
	let form = new FormData(recv);

	let request = new XMLHttpRequest();
	let data = "";

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

function passwordCheck () {
    if (this.value != document.querySelector('#sign-up input[name=\'pswd\']').value) {
        this.setCustomValidity('패스워드를 확인해주세요.\nPlease Check your Password.');
    } else {
        this.setCustomValidity('');
    }
}

let signup = document.querySelector("#sign-up");
let signUpConf = document.querySelector("#sign-up input[name='conf']");

if (signup) signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
if (signUpConf) signUpConf.addEventListener("input", passwordCheck);