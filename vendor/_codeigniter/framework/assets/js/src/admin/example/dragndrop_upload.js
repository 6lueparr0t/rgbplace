"use strict";

//function requestGet() {
//	let request = new XMLHttpRequest();
//	let data = "";
//
//	request.open('get', '/api/check', true);
//
//	request.onload = function() {
//		if (this.status >= 200 && this.status < 400) {
//			// Success!
//			data = JSON.parse(this.response);
//			result.innerHTML = data.request+"/"+data.author;
//			console.log(data);
//			//console.log(request.getAllResponseHeaders());
//		} else {
//			// We reached our target server, but it returned an error
//			// console.log(this.status);
//		}
//	};
//
//	request.onprogress = function() {
//		console.log("event.lengthComputable:"+event.lengthComputable);
//		console.log("event.loaded:"+event.loaded);
//		console.log("event.total:"+event.total);
//	};
//
//
//	request.onerror = function() {
//		// There was a connection error of some sort
//	};
//
//	request.send();
//}
//
//const result = document.querySelector("#result");
//
//document.querySelector("#requestDelete").addEventListener("click",	function () { requestDelete()	});
