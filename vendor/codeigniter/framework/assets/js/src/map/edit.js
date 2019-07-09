"use strict"

window.addEventListener("beforeunload", onUnload);

var tab = 'code';
//var editor_position = document.querySelector('#edit-content');
//var editor_position = document.querySelector('.CodeMirror-line');

let title = document.querySelector('#edit-title');
let edit_width = document.querySelector('.tab');
let edit_content_code = document.querySelector('#edit-content-code');
let edit_content_view = document.querySelector('#edit-content-view');

const editor = CodeMirror.fromTextArea(document.querySelector('#edit-content-code'), {
	lineNumbers: true,
    styleActiveLine: true,
    matchBrackets: true,
	lineWrapping: true,
});

editor.on('cursorActivity', (e) => {
	sync();
	edit_content_view.scrollTo(0, editor.getCursor().line/editor.lineCount()*100);
	//document.querySelector('#edit-content-view div').children[editor.getCursor().line].scrollIntoView(false);
});

editor.on('scroll', (e) => {
	let h = editor.getScrollInfo();
	let per = (h.top / (h.height - h.clientHeight)) * 100;

	//console.log((per/100) * (h.height - h.clientHeight));
	//console.log((per/100)*(edit_content_view.scrollHeight));
	//edit_content_view.scrollTo(0, (per/100)*(edit_content_view.height - edit_content_view.clientHeight));
	edit_content_view.scrollTo(0, (per/100)*(edit_content_view.scrollHeight));
});

window.onresize = () => {
	if(edit_content_view.classList.contains('none') === false) {
		editor.setSize((edit_width.clientWidth/2)+"px", "42rem");
		edit_content_view.parentElement.style.width = (edit_width.clientWidth/2)+"px";
		//console.log((title.clientWidth/2)+"px");
	} else {
		editor.setSize(edit_width.clientWidth, "42rem");
		edit_content_view.parentElement.style.width = edit_width.clientWidth;
		//console.log((title.clientWidth)+"px");
	}
};

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
			addList(data);
			input_zone.value = '';
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

	data.forEach(function(value, key) {
		if( value['file_name'] != undefined ) {

			if(list.classList.contains('no-file')) {
				list.classList.remove('no-file');
				list.innerHTML = '';
				//document.querySelector("#upload-list-toggle").click();
			}

			tag = "<li class='file' ";
			tag += "data-default-path='"+value['default_path']+"' ";
			tag += "data-file-name='"+value['file_name']+"' ";
			tag += "data-client-name='"+value['client_name']+"' ";
			tag += "data-file-type='"+value['file_type']+"' ";
			tag += "data-size='"+value['file_size']+"' ";
			tag += "data-datetime='"+value['datetime']+"'>";
			tag += value['client_name'];
			tag += "<span class='del fas fa-trash-alt'></span>";
			tag += "<span class='add fas fa-check'></span>";
			tag += "</li>";

			list.innerHTML += tag;
		}
	});
}

