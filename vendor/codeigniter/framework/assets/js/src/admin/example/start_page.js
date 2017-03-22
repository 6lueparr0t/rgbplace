function tick() {
	const element = new Date().toLocaleTimeString();

	document.getElementById('example').innerHTML = "<div> <h1>Hello, world!</h1> <h2>"+element+"</h2> </div>";
}

setInterval(tick, 1000);
