"use strict"

const params = new URLSearchParams(window.location.search);

let pswd = document.querySelector("#pswd");
let conf = document.querySelector("#conf");

function done (data) {
	let num = data;
	alert('수정되었습니다.\nDone !');
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

function validateEmail(mail) {

	let result = false;
	if(mail.length < 400) {
		let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		result = re.test(String(mail).toLowerCase());
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

window.onpopstate = event => (event.state)? tabChange(event.state.tab):history.go(-1);

function tabChange (tab) {
	params.delete('page');
    document.querySelectorAll('.tab div').forEach(function(element) {
        element.classList.remove('active');
        document.querySelector('#'+element.className+'-area').classList.add('none');
    });

    document.querySelector('.'+tab).classList.add('active');
    document.querySelector('#'+tab+'-area').classList.remove('none');
}

document.querySelector("#profile").addEventListener("click", function(event) {
	let t = event.target;

	let name = '', mail = '', pswd_conf = '';
	let data = [];

	if(t.parentElement.className == 'tab') {
		let data = {
			'info': __URL__,
			'tab': t.classList.item(0)
		};

		let search = {
			'no':(params.get('no'))?'&no='+params.get('no'):'',
			'page':(params.get('page'))?'&page='+params.get('page'):''
		}

		switch(data['tab']) {
			case 'info' :
				history.pushState({tab: data['tab']}, '', '?tab='+data['tab']+search['no']);
				tabChange(data['tab']);
				break;
			case 'upload' :
			case 'post' :
			case 'reply' :
			case 'message' :
			case 'report' :
				history.pushState({tab: data['tab']}, '', '?tab='+data['tab']+search['no']+search['page']);
				tabChange(data['tab']);

				httpRequest('get', '/api/request/profile?info='+data['info']+'&tab='+data['tab']+search['no']+search['page'], null,
				ret => {
					let list = document.querySelector('#'+data['tab']+'-list');
					let page = document.querySelector('#'+data['tab']+'-page');
					
					list.innerHTML = (ret['list'])?ret['list']:'';
					page.innerHTML = (ret['page'])?ret['page']:'';
				}, fail);
				break;
		}

		return;
	}

	if (t.parentElement.className === 'profile-pagination') {
		//console.log(t.parentElement.className);
		let tab  = t.getAttribute('data-tab');
		let page = t.getAttribute('data-page');
		let no = (t.getAttribute('data-no'))?t.getAttribute('data-no'):'';
		let param  = '&tab='+tab+'&page='+page+'&no='+no;
		
		history.pushState({tab: tab}, '', '?tab='+tab+'&page='+page+'&no='+no);
		httpRequest('get', '/api/request/profile?info='+__URL__+param, null,
				ret => {
					let list = document.querySelector('#'+tab+'-list');
					let page = document.querySelector('#'+tab+'-page');
					
					list.innerHTML = ret['list'];
					page.innerHTML = ret['page'];
				}, fail);

		return;
	}

	if (t.classList.item(0) == 'delete-message') {

		data.push({
			'info': __URL__,
			'tab':'message',
			'idx':t.getAttribute('data-idx')
		});

		httpRequest('delete', '/api/request/profile', JSON.stringify(data),
			() => {
				document.querySelector(".message").click();
			}, fail);

		return;
	}

	switch(t.id) {
		case 'save' :
			if(validateName(document.querySelector('#name').value)) {
				name = document.querySelector('#name').value;
			} else {
				alert('check your name style');
				break;
			}

			if(document.querySelector('#mail') != null) {
				if(validateEmail(document.querySelector('#mail').value)) {
					mail = document.querySelector('#mail').value;
				} else {
					alert('check your mail pattern');
					break;
				}
			}

			if((pswd && conf) && (pswd.value || conf.value)) {
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
				'info' : __URL__,
				'no'   : (params.get('no'))?params.get('no'):0,
				'name' : name,
				'mail' : mail,
				'pswd' : pswd_conf
			});

			//console.log(data);
			httpRequest('put', '/api/request/profile/save', JSON.stringify(data), done, fail);
			break;
		case 'cancel' :
			back();
			break;
		case 'delete' :
			if(confirm('계정을 삭제하시겠습니까? 계정 삭제 시, 게시물은 남아있을 수 있습니다. \n Delete Your Account? your post & reply will be remain')) {
				data.push({
					'info': __URL__,
					'tab':(params.get('tab'))?params.get('tab'):0,
					'no':(params.get('no'))?params.get('no'):0
				});

				//console.log(data);
				httpRequest('delete', '/api/request/profile', JSON.stringify(data), ret => {alert('Bye Bye Badman !'); back(); }, fail);
			}
			break;
	}
});

if (conf) conf.addEventListener("input", passwordCheck);

!(() => {
	let tab = (params.get('tab'))?params.get('tab'):'info';
	document.querySelector("."+tab).click();
})();
