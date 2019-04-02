function move (selector, position, time) {
	if(position === undefined) position = 0;
	if(time === undefined) time = 200;

	let element = document.querySelector(selector); 

	if(element) {
		let xPos = 0;
		let yPos = 0;

		xPos += (element.offsetLeft - element.scrollLeft + element.clientLeft);
		yPos += (element.offsetTop - element.scrollTop + element.clientTop) + position;

		element = element.offsetParent;

		let moveTo = {x: xPos, y: yPos};

		setTimeout(function() {
			window.scrollTo(this.x, this.y);
		}.bind(moveTo), time);
	} else {
		console.log(selector + ' not found');
	}
}
