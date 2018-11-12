"use strict"

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
	let re = /[^\s]{2,20}/;
	result = re.test(String(email).toLowerCase());

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

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;

	//switch(t.classList.item(0)) {
	//}

	let name = '', email = '';

	switch(t.id) {
		case 'save' :
			let data = [];


			if(validateName(document.querySelector('#name').value)) {
				name = document.querySelector('#name').value;
			}

			if(validateEmail(document.querySelector('#email').value)) {
				email = document.querySelector('#email').value;
			}

			data.push({
				'info': __URL__,
				'name': name,
				'email': email
			});

			//console.log(data);
			httpRequest('put', '/api/request/profile/save', JSON.stringify(data), done, fail);
			break;
		case 'cancel' :
			back();
			break;
	}
});

!function() {
    //document.querySelector(".view").click();
}();
