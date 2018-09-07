"use strict"
//view page(post) event

let replyBox     = document.querySelectorAll(".reply-button:not(.no):not(.yes)");
let replyBoxNo   = document.querySelectorAll(".reply-button.no");
let replyBoxYes  = document.querySelectorAll(".reply-button.yes");

//console.log(replyBox);

//when start, get reply
!function () {
	httpRequest('GET', '/api/request/reply?info='+__URL__, null, refresh.bind(this), fail.bind(this));
}();

function replyTemplate(no, mode, message) {
	let node = document.createElement("li");
	node.className = "reply-container";
	node.innerHTML =
		"<div class='reply-addon block' id='reply-"+no+"' name='reply-"+no+"'>"
		+"<input type='hidden' class='reply-no' value='"+no+"'/>"
		+"<input type='hidden' class='reply-mode' value='"+mode+"'/>"
		+"<div class='reply-box' id='reply-box-"+no+"' placeholder='Leave a Message .. &#xf303;' contenteditable='true'>"+message+"</div>"

		+"<div class='reply-button-group'>"
		+"<div class='reply-button send to'>Reply on Message <span style='font-weight:900;transform: translate(.4rem,.1rem);'>&#xf11c;</span></div>"
		+"<div class='reply-button yes to'>Confirm</div>"
		+"<div class='reply-button no to'>Not Yet ..</div>"
		+"<div class='reply-button cancel'>Cancel</div>"
		+"</div>";

	+"</div>";

	return node;
}

//reply Paging Process
function getReplyPaging(page) {
	httpRequest('GET', '/api/request/reply?info='+__URL__+'&page='+page, null, refresh.bind(this), fail.bind(this));
}

function replyBoxToggle (state) {

//	try {
//		console.log(this);
//		console.log(this.previousSibling);
//		console.log(this.previousSibling.previousSibling);
//	} catch(e) {
//	}

	if(state) {
		this.style.display = "none";
		this.nextSibling.style.display = "initial";
		this.nextSibling.nextSibling.style.display = "initial";
	} else {
		this.style.display = "none";
		this.previousSibling.style.display = "none";
		this.previousSibling.previousSibling.style.display = "initial";
	}
}

document.querySelector("body").addEventListener("click", function(event) {

	let t = event.target;
	if (t.tagName === 'BODY') return false;
	if(t.tagName === "I") t = t.parentElement;

	// reply button event

	if (t.parentElement.className.search("reply-pagination") === 0) {
		let page = t.getAttribute('data');
		getReplyPaging(page);
	}

	let reply, no, node;
	let message = '';
	let mode = 'POST';
	let data = [];

	//console.log(t.parentElement);
	switch (t.className) {
		case "reply enable" :
		case "reply enable show" :
		case "reply-modify enable":
		case "reply-modify enable show" :
			// reply item (li tag)
			reply = t.parentElement.parentElement.parentElement.parentElement;
			no = reply.querySelector("ul .no").innerHTML;

			if(t.classList.contains('reply-modify')) {
				message  = reply.querySelector("ul .content .text").innerHTML;
				reply.querySelector("ul").classList.toggle('hide');
				mode = 'UPDATE';
			}

			t.classList.toggle('show');

			if(reply.lastChild.className.search("reply-container") === 0) {
				reply.removeChild(reply.lastChild);
				if(mode === 'UPDATE') {
					reply.appendChild(replyTemplate(no, mode, message));
				}
			} else {
				reply.appendChild(replyTemplate(no, mode, message));
			}
			break;

		case "reply-delete enable":

			reply = t.parentElement.parentElement.parentElement.parentElement;

			no = reply.querySelector("ul .no").innerHTML;
			mode = 'DELETE';

			data.push({
				'info': __URL__,
				'no': no
			});

			httpRequest(mode, '/api/request/reply', JSON.stringify(data), success.bind(this), fail.bind(this));

			break;

		case "reply-button cancel" :
			// reply item (li tag)
			let cancel = t.parentElement.parentElement.parentElement.parentElement;
			cancel.querySelector(".reply.enable").classList.remove('show');
			cancel.querySelector("ul").classList.remove('hide');
			cancel.removeChild(cancel.lastChild);
			break;

		case "reply-button send to" :
		case "reply-button send" :
			replyBoxToggle.call(t, true);
			break;

		case "reply-button yes to" :
		case "reply-button yes" :
			reply = t.parentElement.parentElement;

			no = reply.querySelector(".reply-no").value;
			mode = reply.querySelector(".reply-mode").value;
			message = reply.querySelector(".reply-box").innerHTML;

			data.push({
				'info': __URL__,
				'no': no,
				'message': message,
			});

			//var response = [];
			//for(var pair of data.entries()) { response.push(pair); }
			
			this.page = document.querySelector(".reply-pagination .active").getAttribute('data');

			httpRequest(mode, '/api/request/reply', JSON.stringify(data), success.bind(this), fail.bind(this));

			break;

		case "reply-button no to" :
		case "reply-button no" :
			replyBoxToggle.call(t, false);
			break;

		case "delete enable":

			data.push({
				'info': __URL__,
				'no': no
			});

			httpRequest('delete', '/api/request/post', JSON.stringify(data), successDelete.bind(this), fail.bind(this));

			break;
	}

});

function success (data) {
	//console.log(data);
	//httpRequest('GET', '/api/request/reply?page='+this.page+'&info='+__URL__, null, refresh.bind(this), fail.bind(this));
	getReplyPaging(this.page);
}

function successDelete (data) {
	//console.log(data);
	alert('Post Remove successfully');
	redirect('list');
}

function refresh (data) {
	if(data) document.querySelector(".reply-root").innerHTML = data;
}

function fail (data) {
	let e = document.querySelector("#login");
	//console.log(data.responseText);
	e.setCustomValidity(data.responseText);
	e.reportValidity();
}

