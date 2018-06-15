"use strict"
//view page(post) event

let replyBox     = document.querySelectorAll(".reply-button:not(.no):not(.yes)");
let replyBoxNo   = document.querySelectorAll(".reply-button.no");
let replyBoxYes  = document.querySelectorAll(".reply-button.yes");

//console.log(replyBox);

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

	// reply button event
	if (t.parentElement.className.search("reply enable") === 0 || t.className.search("reply enable") === 0) {

		// reply item (li tag)
		let reply = t.parentElement.parentElement.parentElement.parentElement;

		t.classList.toggle('show');

		if(reply.lastChild.className.search("reply-container") === 0) {
			reply.removeChild(reply.lastChild);
		} else {
			let no = reply.querySelector("ul .no").innerHTML;
			let depth = parseInt(reply.querySelector("ul .depth").innerHTML)+1;
			let follow = parseInt(reply.querySelector("ul .follow").innerHTML);
			let name = reply.querySelector("ul .name").innerHTML;
			let node = document.createElement("li");
			node.className = "reply-container";
			node.innerHTML =
				"<div class='reply block' id='reply-"+no+"' name='reply-"+no+"'>"
					+"<input type='hidden' class='reply-no' value='"+no+"'/>"
					+"<input type='hidden' class='reply-depth' value='"+depth+"'/>"
					+"<input type='hidden' class='reply-follow' value='"+follow+"'/>"
					+"<input type='hidden' class='reply-name' value='"+name+"'/>"
					+"<textarea class='reply-box' id='reply-box-"+no+"' placeholder='Leave a Message .. &#xf303;'></textarea>"

					+"<div class='reply-button-group'>"
						+"<div class='reply-button send to'>Reply on Message <span style='font-weight:900;transform: translate(.4rem,.1rem);'>&#xf11c;</span></div>"
						+"<div class='reply-button yes to'>confirm</div>"
						+"<div class='reply-button no to'>No way!</div>"
						+"<div class='reply-button cancel'>Cancel</div>"
					+"</div>";

				+"</div>";

			reply.appendChild(node);
		}
	}


	let reply, no, message, depth, follow, mention; 

	//console.log(t.className);
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
			depth = reply.querySelector(".reply-depth").value;
			follow = reply.querySelector(".reply-follow").value;
			mention = reply.querySelector(".reply-name").value;

			let data = [];
			data.push({
				'info': URL,
				'no': no,
				'message': message,
				'depth': depth, 
				'follow': follow, 
				'mention': mention, 
			});

			//var response = [];
			//for(var pair of data.entries()) { response.push(pair); }

			//httpRequest(method, url, data, success, error);
			httpRequest('POST', '/map/request/reply', JSON.stringify(data), success.bind(this), fail.bind(this));

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
	console.log(data);
	alert('TEMP::Message sent successfully');
}

function fail (data) {
	console.log('request fail : ');
	console.log(data);
}