function addFile(data) {

	let tag, str, doc, cursor;

	//let upload = JSON.parse(window.atob(document.querySelector('#edit-upload').value.substr(1)));
	//console.log(data);

	data.forEach(function(value, key) {
		if(value['file_name']) {
			console.log(value['file_name']);

			switch (value['file_type'].split('/')[0]) {
				case 'image' :
					tag = document.createElement('IMG');
					tag.style.maxWidth = "100%";

					tag.setAttribute('src', value['default_path']+value['file_name']);
					tag.setAttribute('alt', value['client_name']);

					//str = "<img style='max-width:100%;' src='"+value['default_path']+value['file_name']+"' alt='"+value['client_name']+"'/>";
					//str = "!["+value['client_name']+"]("+value['default_path']+value['file_name']+")";
					str = "<img src='"+value['default_path']+value['file_name']+"' alt='"+value['client_name']+"' width='100%' height='100%' />";
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

			doc = editor.getDoc();
			cursor = doc.getCursor();

			doc.replaceRange(str, cursor);
			sync();
		}

	});
}

function delFile(data) {

	let target = {
		'info': __URL__,
		'file_name' : data.getAttribute('data-file-name'),
		'client_name' :data.getAttribute('data-client-name')
	};

	httpRequest('post', '/api/remove', JSON.stringify(target), () => {}, fail);

	return true;
}

/* ******************** Upload Event END ******************** */

function done (data) {
	window.removeEventListener("beforeunload", onUnload);
	let num = data;
	Swal.fire({
		type: 'success',
		title: 'Done',
		html: '등록 완료<br/>Save and Post Done!',
	}).then(function (result) {
		redirect(num);
	});
}

function fail (data) {
	console.log(data);
	Swal.fire({
		type: 'error',
		title: 'Fail',
		html: 'session lost. sign in please.',
	})
}

function sync(e) {
	if(!edit_content_view.classList.contains('none')) {
		//edit_content_view.innerHTML = editor.getValue().replace(/\n/g, '<br/>').replace(/!\[(.*)\]\((.*)\)/g, '<img src="$2" alt="$1" />');
		edit_content_view.innerHTML = marked(editor.getValue().replace(/!\[(.*)\]\((.*)\)/g, '<img src="$2" alt="$1" />'));
	}
}

document.querySelector("#edit").addEventListener("click", function(event) {
	let t = event.target;
	let content;

	let data = [];

	switch(t.classList.item(0)) {
		case 'code' :
			if(!edit_content_view.classList.contains('none')) {
				tab = t.classList.item(0);
				t.classList.toggle('active');

				//edit_content.innerHTML = edit_content_code.value.replace(/\n/g, '<br/>');
				edit_content_code.classList.toggle('none');
				edit_content_code.parentElement.classList.toggle('none');

				window.onresize();
				editor.refresh();
				sync();
			}
			return;
		case 'view' :
			if(!edit_content_code.classList.contains('none')) {
				tab = t.classList.item(0);
				t.classList.toggle('active');

				//edit_content_code.value = edit_content.innerHTML.replace(/(<br[\s]*\/?>)/g, '\n');
				edit_content_view.classList.toggle('none');
				edit_content_view.parentElement.classList.toggle('none');

				window.onresize();
				editor.refresh();
				sync();
			}
			return;
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
		case 'del' :
			delFile(t.parentElement);
			t.parentElement.remove();
			break;
		case 'file' :
			if(t.getAttribute('data-default-path') && t.getAttribute('data-file-name')) {
				document.querySelector("#upload-preview-img").src = t.getAttribute('data-default-path') + t.getAttribute('data-file-name');
			}
			return;
			break;
	}

	switch(t.id) {
		case 'save' :
			if(!title.value) {
				title.setCustomValidity('제목을 입력해주세요.\nPlease Input Title');
				title.reportValidity();
				return false;
			}

			//editor = document.querySelector('.editor.active');
			//console.log(editor);
			//if(editor.id == 'edit-content') {
				//// remove div tag
				////.replace(/\<[\/\s]*?div[\/\s]*?\>/g, '')
				////content = editor.innerHTML.replace(/(<br[\s]*\/?>)/g, '\n');
				//content = editor.innerHTML;
			//} else {
				////content = editor.value;
				//content = editor.value.replace(/\n/g, '<br/>');
			//}
			content = editor.getValue();

			if(!content) {
				Swal.fire({
					type: 'error',
					title: 'Oops...',
					html: '내용을 입력해주세요.<br/>Please Input Content.'
				})
				return false;
			}

			Swal.fire({
				title: 'Are you sure?',
				html: "등록 하시겠습니까?<br/>Are you sure you want to post it?",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes!'
			}).then((result) => {
				if(result.value && title && content) {
					data.push({
						'info': __URL__,
						'title': title.value,
						'content': content
					});

					let mode = ({value:'post'}).value;

					httpRequest(mode, '/api/request/edit/save', JSON.stringify(data), done, fail);
				}
			});
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
	//document.querySelector(".code").click();
	window.onresize();
	sync();
}();
