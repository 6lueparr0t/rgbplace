
document.querySelector("body").addEventListener("click", function(event) {

	let t = event.target;

	if(t.className == 'name disable') {
		event.preventDefault();
		let e = document.querySelector("#login");
		//console.log(data.responseText);
		e.setCustomValidity('로그인 해주세요. sign in please');
		e.reportValidity();
	}
});
