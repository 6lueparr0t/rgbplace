"use strict"
//view page(post) event

let replyBox     = document.querySelectorAll(".reply-button:not(.no):not(.yes)");
let replyBoxNo   = document.querySelectorAll(".reply-button.no:not(.yes)");
let replyBoxYes  = document.querySelectorAll(".reply-button.yes:not(.no)");

function replyBoxToggle (i, state) {

	if(state === true) {
		replyBox[i].style.display = "none";
		replyBoxNo[i].style.display = "initial";
		replyBoxYes[i].style.display = "initial";
	} else if(state === false) {
		replyBox[i].style.display = "initial";
		replyBoxNo[i].style.display = "none";
		replyBoxYes[i].style.display = "none";
	}
};

if (replyBox && replyBoxNo && replyBoxYes) {
	//Switch
	for(let i=0; i<replyBox.length; i++) {
		replyBox[i].addEventListener("click", function() {
			replyBoxToggle.call(this, i, true);
		});
	}

	//Reset
	for(let i=0; i<replyBoxNo.length; i++) {
		replyBoxNo[i].addEventListener("click", function() {
			replyBoxToggle.call(this, i, false);
		});
	}
}
