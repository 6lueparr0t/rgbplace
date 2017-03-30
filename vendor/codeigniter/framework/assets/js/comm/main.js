"use strict"

var signin= document.querySelector("#sign-in");
var signup= document.querySelector("#sign-up");
var signup_conf= document.querySelector("#sign-up input[name='conf']");

if (signin || signup || signup_conf) {
	signin.addEventListener("submit", function () { event.preventDefault(); signInCheck(signin); });
	signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
	signup_conf.addEventListener("input", this.check);
}
