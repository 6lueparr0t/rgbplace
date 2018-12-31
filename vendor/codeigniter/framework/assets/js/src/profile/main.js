"use strict"

let pswd = document.querySelector("#pswd");
let conf = document.querySelector("#conf");

function done (data) {
	let num = data;
	alert('save done');
	location.reload();
	//redirect(num);
}

function fail (data) {
	//console.log(data);
	alert('fail');
}

function validateName(name) {
	let result = false;
	let re = /^(?=[^\s\x22\x27])(?!.*[\s\x22\x27]).{2,20}$/;
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

window.onpopstate = event => tabChange(event.state.className);

function tabChange (className) {
    document.querySelectorAll('.tab div').forEach(function(element) {
        element.classList.remove('active');
        document.querySelector('#'+element.className+'-area').classList.add('none');
    });

    document.querySelector('.'+className).classList.add('active');
    document.querySelector('#'+className+'-area').classList.remove('none');
}

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;

	//switch(t.classList.item(0)) {
	//}

	let name = '', email = '', pswd_conf = '';

	switch(t.classList.item(0)) {
        case 'info' :
        case 'upload' :
        case 'post' :
        case 'reply' :
        case 'vote' :
        case 'report' :
			history.pushState({className: t.className}, '', '?mode='+t.className)
            tabChange(t.className);
            break;
    }

	switch(t.id) {
		case 'save' :
			let data = [];

			if(validateName(document.querySelector('#name').value)) {
				name = document.querySelector('#name').value;
			} else {
				alert('check your name style');
				break;
			}

			if(document.querySelector('#email') != null) {
				if(validateEmail(document.querySelector('#email').value)) {
					email = document.querySelector('#email').value;
				} else {
					alert('check your email pattern');
					break;
				}
			}

			if(pswd.value || conf.value) {
				if(pswd.value != conf.value) {
					conf.reportValidity();
					break;
				} else {
					if ( (pswd.value.length > 0 && pswd.value.length < 10) || (conf.value.length > 0 && conf.value.length < 10) ) {
						pswd.setCustomValidity('패스워드는 최대 10자 이상 넣어주세요. Password must be at least 10 characters.');
						pswd.reportValidity();
						break;
					}
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

!(() => {
	let params = new URLSearchParams(window.location.search);
	let mode = (params.get('mode'))?params.get('mode'):'info';
	document.querySelector("."+mode).click();
})();
