"use strict"

var tab = 'view';
var editor_position = document.querySelector('#edit-content');

/* ******************** Upload Event TOP ******************** */
const state = document.querySelector("label[for='input_zone']");

let drop_zone = document.querySelector("#upload");
let input_zone = document.querySelector("#input_zone");

drop_zone.addEventListener("dragstart" , () => { dragstart_change() });
drop_zone.addEventListener("dragover"  , () => { dragover_change()  });
drop_zone.addEventListener("dragleave" , () => { dragleave_change() });
drop_zone.addEventListener("dragend"   , () => { dragend_clear()    });
drop_zone.addEventListener("drop"      , () => { drop_upload()      });

input_zone.addEventListener("change"   , () => { input_upload()     });

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
			addList(data);
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

function addList(data) {

	let tag = '';
	//let upload = JSON.parse(window.atob(document.querySelector('#edit-upload').value.substr(1)));
	//console.log(data);
	let list = document.querySelector('.file-list');

	if(list.classList.contains('no-file')) {
		list.classList.remove('no-file');
		list.innerHTML = '';
		document.querySelector("#upload-list-toggle").click();
	}

	data.forEach(function(value, key) {
		tag = "<li class='file' ";
		tag += "data-default-path='"+value['default_path']+"' ";
		tag += "data-file-name='"+value['file_name']+"' ";
		tag += "data-client-name='"+value['client_name']+"' ";
		tag += "data-file-type='"+value['file_type']+"' ";
		tag += "data-size='"+value['file_size']+"' ";
		tag += "data-datetime='"+value['datetime']+"'>";
		tag += value['client_name'];
		tag += "<span class='add fas fa-check'></span>";
		tag += "</li>";

		list.innerHTML += tag;
	});
}

function addFile(data) {

	let tag = '';
	let str = '';
	//let upload = JSON.parse(window.atob(document.querySelector('#edit-upload').value.substr(1)));
	//console.log(data);

	data.forEach(function(value, key) {
		if(value['file_name']) {
			console.log(value['file_name']);
			tag='';
			str='';

			switch (value['file_type'].split('/')[0]) {
				case 'image' :
					tag = document.createElement('IMG');
					tag.style.maxWidth = "100%";

					tag.setAttribute('src', value['default_path']+value['file_name']);
					tag.setAttribute('alt', value['client_name']);

					str = "<img style='max-width:100%;' src='"+value['default_path']+value['file_name']+"' alt='"+value['client_name']+"'/>";
					break;
				case 'audio' :
					tag = document.createElement('AUDIO');
					tag.setAttribute('controls', 'controls');

					tag.setAttribute('src', value['default_path']+value['file_name']);
					tag.setAttribute('alt', value['client_name']);

					str = "<audio controls src='"+value['default_path']+value['file_name']+"' alt='"+value['client_name']+"'/>";
					break;
				case 'video' :
					tag = document.createElement('VIDEO');
					tag.setAttribute('controls', 'controls');

					tag.setAttribute('src', value['default_path']+value['file_name']);
					tag.setAttribute('alt', value['client_name']);

					str = "<video controls src='"+value['default_path']+value['file_name']+"' alt='"+value['client_name']+"'/>";
					break;
				default :
					tag = document.createElement('A');
					tag.setAttribute('download', '');

					tag.setAttribute('href', value['default_path']+value['file_name']);
					tag.setAttribute('alt', value['client_name']);

					str = "<a href='"+value['default_path']+value['file_name']+"' alt='"+value['client_name']+"' download />";
					break;
			}

			//console.log(document.querySelector('#edit-content').innerText.match(/[^\n]*\n[^\n]*/gi).length);
			//document.querySelector('#edit-content').appendChild(tag);
			if(tab == 'view') {
				editor_position.appendChild(tag);
				document.querySelector('#edit-content').innerHTML += '<br/><br/>';
			} else {
				document.querySelector('#edit-content-code').value += str + '<br/><br/>';
			}
			//upload.push({'file_name':value['file_name'], 'file_type':value['file_type'], 'client_name':value['client_name'], 'file_size':value['file_size']});

		} else {
			//document.querySelector('#edit-content').innerHTML += value;
			if(tab == 'view') {
				editor_position.innerHTML += value;
			} else {
				document.querySelector('#edit-content-code').value += value;
			}
		}
		
	});

	//document.querySelector('#edit-upload').value = 'Z'+window.btoa(JSON.stringify(upload));
}

