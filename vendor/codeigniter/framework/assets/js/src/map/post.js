"use strict"
//view page(post) event

let replyBox     = document.querySelectorAll(".reply-button:not(.no):not(.yes)");
let replyBoxNo   = document.querySelectorAll(".reply-button.no");
let replyBoxYes  = document.querySelectorAll(".reply-button.yes");

//console.log(replyBox);

function replyTemplate(no, mode, message) {
	let node = document.createElement("li");
	node.className = "reply-container";
	node.innerHTML =
		"<div class='reply-addon block'>"
		+"<input type='hidden' class='reply-no' value='"+no+"'/>"
		+"<input type='hidden' class='reply-mode' value='"+mode+"'/>"
		+"<textarea class='reply-box' id='reply-box-"+no+"' placeholder='Leave a Message .. &#xf303;'>"+message+"</textarea>"

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

	if (t.parentElement.className === 'reply-pagination') {
		let page = t.getAttribute('data');
		getReplyPaging(page);
	}

	let reply, no, node;
	let message = '';
	let mode = 'POST';
	let data = [];

	//console.log(t.parentElement);
	//console.log(t.className.trim());
	switch (t.className.trim()) {
		case "far fa-thumbs-up post-up enable" :
		case "far fa-thumbs-up post-up enable active" :
			this.act = 'up';

			data.push({
				'info': __URL__,
				'target':'POST',
				'act':this.act,
			});

			httpRequest(mode, '/api/request/vote/post', JSON.stringify(data), successPostVote.bind(this), fail.bind(this));
			break;
		case "far fa-thumbs-down post-down enable" :
		case "far fa-thumbs-down post-down enable active" :
			this.act = 'down';

			data.push({
				'info': __URL__,
				'target':'POST',
				'act':this.act,
			});

			httpRequest(mode, '/api/request/vote/post', JSON.stringify(data), successPostVote.bind(this), fail.bind(this));
			break;
		case "far fa-thumbs-up reply-up enable" :
		case "far fa-thumbs-up reply-up enable active" :
			reply = t.parentElement.parentElement.parentElement;
			reply.act = 'up';

			data.push({
				'info': __URL_ARRAY__[0]+"/"+__URL_ARRAY__[1]+"/"+__URL_ARRAY__[2]+"/"+reply.querySelector('.no').innerHTML,
				'target':'REPLY',
				'act':reply.act,
			});

			httpRequest(mode, '/api/request/vote/reply', JSON.stringify(data), successReplyVote.bind(reply), fail.bind(reply));
			break;
		case "far fa-thumbs-down reply-down enable" :
		case "far fa-thumbs-down reply-down enable active" :
			reply = t.parentElement.parentElement.parentElement;
			reply.act = 'down';

			data.push({
				'info': __URL_ARRAY__[0]+"/"+__URL_ARRAY__[1]+"/"+__URL_ARRAY__[2]+"/"+reply.querySelector('.no').innerHTML,
				'target':'REPLY',
				'act':reply.act,
			});

			httpRequest(mode, '/api/request/vote/reply', JSON.stringify(data), successReplyVote.bind(reply), fail.bind(reply));
			break;
		case "report enable":
			reply = t.parentElement.parentElement.parentElement;
			reply.act = 'report';

			data.push({
				'info': __URL_ARRAY__[0]+"/"+__URL_ARRAY__[1]+"/"+__URL_ARRAY__[2]+"/"+reply.querySelector('.no').innerHTML,
				'target':'REPLY',
				'act':reply.act,
			});

			httpRequest(mode, '/api/request/report', JSON.stringify(data), successReport.bind(reply), fail.bind(reply));
			break;
		case "reply enable" :
		case "reply enable show" :
		case "reply-modify enable":
		case "reply-modify enable show" :
			// reply item (li tag)
			reply = t.parentElement.parentElement.parentElement.parentElement;
			no = reply.querySelector("ul .no").innerHTML;

			if(t.classList.contains('reply-modify')) {
				//message  = reply.querySelector("ul .content .text").value;
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
			//message = reply.querySelector(".reply-box").innerHTML;
			message = reply.querySelector(".reply-box");

			if(!message.value) {
				message.setCustomValidity('😳💬');
				message.reportValidity();
				break;
			}

			data.push({
				'info': __URL__,
				'no': no,
				'message': message.value,
			});

			//var response = [];
			//for(var pair of data.entries()) { response.push(pair); }
			
			//console.log(data);

			httpRequest(mode, '/api/request/reply', JSON.stringify(data), success.bind(this), fail.bind(this));

			break;

		case "reply-button no to" :
		case "reply-button no" :
			replyBoxToggle.call(t, false);
			break;

		case "delete enable":

			data.push({
				'info': __URL__
			});

			httpRequest('delete', '/api/request/post', JSON.stringify(data), successDelete.bind(this), fail.bind(this));

			break;
	}

	switch (t.id) {
		case "link-copy" :
			let clip = document.getElementById(t.id);

			if(document.body.createTextRange) {
				let range = document.body.createTextRange();
				range.moveToElementText(clip);
				range.select();
				document.execCommand("Copy");
				alert("copy link !");
				document.selection.empty();
			}
			else if(window.getSelection) {
				let selection = window.getSelection();
				let range = document.createRange();
				range.selectNodeContents(clip);
				selection.removeAllRanges();
				selection.addRange(range);
				document.execCommand("Copy");
				alert("copy link !");
				selection.removeAllRanges();
			}

			break;
	}

});

function success (data) {
	console.log(data);
	//httpRequest('GET', '/api/request/reply?page='+this.page+'&info='+__URL__, null, refresh.bind(this), fail.bind(this));
	getReplyPaging(data);
}

function successDelete (data) {
	//console.log(data);
	alert('Post was Deleted');
	redirect('list');
}

function successReplyVote (data) {
	//document.querySelector(".post-"+this.act+".enable").innerHTML = " "+data+" ";
	//document.querySelector(".post-"+this.act+".enable").classList.toggle('active');
	if(data > -1) {
		this.querySelector(".reply-"+this.act+".enable").innerHTML = " "+data+" ";
		this.querySelector(".reply-"+this.act+".enable").classList.toggle('active');
	}
}

function successPostVote (data) {
	if(data > -1) {
		document.querySelector(".post-"+this.act+".enable").innerHTML = " "+data+" ";
		document.querySelector(".post-"+this.act+".enable").classList.toggle('active');

		let type = ['free', 'info']
		if(type.includes(__URL_ARRAY__[2]) && data>20) {
			alert('😎');
			redirect(__URL_ARRAY__[3], 'best');
		}
	}
}

function successReport (data) {
	if(data > -1) {
		alert('🕶️ Reply was reported ! 👊');
	} else {
		alert('you can not report it anymore.');
	}
}

function refresh (data) {
	if(data) document.querySelector(".reply-root").innerHTML = data;
	if(this) move("#reply-"+this, -200);
}

function fail (data) {
	let e = document.querySelector("#login");
	//console.log(data.responseText);
	e.setCustomValidity(data.responseText);
	e.reportValidity();
}

//when start, get reply
!function () {
	let url = new URL(window.location);
	let no = url.searchParams.get("no");

	let param = (no)?'&no='+no:'';

	httpRequest('GET', '/api/request/reply?info='+__URL__+param, null, refresh.bind(no), fail.bind(this));

}();

