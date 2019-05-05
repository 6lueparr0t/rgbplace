
document.querySelector("body").addEventListener("click", function(event) {

	let t = event.target;

	if(t.className == 'name disable') {
		event.preventDefault();

		let signInToolTip = document.querySelector('#sign-in-tooltip');
		move('#sign-in-tooltip', 0, 0);
		showTooltip(signInToolTip, 'fadeInOutDownForSignIn');

		//let e = document.querySelector("#login");
		////console.log(data.responseText);
		//e.setCustomValidity('로그인 해주세요. sign in please');
		//e.reportValidity();
	}
});
