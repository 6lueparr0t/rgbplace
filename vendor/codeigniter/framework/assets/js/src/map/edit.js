"use strict"

/* ******************** Upload Event TOP ******************** */
const state = document.querySelector("label[for='input_zone']");

let drop_zone = document.querySelector("#upload");
let input_zone = document.querySelector("#input_zone");

drop_zone.addEventListener("dragstart",	function () { dragstart_change() });
drop_zone.addEventListener("dragover",	function () { dragover_change() });
drop_zone.addEventListener("dragleave",	function () { dragleave_change() });
drop_zone.addEventListener("dragend",	function () { dragend_clear() });
drop_zone.addEventListener("drop",	function () { drop_upload() });
drop_zone.addEventListener("click",	function () { input_zone.click(); });
input_zone.addEventListener("change",	function () { input_upload() });

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

	let request = new XMLHttpRequest();

	let formData = new FormData();
	let dt = event.dataTransfer;

	// Use DataTransfer interface to access the file(s)
	for (let i=0; i < dt.files.length; i++) {
		formData.append('userfile[]', dt.files[i]);
	}

	//console.log(formData);

	request.open('post', '/api/upload', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			//Success!
			console.log(this.response);
			let data = JSON.parse(this.response);
			console.log(data);
			console.log(request.getAllResponseHeaders());

			state.className = "";
			state.classList.add("drop_it");
		} else {
			//We reached our target server, but it returned an error
			console.log(this.status);
		}
	};

	request.upload.onprogress = function() {
		console.log("event.lengthComputable:"+event.lengthComputable);
		console.log("event.loaded:"+event.loaded);
		console.log("event.total:"+event.total);

		var max = event.total;
		var current = event.loaded;
		var Percentage = (current * 100)/max;
		console.log(Percentage);
	};


	request.onerror = function() {
		//There was a connection error of some sort
	};

	request.send(formData);

}

function input_upload() {
	console.log("change");

	let request = new XMLHttpRequest();

	let formData = new FormData(document.querySelector("#upload"));
	if(formData.getAll('userfile[]').length < 0) {
		return false;
	}
	console.log(formData);

	request.open('post', '/api/upload', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			//Success!
			let data = JSON.parse(this.response);
			//console.log(data);
			//console.log(request.getAllResponseHeaders());

			state.className = "";
			state.classList.add("drop_it");
		} else {
			//We reached our target server, but it returned an error
			//console.log(this.status);
		}
	};

	request.upload.onprogress = function() {
		console.log("event.lengthComputable:"+event.lengthComputable);
		console.log("event.loaded:"+event.loaded);
		console.log("event.total:"+event.total);

		var max = event.total;
		var current = event.loaded;
		var Percentage = (current * 100)/max;
		console.log(Percentage);
	};


	request.onerror = function() {
		//There was a connection error of some sort
	};

	request.send(formData);
}

/* ******************** Upload Event END ******************** */

function done (data) {
	console.log(data);
	alert('save done');
}

function fail (data) {
	console.log(data);
	alert('try again');
}

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;

	switch(t.id) {
		case 'save' :
			let data = [];
			
			data.push({
				'info': URL,
				'title': document.querySelector('#edit-title').value,
				'content': document.querySelector('#edit-content').innerHTML,
			});

			let mode = (document.querySelector('#edit-mode') || {value:'post'}).value;
			console.log(mode);

			httpRequest(mode, '/api/request/edit/save', JSON.stringify(data), done, fail);
			break;
		case 'cancel' :
			break;
	}
});

