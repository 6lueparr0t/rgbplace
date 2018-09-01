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

	// reply button event
	if (t.parentElement.className.search("reply enable") === 0 || t.className.search("reply enable") === 0) {

		// reply item (li tag)
		if(t.tagName === "I") t = t.parentElement;
		let reply = t.parentElement.parentElement.parentElement.parentElement;

		t.classList.toggle('show');

		if(reply.lastChild.className.search("reply-container") === 0) {
			reply.removeChild(reply.lastChild);
		} else {
			let no = reply.querySelector("ul .no").innerHTML;
			let node = document.createElement("li");
			node.className = "reply-container";
			node.innerHTML =
				"<div class='reply-addon block' id='reply-"+no+"' name='reply-"+no+"'>"
					+"<input type='hidden' class='reply-no' value='"+no+"'/>"
					+"<textarea class='reply-box' id='reply-box-"+no+"' placeholder='Leave a Message .. &#xf303;'></textarea>"

					+"<div class='reply-button-group'>"
						+"<div class='reply-button send to'>Reply on Message <span style='font-weight:900;transform: translate(.4rem,.1rem);'>&#xf11c;</span></div>"
						+"<div class='reply-button yes to'>Confirm</div>"
						+"<div class='reply-button no to'>Not Yet ..</div>"
						+"<div class='reply-button cancel'>Cancel</div>"
					+"</div>";

				+"</div>";

			reply.appendChild(node);
		}
	}

	if (t.parentElement.parentElement.className.search("reply-pagination") === 0 || t.parentElement.className.search("reply-pagination") === 0) {
		if(t.tagName === "I") t = t.parentElement;
		let page = t.getAttribute('data');
		getReplyPaging(page);
	}

	let reply, no, message; 

	//console.log(t.parentElement);
	switch (t.className) {
		case "reply-button cancel" :
			// reply item (li tag)
			let cancel = t.parentElement.parentElement.parentElement.parentElement;
			cancel.querySelector(".reply.enable").classList.toggle('show');
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
			message = reply.querySelector(".reply-box").value;

			let data = [];
			data.push({
				'info': __URL__,
				'no': no,
				'message': message,
			});

			//var response = [];
			//for(var pair of data.entries()) { response.push(pair); }

			//httpRequest(method, url, data, success, error);
			httpRequest('POST', '/api/request/reply', JSON.stringify(data), success.bind(this), fail.bind(this));

			break;

		case "reply-button no to" :
		case "reply-button no" :
			replyBoxToggle.call(t, false);
			break;

		case "delete enable":
			reply = t.parentElement.parentElement.parentElement;
			no = reply.querySelector(".no").innerHTML;

			break;
	}

});

function success (data) {
	//console.log(data);
	alert('TEMP::Message sent successfully');
	httpRequest('GET', '/api/request/reply?info='+__URL__, null, refresh.bind(this), fail.bind(this));
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

