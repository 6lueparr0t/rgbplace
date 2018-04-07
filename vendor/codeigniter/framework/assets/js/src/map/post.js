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
					+"<textarea class='reply-box' id='reply-box-"+no+"' placeholder='Leave a Message .. &#xf040;'></textarea>"

					+"<div class='reply-button-group'>"
						+"<div class='reply-button send to''>Send <i class='fa fa-keyboard-o' aria-hidden='true' style='position: absolute;margin: 0 .5rem;'></i> </div>"
						+"<div class='reply-button yes to'>yes</div>"
						+"<div class='reply-button no  to'>no</div>"
						+"<div class='reply-button cancel'>Cancel</div>"
					+"</div>";

				+"</div>";

			reply.appendChild(node);
		}
	}

	if (t.className.search("reply-button cancel") === 0) {

		// reply item (li tag)
		let cancel = t.parentElement.parentElement.parentElement.parentElement;
		cancel.querySelector(".reply.enable").classList.toggle('show');
		cancel.removeChild(cancel.lastChild);
		
	}

	if (t.className.search("reply-button send") === 0) {
		replyBoxToggle.call(t, true);
	}

	if (t.className.search("reply-button no") === 0) {
		replyBoxToggle.call(t, false);
	}


});
