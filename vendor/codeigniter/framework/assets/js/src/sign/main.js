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

if (signup) signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
if (signUpConf) signUpConf.addEventListener("input", passwordCheck);
