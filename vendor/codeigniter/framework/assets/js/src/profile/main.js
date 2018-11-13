"use strict"

let pswd = document.querySelector("#pswd");
let conf = document.querySelector("#conf");

function done (data) {
	let num = data;
	alert('save done');
	//redirect(num);
}

function fail (data) {
	console.log(data);
	alert('fail');
}

function validateName(name) {
	let result = false;
	let re = /^.{2,20}[^\s\x22\x27](?!.*[\s\x22\x27])/;
	result = re.test(String(name).toLowerCase());

	return result;
}

function validateEmail(email) {

	let result = false;
	if(email.length < 400) {
		let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		result = re.test(String(email).toLowerCase());
	}

	return result;
}

function passwordCheck () {
	//console.log(this.value);
	//console.log(pswd.value);
	if (this.value != pswd.value) {
		this.setCustomValidity('패스워드를 확인해주세요.\nPlease Check your Password.');
	} else {
		this.setCustomValidity('');
	}

	this.reportValidity();
}

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;

	//switch(t.classList.item(0)) {
	//}

	let name = '', email = '', pswd_conf = '';

	switch(t.id) {
		case 'save' :
			let data = [];


			if(validateName(document.querySelector('#name').value)) {
				name = document.querySelector('#name').value;
			} else {
				alert('check your name style');
				break;
			}

			if(validateEmail(document.querySelector('#email').value)) {
				email = document.querySelector('#email').value;
			} else {
				alert('check your email pattern');
				break;
			}

			if(pswd.value && conf.value) {
				if(pswd.value != conf.value) {
					conf.reportValidity();
					break;
				} else {
					pswd_conf = pswd.value;
				}
			}

			data.push({
				'info': __URL__,
				'name': name,
				'email': email,
				'pswd': pswd_conf
			});

			//console.log(data);
			httpRequest('put', '/api/request/profile/save', JSON.stringify(data), done, fail);
			break;
		case 'cancel' :
			back();
			break;
	}
});

if (conf) conf.addEventListener("input", passwordCheck);

!function() {
    //document.querySelector(".view").click();
}();