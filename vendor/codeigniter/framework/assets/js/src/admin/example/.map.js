"use strict";

let row = document.querySelectorAll(".grid .row");
let col = document.querySelectorAll(".grid .row span");

let isMouseDown = false;
let isShiftDown = false;
let isSelected;
let className = "selected";

for (let i = 0; i < col.length; i++) {
	col[i].addEventListener("mousedown", select)
	col[i].addEventListener("mouseover", selectToggle);
	col[i].addEventListener("mouseup", () => { isMouseDown = false; });
}

window.addEventListener("keydown", selectMove.bind(col), true);


function selectMove () {
	console.log(event.which);
	console.log(this);
}

function select () {
	event.preventDefault();
	
	for (let i = 0; i < col.length; i++) {
		if(this!==col[i]) col[i].classList.remove(className);
	}

	isMouseDown = true;
	isSelected = this.classList.contains(className);
	this.classList.toggle(className);
};

function selectToggle () {
	if (isMouseDown && isSelected) {
		this.classList.remove(className);
	} else if(isMouseDown && !isSelected) {
		this.classList.add(className);
	}
};
