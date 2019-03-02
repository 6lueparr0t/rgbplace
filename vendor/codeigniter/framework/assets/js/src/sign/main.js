"use strict";

let signup = document.querySelector("#sign-up");
let signUpConf = document.querySelector("#sign-up input[name='conf']");

window.addEventListener("beforeunload", onUnload);

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

Number.prototype.pad = function(size) {
	let sign = Math.sign(this) === -1 ? '-' : '';
	return sign + new Array(size).concat([Math.abs(this)]).join('0').slice(-size);
}

let x;
function sendCode() {

	let mail = document.querySelector("[name='mail']").value;

	let check = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if( check.test(String(mail).toLowerCase()) === false ) {
		Swal.fire({
			type: 'error',
			title: 'Check Your Email..',
			text: 'Please enter a valid Email address'
		})

		return true;
	}

	let data = {'mail':mail};

	if (!x) {

		httpRequest('POST', '/sign/mailAuth', JSON.stringify(data), data => {

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
				document.getElementsByName("mail")[0].disabled = true;
				document.getElementsByName("code")[0].placeholder = 'E-mail Auth Code - ' + minutes.pad(2) + ":" + seconds.pad(2);

				// If the count down is over, write some text 
				if (distance < 0) {
					clearInterval(x);
					x = null;
					document.getElementsByName("code")[0].placeholder = "E-mail Auth Code - EXPIRED";
				}
			}, 500);

		}, null);

	}
}

if (signup) signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
if (signUpConf) signUpConf.addEventListener("input", passwordCheck);
