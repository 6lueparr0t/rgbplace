"use strict"

let onUnload = function () {
    event.returnValue = ' ';
}

// ["127.0.0.1", "space", "best", "1"]
var __URL__ = (window.location.hostname + window.location.pathname);
var __URL_ARRAY__ = __URL__.split("/");
var __REPLY_LIST_ROWS_LIMIT__ = 20;
var __k__ = (() => {
	//<![CDATA[
	let k = '';
	let l = new Array();
	l[0] = '|72';
	l[1] = '|97';
	l[2] = '|118';
	l[3] = '|101';
	l[4] = '|32';
	l[5] = '|97';
	l[6] = '|32';
	l[7] = '|110';
	l[8] = '|105';
	l[9] = '|99';
	l[10]= '|101';
	l[11]= '|32';
	l[12]= '|68';
	l[13]= '|97';
	l[14]= '|121';
	l[15]= '|33';
	l.reverse();
	for (let i = l.length-1; i >= 0; i=i-1) {
		if (l[i].substring(0, 1) === '|') k += "&#"+unescape(l[i].substring(1))+";";
		else k += unescape(ll[i]);
	}

	return k;
}
)();

window.addEventListener("dragover",function(){ event.preventDefault(); });
window.addEventListener("drop",function(){ event.preventDefault(); });

document.querySelector("body").addEventListener("click", function(event) {
	let t = event.target;
	//console.log(t);
	if(typeof t.className.search === 'function') {
		if (t.className.search("menu") == -1 && t.className.search("switch") == -1 && t.className.search("status") == -1 && t.nodeName != 'I') {
			let menu = document.querySelectorAll("input[class='menu']");
			[].filter.call( menu, function( el ) {
				el.checked = false;
			});
		}
	}
});

console.log(
	'%cR%cG%cB %cPLACE',
	'color: #ff6b6b;font-size:2rem;font-weight:bold',
	'color: #51cf66;font-size:2rem;font-weight:bold',
	'color: #339af0;font-size:2rem;font-weight:bold',
	'color: #000000;font-size:2rem;font-weight:bold'
);

var toast = Swal.mixin({
    toast: true,
    position: 'bottom-end',
    background: (document.querySelector('body').classList.contains('dark'))?'#495057':'#fff',
    showConfirmButton: false,
    timer: 2000
});
