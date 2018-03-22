"use strict"
//view page(post) event

let replyBox     = document.querySelectorAll(".reply-button:not(.no):not(.yes)");
let replyBoxNo   = document.querySelectorAll(".reply-button.no");
let replyBoxYes  = document.querySelectorAll(".reply-button.yes");

console.log(replyBox);

function replyBoxToggle (i, state) {

	//console.log(this);

	if(state === true) {
		this.style.display = "none";
		this.nextSibling.style.display = "initial";
		this.nextSibling.nextSibling.style.display = "initial";
	} else if(state === false) {
		this.style.display = "none";
		this.previousSibling.style.display = "none";
		this.previousSibling.previousSibling.style.display = "initial";
	}
//	if(state === true) {
//		eplyBox[i].style.display = "none";
//		replyBoxNo[i].style.display = "initial";
//		replyBoxYes[i].style.display = "initial";
//	} else if(state === false) {
//		replyBox[i].style.display = "initial";
//		replyBoxNo[i].style.display = "none";
//		replyBoxYes[i].style.display = "none";
//	}
};

//if (replyBox && replyBoxNo && replyBoxYes) {
//	//Switch
//	for(let i=0; i<replyBox.length; i++) {
//		replyBox[i].addEventListener("click", function() {
//			replyBoxToggle.call(this, i, true);
//		});
//	}
//
//	//Reset
//	for(let i=0; i<replyBoxNo.length; i++) {
//		replyBoxNo[i].addEventListener("click", function() {
//			replyBoxToggle.call(this, i, false);
//		});
//	}
//}

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;

	// reply button event
	if (t.parentElement.className.search("reply enable") == 0 || t.className.search("reply enable") == 0) {
		console.log(t.className);

		let reply = t.parentElement.parentElement.parentElement.parentElement;
		t.classList.toggle('show');

		if(t.classList.contains('show') == 0) {
			reply.removeChild(reply.lastChild);
		} else {
			let no = reply.querySelector("ul .no").innerHTML;
			let node = document.createElement("li");
			node.innerHTML =
				"<div class='reply block' id='reply-"+no+"' name='reply-"+no+"'>"
				+"<input type='hidden' class='reply-no' value=''>"
				+"<textarea class='reply-box' id='reply-box-"+no+"' placeholder='Leave a Message .. &#xf040;'></textarea>"
				+"<div class='reply-button-group'>"

				+"<div class='reply-button send to' onclick='replyBoxToggle.call(this, "+no+",true)'>Send <i class='fa fa-keyboard-o' aria-hidden='true' style='position: absolute;margin: 0 .5rem;'></i> </div>"
				+"<div class='reply-button send to yes'>yes</div>"
				+"<div class='reply-button send to no' onclick='replyBoxToggle.call(this, "+no+",false)'>no</div>"

				+"</div>";

			reply.appendChild(node);
		}
	}
});