/* ******************** Upload Event END ******************** */

function done (data) {
	let num = data;
	alert('등록 완료\nSave and Post Done!');
	redirect(num);
}

function fail (data) {
	console.log(data);
	alert('session lost. sign in please.');
}

function tabChange (element) {
    document.querySelectorAll('.tab div').forEach(function (element) {
        element.classList.remove('active');
    });

    element.classList.add('active');
}

document.querySelector("#edit-content").addEventListener("keydown", function(event) {
	editor_position = window.getSelection().anchorNode;
});

document.querySelector("#edit-content").addEventListener("click", function(event) {
	editor_position = window.getSelection().anchorNode;
});

document.querySelector("#edit").addEventListener("click", function(event) {
	let t = event.target;
	let editor, content;

	let edit_content = document.querySelector('#edit-content');
	let edit_content_code = document.querySelector('#edit-content-code');

	let data = [];

	switch(t.classList.item(0)) {
		case 'view' :
			if(t.classList[1] === undefined) {
				tab = 'view';

				tabChange(t);
				edit_content.innerHTML = edit_content_code.value;

				edit_content.classList.remove('none');
				edit_content.classList.add('active');

				edit_content_code.classList.add('none');
				edit_content_code.classList.remove('active');
			}
			return;
			break;
		case 'code' :
			if(t.classList[1] === undefined) {
				tab = 'code';

				tabChange(t);
				edit_content_code.value = edit_content.innerHTML.replace(/\n*(<div>|<img)/gi, "\n$1");

				edit_content_code.classList.remove('none');
				edit_content_code.classList.add('active');

				edit_content.classList.add('none');
				edit_content.classList.remove('active');
			}
			return;
			break;
		case 'add' :
			data.push({
				'default_path' : t.parentElement.getAttribute('data-default-path'),
				'file_name' : t.parentElement.getAttribute('data-file-name'),
				'client_name' : t.parentElement.getAttribute('data-client-name'),
				'file_type' : t.parentElement.getAttribute('data-file-type')
			});

			//console.log(data);
			addFile(data);
			return;
			break
		case 'file' :
			if(t.getAttribute('data-default-path') && t.getAttribute('data-file-name')) {
				document.querySelector("#upload-preview-img").src = t.getAttribute('data-default-path') + t.getAttribute('data-file-name');
			}
			return;
			break;
	}

	switch(t.id) {
		case 'save' :
			if(confirm('등록 하시겠습니까?\nAre you sure you want to post it?')) {
				editor = document.querySelector('.editor.active');
				if(editor.id == 'edit-content') {
					content = editor.innerHTML;
				} else {
					content = editor.value;
				}

				data.push({
					'info': __URL__,
					'title': document.querySelector('#edit-title').value,
					'content': content.replace(/\n/gi, '')
				});

				let mode = ({value:'post'}).value;

				httpRequest(mode, '/api/request/edit/save', JSON.stringify(data), done, fail);
			}
			break;
		case 'cancel' :
			back();
			break;
		case 'upload-list-toggle' :
			let sw = t.querySelector('#upload-list-switch');

			t.classList.toggle('show');
			t.nextSibling.nextSibling.classList.toggle('close');

			if (t.classList.contains('show')) {
				sw.className = 'fa fa-caret-up';
			} else {
				sw.className = 'fas fa-caret-down';
			}
			break;
	}
});

!function() {
    document.querySelector(".view").click();
}();
