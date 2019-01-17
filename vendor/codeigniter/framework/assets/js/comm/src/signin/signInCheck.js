let signin = document.querySelector("#sign-in");

const gapiOnLoad = () => {
    gapi.load('auth2', function() {
        gapi.auth2.init();
    });
}

const onSignIn = googleUser => {
    var profile = googleUser.getBasicProfile();

    let data = [{
        name : profile.getName(),
        mail : profile.getEmail()
    }];

    httpRequest('post', '/api/google', JSON.stringify(data), data => { location.reload(); }, data => { console.log(data); });
}

const signOut = () => {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out..');
    });  
}

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
		//console.log("event.lengthComputable:"+event.lengthComputable);
		//console.log("event.loaded:"+event.loaded);
		//console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		// There was a connection error of some sort
	};

	request.send(form);
}

if (signin) signin.addEventListener("submit", function () { event.preventDefault(); signInCheck(signin); });
