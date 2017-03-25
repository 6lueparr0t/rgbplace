var signin= document.querySelector("#sign-in");
var signup= document.querySelector("#sign-up");
var signup_conf= document.querySelector("#sign-up input[name='conf']");

if (signin) signin.addEventListener("submit", function () { event.preventDefault(); signInCheck(signin); });
if (signup) signup.addEventListener("submit", function () { event.preventDefault(); signUpCheck(signup); });
if (signup_conf) signup_conf.addEventListener("input", this.check);
