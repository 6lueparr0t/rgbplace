"use strict"

let onUnload = function () {
    event.returnValue = 1;
}

window.addEventListener("dragover",function(){ event.preventDefault(); });
window.addEventListener("drop",function(){ event.preventDefault(); });
