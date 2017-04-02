function passwordCheck () {
    if (this.value != document.querySelector('#sign-up input[name=\'pswd\']').value) {
        this.setCustomValidity('패스워드를 확인해주세요.\nPlease Check your Password.');
    } else {
        this.setCustomValidity('');
    }
}

var signUpConf = document.querySelector("#sign-up input[name='conf']");
if (signUpConf) signUpConf.addEventListener("input", passwordCheck);