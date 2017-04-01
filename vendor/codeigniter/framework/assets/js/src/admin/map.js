"use strict";

var row = document.querySelectorAll(".grid .row");

var isMouseDown = false;
var isSelected;
var className = "selected";

for (var i = 0; i < row.length; i++) {
	row[i].addEventListener("mousedown", select);
	row[i].addEventListener("mouseover", selectToggle);
}

document.onmouseup = function() {
	isMouseDown = false;
};

function select () {
	isMouseDown = true;
	isSelected = this.classList.contains(className);
	this.classList.toggle(className);
	event.preventDefault();
};

function selectToggle () {
	if (isMouseDown && isSelected) {
		this.classList.remove(className);
	} else if(isMouseDown && !isSelected) {
		this.classList.add(className);
	}
};
