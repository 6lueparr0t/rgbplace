"use strict"

let onUnload = function () {
    event.returnValue = 1;
}

window.addEventListener("dragover",function(){ event.preventDefault(); });
window.addEventListener("drop",function(){ event.preventDefault(); });

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;
	if (t.className.search("menu") == -1 && t.className.search("status") == -1 && t.nodeName != 'I') {
		//console.log("close");
		document.querySelector(".menu").checked = false;
	}

	// reply button event
	if (t.parentElement.className.search("reply enable") == 0 || t.className.search("reply enable") == 0) {
		//console.log(t.className);

		let reply = t.parentElement.parentElement.parentElement.parentElement;
		t.classList.toggle('show');

		if(t.classList.contains('show') == 0) {
			reply.removeChild(reply.lastChild);
		} else {
			reply.innerHTML +=
				"<div class='reply block' id='reply-' name='reply-'>"
				+"<input type='hidden' class='reply-no' value=''>"
				+"<textarea class='reply-box' id='reply-box-{$id}' placeholder='Leave a Message .. &#xf040;'></textarea>"
				+"<div class='reply-button-group'>"

				+"<div class='reply-button send'>Send <i class='fa fa-keyboard-o' aria-hidden='true' style='position: absolute;margin: 0 .5rem;'></i> </div>"
				+"<div class='reply-button send yes'>yes</div>"
				+"<div class='reply-button send no'>no</div>"

				+"<div class='reply-button reset'>reset ?</div>"
				+"<div class='reply-button reset yes'>yes</div>"
				+"<div class='message-button reset no'>no</div>"
				+"</div>"
				+"</div>";
		}
	}
});
