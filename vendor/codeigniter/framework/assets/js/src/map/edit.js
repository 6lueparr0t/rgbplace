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
	//console.log("dragEnd");
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

//Drag N Drop
function drop_upload() {
	//console.log("Drop");

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
			let data = JSON.parse(this.response);
			//console.log(data);
			//console.log(request.getAllResponseHeaders());

			state.className = "";
			state.classList.add("drop_it");

			addFile(data);
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

//Click Upload Button
function input_upload() {
	//console.log("change");

	let request = new XMLHttpRequest();

	let formData = new FormData(document.querySelector("#upload"));
	if(formData.getAll('userfile[]').length < 0) {
		return false;
	}

	request.open('post', '/api/upload', true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			//Success!
			let data = JSON.parse(this.response);
			//console.log(data);
			//console.log(request.getAllResponseHeaders());

			state.className = "";
			state.classList.add("drop_it");

			addFile(data);
			input_zone.value = '';
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

function addFile(data) {

	let tag = '';
	//let upload = JSON.parse(window.atob(document.querySelector('#edit-upload').value.substr(1)));

	data.forEach(function(value, key) {
		if(value['file_name']) {
			console.log(value['file_name']);
			tag='';

			switch (value['file_type'].split('/')[0]) {
				case 'image' :
					tag = document.createElement('IMG');
					tag.style.maxWidth = "100%";
					break;
				case 'audio' :
					tag = document.createElement('AUDIO');
					tag.setAttribute('controls', 'controls');
					break;
				case 'video' :
					tag = document.createElement('VIDEO');
					tag.setAttribute('controls', 'controls');
					break;
				default :
					tag = document.createElement('A');
					tag.setAttribute('download', '');

					break;
			}

			tag.setAttribute('src', value['default_path']+value['file_name']);
			tag.setAttribute('alt', value['client_name']);

			document.querySelector('#edit-content').appendChild(tag);
			document.querySelector('#edit-content').innerHTML += '<br/><br/>';

			//upload.push({'file_name':value['file_name'], 'file_type':value['file_type'], 'client_name':value['client_name'], 'file_size':value['file_size']});

		} else {
			document.querySelector('#edit-content').innerHTML += value;
		}
		
	});

	//document.querySelector('#edit-upload').value = 'Z'+window.btoa(JSON.stringify(upload));
}

/* ******************** Upload Event END ******************** */

function done (data) {
	let num = data;
	alert('save done');
	redirect(num);
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
				'info': __URL__,
				'title': document.querySelector('#edit-title').value,
				'content': document.querySelector('#edit-content').innerHTML,
			});

			let mode = (document.querySelector('#edit-mode') || {value:'post'}).value;

			httpRequest(mode, '/api/request/edit/save', JSON.stringify(data), done, fail);
			break;
		case 'cancel' :
			back();
			break;
	}
});

