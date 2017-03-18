function onUnload(event) { // the method that will be used for both add and remove event
	//console.log("Test")
	event.returnValue = 1;
}

window.addEventListener("beforeunload", this.onUnload)

//window.removeEventListener("beforeunload", this.onUnload)
