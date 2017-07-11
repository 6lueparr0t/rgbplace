"use strict";

const state = document.querySelector("#drop_zone");

function drop_handler() {
	console.log("Drop");
	event.preventDefault();
	// If dropped items aren't files, reject them
	var dt = event.dataTransfer;
	console.log(dt);
	console.log(dt.files);

	if (dt.items) {
		// Use DataTransferItemList interface to access the file(s)
		for (var i=0; i < dt.items.length; i++) {
			if (dt.items[i].kind == "file") {
				var f = dt.items[i].getAsFile();
				console.log(f);
				console.log("... items[" + i + "].name = " + f.name);
			}
		}
	} else {
		// Use DataTransfer interface to access the file(s)
		for (var i=0; i < dt.files.length; i++) {
			console.log("... file[" + i + "].name = " + dt.files[i].name);
		}  
	}
}

function dragstart_change() {
	//console.log("dragOver");
	// Preventent default select and drag behavior
	state.className = "";
	state.classList.add("drop_wait");

	event.preventDefault();
}

function dragover_change() {
	//console.log("dragOver");
	// Preventent default select and drag behavior
	state.className = "";
	state.classList.add("drop_hover");

	event.preventDefault();
}

function dragleave_change() {
	//console.log("dragOver");
	// Preventent default select and drag behavior
	state.className = "";
	state.classList.add("drop_wait");

	event.preventDefault();
}

function dragend_clear() {
	console.log("dragEnd");
	// Remove all of the drag data
	var dt = event.dataTransfer;
	if (dt.items) {
		// Use DataTransferItemList interface to remove the drag data
		for (var i = 0; i < dt.items.length; i++) {
			dt.items.remove(i);
		}
	} else {
		// Use DataTransfer interface to remove the drag data
		event.dataTransfer.clearData();
	}
}

function drop_upload() {
	console.log("Drop");

	state.className = "";
	state.classList.add("drop_it");

	event.preventDefault();
	// If dropped items aren't files, reject them
	var dt = event.dataTransfer;
	console.log(dt);
	console.log(dt.files);

	if (dt.items) {
		// Use DataTransferItemList interface to access the file(s)
		for (var i=0; i < dt.items.length; i++) {
			if (dt.items[i].kind == "file") {
				var f = dt.items[i].getAsFile();
				console.log(f);
				console.log("... items[" + i + "].name = " + f.name);
			}
		}
	} else {
		// Use DataTransfer interface to access the file(s)
		for (var i=0; i < dt.files.length; i++) {
			console.log("... file[" + i + "].name = " + dt.files[i].name);
		}  
	}


/*
 *    let request = new XMLHttpRequest();
 *    let data = "";
 *
 *    request.open('get', '/api/check', true);
 *
 *    request.onload = function() {
 *        if (this.status >= 200 && this.status < 400) {
 *            Success!
 *            data = JSON.parse(this.response);
 *            console.log(data);
 *            console.log(request.getAllResponseHeaders());
 *
 *            state.className = "";
 *            state.classList.add("drop_it");
 *        } else {
 *            We reached our target server, but it returned an error
 *            console.log(this.status);
 *        }
 *    };
 *
 *    request.onprogress = function() {
 *        console.log("event.lengthComputable:"+event.lengthComputable);
 *        console.log("event.loaded:"+event.loaded);
 *        console.log("event.total:"+event.total);
 *
 *        var max = e.total;
 *        var current = e.loaded;
 *        var Percentage = (current * 100)/max;
 *        console.log(Percentage);
 *    };
 *
 *
 *    request.onerror = function() {
 *        There was a connection error of some sort
 *    };
 *
 *    request.send();
 *
 */
}

let drop_zone = document.querySelector("#drop_zone");

drop_zone.addEventListener("dragstart",	function () { dragstart_change() });
drop_zone.addEventListener("dragover",	function () { dragover_change() });
drop_zone.addEventListener("dragleave",	function () { dragleave_change() });
drop_zone.addEventListener("dragend",	function () { dragend_clear() });
drop_zone.addEventListener("drop",	function () { drop_upload() });
