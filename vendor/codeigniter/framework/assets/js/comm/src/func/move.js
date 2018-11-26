function move (selector, position) {
	if(position === undefined) position = 0;

	let element = document.querySelector(selector); 

	let xPos = 0;
	let yPos = 0;

	xPos += (element.offsetLeft - element.scrollLeft + element.clientLeft);
	yPos += (element.offsetTop - element.scrollTop + element.clientTop) + position;

	element = element.offsetParent;

	let moveTo = {x: xPos, y: yPos};

	setTimeout(function() {
		window.scrollTo(this.x, this.y);
	}.bind(moveTo), 200);
}
