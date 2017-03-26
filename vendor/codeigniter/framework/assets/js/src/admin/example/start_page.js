setInterval(tick, 1000);

function tick() {
	const element = new Date().toLocaleTimeString();

	document.getElementById('example').innerHTML = "<div> <h1>Hello, world!</h1> <h2>"+element+"</h2> </div>";
}
