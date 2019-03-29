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
	console.log(data);
	alert('Fail');
}

function updateFail (data) {
	console.log(data);
	Swal.fire({
		type: 'error',
		title: 'Update Fail',
		html: data.responseText
	})
}

function validateName(name) {
	let result = false;
	let re = /^(?=[^\s\x22\x27])(?!.*[\s\x22\x27]).{2,20}$/;
	result = re.test(String(name).toLowerCase());

	return result;
}

function validateMail(mail) {

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

function popup (src, alt) {
	Swal.fire({
		title: alt,
		imageUrl: src,
		imageAlt: alt,
		animation:false
	})
}

let x;
function sendCode() {

	let mail = document.querySelector("#mail").value;

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

		httpRequest('POST', '/sign/mailAuth', JSON.stringify(data), ret => {

			if(ret['send'] == true) {
				Swal.fire({
					type: 'success',
					title: 'Send Successfully!',
					text: 'Check Your MailBox and Input Auth Code in an hour.'
				})

				clearInterval(x);
				document.querySelector(".code").parentElement.className = 'tr';

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
					document.querySelector("#mail").disabled = true;
					document.querySelector("#code").placeholder = 'Expiry Time - ' + minutes.pad(2) + ":" + seconds.pad(2);

					// If the count down is over, write some text
					if (distance < 0) {
						clearInterval(x);
						x = null;
						document.getElementsByName("code")[0].placeholder = "Expiry Time - EXPIRED";
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

	let name = '', mail = '', code = 0, pswd_conf = '';
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

	if (t.classList.item(0) == 'copy') {
		let clip = t.firstElementChild;
        clip.style.display='block';
        clip.select();
        document.execCommand("Copy");

		let tooltip = t.querySelector('.tooltip');
		if(tooltip.style.animation == '') {	
			tooltip.style.animation='fadeInOut 2s ease-out 1';
			tooltip.style.WebkitAnimation='fadeInOut 2s ease-out 1';
			
			setTimeout(function () { this.style.animation=''; this.style.WebkitAnimation=''; }.bind(tooltip), 2000);
			
			clip.style.display='none';
		}

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
			if(validateName(document.querySelector('#name').value.trim())) {
				name = document.querySelector('#name').value.trim();
			} else {
				alert('닉네임을 확인해주세요.(공백, 따옴표[\'"] X)\ncheck your name style(space, quotation mark[\'"] X)');
				break;
			}

			if(document.querySelector('#mail') != null) {
				if(validateMail(document.querySelector('#mail').value)) {
					mail = document.querySelector('#mail').value;
					code = document.querySelector("#code").value;
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
				'code' : code,
				'pswd' : pswd_conf
			});

			//console.log(data);
			httpRequest('put', '/api/request/profile/save', JSON.stringify(data), done, updateFail);
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
		case 'check' :
			sendCode();
			break;

	}
});

if (conf) conf.addEventListener("input", passwordCheck);

!(() => {
	let tab = (params.get('tab'))?params.get('tab'):'info';
	document.querySelector("."+tab).click();
})();
