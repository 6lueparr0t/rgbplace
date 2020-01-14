"use strict";

let signup = document.querySelector("#sign-up");
let signUpConf = document.querySelector("#sign-up input[name='conf']");
let signin = document.querySelector("#sign-in");

var decodeEntities = (function() {
	// this prevents any overhead from creating the object each time
	var element = document.createElement('div');

	function decodeHTMLEntities (str) {
		if(str && typeof str === 'string') {
			// strip script/html tags
			str = str.replace(/<script[^>]*>([\S\s]*?)<\/script>/gmi, '');
			str = str.replace(/<\/?\w(?:[^"'>]|"[^"]*"|'[^']*')*>/gmi, '');
				element.innerHTML = str;
				str = element.textContent;
				element.textContent = '';
			}

		return btoa(str);
	}

	return decodeHTMLEntities;
})();

function signInCheck (recv) {

	let encryption = new Encryption();
	recv.querySelector("input[name=pswd]").value = encryption.encrypt(recv.querySelector("input[name=pswd]").value, decodeEntities(__k__));
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
				recv.querySelector("input[name=pswd]").value = "";
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

//window.addEventListener("beforeunload", onUnload);

function signUpCheck (recv) {

	let form = new FormData(recv);

	httpRequest('POST', '/sign/up/check', form, successSignUp.bind(recv), null);
}

function successSignUp(data) {
	// Success!
	if(data.valid) {
		//console.log('this.submit();');
		if(confirm('계속 진행하시겠습니까? 진행 후 회원가입 및 로그인 처리가 완료됩니다.\nConfirm. if you can exit, sign up success')) this.submit();
	} else {
		alert(data.msg);
	}
	// console.log(data);
}

function passwordCheck () {
    if (this.value != document.querySelector('#sign-up input[name=\'pswd\']').value) {
        this.setCustomValidity('패스워드를 확인해주세요.\nPlease Check your Password.');
    } else {
        this.setCustomValidity('');
    }
}

let x;
function sendCode() {

	let mail = document.querySelector("[name='mail']").value;

	let check = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if( check.test(String(mail).toLowerCase()) === false ) {
		Swal.fire({
			type: 'error',
			title: 'Check Your Mail..',
			text: 'Please enter a valid Mail address'
		})

		return true;
	}

	let data = {'mail':mail};

	if (!x) {

		document.querySelector("[name='check']").classList.add('disabled');
		httpRequest('POST', '/sign/mailAuth', JSON.stringify(data), ret => {

			if(ret['send'] == true) {
				Swal.fire({
					type: 'success',
					title: 'Send Successfully!',
					text: 'Check Your MailBox and Input Auth Code in an hour.'
				})

				clearInterval(x);

				// Set the date we're counting down to
				let countDownDate = new Date().getTime() + (60 * 60 * 1000) + 1000;

				// Update the count down every 1 second
				x = setInterval(function() {

					// Get todays date and time
					let now = new Date().getTime();

					// Find the distance between now and the count down date
					let distance = countDownDate - now;

					// Time calculations for days, hours, minutes and seconds
					let minutes = Math.floor((distance % (1000 * 60 * 61)) / (1000 * 60));
					let seconds = Math.floor((distance % (1000 * 60)) / 1000);

					// Output the result in an element with id="demo"
					document.getElementsByName("mail")[0].className = 'mail disabled';
					document.getElementsByName("code")[0].placeholder = 'Auth-Code ' + minutes.pad(2) + ":" + seconds.pad(2);

					// If the count down is over, write some text 
					if (distance < 0) {
						clearInterval(x);
						x = null;
						document.getElementsByName("code")[0].placeholder = "Auth-Code EXPIRED";
					}
				}, 500);

			} else if(ret['send'] == 'over') {

				Swal.fire({
					type: 'info',
					title: 'Mail exceeded sending limit',
					text: 'Please contact us. (admin@rgbplace.com)'
				})

			} else if(ret['send'] == 'already') {

				Swal.fire({
					type: 'info',
					title: 'Send Failed',
					text: 'Your Mail Already used.'
				})
			}

		}, null);

	}
}

if (signin) signin.addEventListener("submit", function () { event.preventDefault(); setTimeout(function() {signInCheck(signin);}, 500) });
if (signup) signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
if (signUpConf) signUpConf.addEventListener("input", passwordCheck);
