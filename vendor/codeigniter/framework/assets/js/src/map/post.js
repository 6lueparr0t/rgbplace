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
			let node = document.createElement("li");
			node.className = "reply-container";
			node.innerHTML =
				"<div class='reply block' id='reply-"+no+"' name='reply-"+no+"'>"
					+"<input type='hidden' class='reply-no' value='"+no+"'>"
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
			let reply = t.parentElement.parentElement;
			let data = new FormData();

			var test = success.bind(this);

			data.append('reply-box', reply.querySelector(".reply-box").value);
			data.append('reply-no', reply.querySelector(".reply-no").value);

			//httpRequest(method, url, data, success, error);
			//httpRequest('POST', '/', data, success, error);

			test(data);
			break;

		case "reply-button no to" :
		case "reply-button no" :
			replyBoxToggle.call(t, false);
			break;
	}

});

function success (data) {
	var response = [];
	for(var pair of data.entries()) { response.push(pair); }
	console.log(JSON.stringify(response));
	alert('TEMP::Message sent successfully');
	//location.reload();
}

