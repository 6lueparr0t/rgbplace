"use strict"

function messageBoxSendToggle (i, state) {

	if(state === true) {
		messageBoxSend[i].style.display = "none";
		messageBoxSendNo[i].style.display = "initial";
		messageBoxSendYes[i].style.display = "initial";
	} else if(state === false) {
		messageBoxSend[i].style.display = "initial";
		messageBoxSendNo[i].style.display = "none";
		messageBoxSendYes[i].style.display = "none";
	}
};

function messageBoxResetToggle (i, state) {

	if(state === true) {
		messageBoxReset[i].style.display = "none";
		messageBoxResetNo[i].style.display = "initial";
		messageBoxResetYes[i].style.display = "initial";
	} else if(state === false) {
		messageBoxReset[i].style.display = "initial";
		messageBoxResetNo[i].style.display = "none";
		messageBoxResetYes[i].style.display = "none";
	}
};

let messageBoxSend     = document.querySelectorAll(".message-button-send:not(.no):not(.yes)");
let messageBoxSendNo   = document.querySelectorAll(".message-button-send.no:not(.yes)");
let messageBoxSendYes  = document.querySelectorAll(".message-button-send.yes:not(.no)");

let messageBoxReset    = document.querySelectorAll(".message-button-reset:not(.no):not(.yes)");
let messageBoxResetNo  = document.querySelectorAll(".message-button-reset.no:not(.yes)");
let messageBoxResetYes = document.querySelectorAll(".message-button-reset.yes:not(.no)");

if (messageBoxSend) {
	for(let i=0; i<messageBoxSend.length; i++) {
		messageBoxSend[i].addEventListener("click", function() {
			messageBoxSendToggle.call(this, i, true);
		});
	}
}

if (messageBoxReset) {
	for(let i=0; i<messageBoxReset.length; i++) {
		messageBoxReset[i].addEventListener("click", function() {
			messageBoxResetToggle.call(this, i, true);
		});
	}
}

if (messageBoxSendNo) {
	for(let i=0; i<messageBoxSendNo.length; i++) {
		messageBoxSendNo[i].addEventListener("click", function() {
			messageBoxSendToggle.call(this, i, false);
		});
	}
}

if (messageBoxResetNo) {
	for(let i=0; i<messageBoxResetNo.length; i++) {
		messageBoxResetNo[i].addEventListener("click", function() {
			messageBoxResetToggle.call(this, i, false);
		});
	}
}
