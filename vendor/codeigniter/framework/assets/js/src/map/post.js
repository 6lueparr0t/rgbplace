"use strict"
//view page(post) event

function messageBoxToggle (i, state) {

	if(state === true) {
		messageBox[i].style.display = "none";
		messageBoxNo[i].style.display = "initial";
		messageBoxYes[i].style.display = "initial";
	} else if(state === false) {
		messageBox[i].style.display = "initial";
		messageBoxNo[i].style.display = "none";
		messageBoxYes[i].style.display = "none";
	}
};

let messageBox     = document.querySelectorAll(".message-button:not(.no):not(.yes)");
let messageBoxNo   = document.querySelectorAll(".message-button.no:not(.yes)");
let messageBoxYes  = document.querySelectorAll(".message-button.yes:not(.no)");

if (messageBox && messageBoxNo && messageBoxYes) {
	//Switch
	for(let i=0; i<messageBox.length; i++) {
		messageBox[i].addEventListener("click", function() {
			messageBoxToggle.call(this, i, true);
		});
	}

	//Reset
	for(let i=0; i<messageBoxNo.length; i++) {
		messageBoxNo[i].addEventListener("click", function() {
			messageBoxToggle.call(this, i, false);
		});
	}
}
