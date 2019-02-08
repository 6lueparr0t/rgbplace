
var google = document.getElementById('google');
var googleUser = {};
var auth2;

const startApp = function() {
	gapi.load('auth2', function(){
		// Retrieve the singleton for the GoogleAuth library and set up the client.
		auth2 = gapi.auth2.init({
			client_id: '192892403850-r1esspcm1jq3piuds1u0hc0ulm63oei7.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
			// Request scopes in addition to 'profile' and 'email'
			//scope: 'additional_scope'
		});
		attachSignin(google);
	});
};

const attachSignin = element => {
	auth2.attachClickHandler(element, {},
		function(googleUser) {
			let profile = googleUser.getBasicProfile();
			let data = [{
				name : profile.getName(),
				mail : profile.getEmail()
			}];

			httpRequest('post', '/api/google', JSON.stringify(data), data => { location.reload(); }, data => { console.log(data); });

		}, function(error) {
			//console.log(JSON.stringify(error, undefined, 2));
		});
}

const signOut = () => {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function () {
		console.log('User signed out..');
	});  
}

//if(google) google.addEventListener("click", () => {

	//let data = [{
		//name : 'Blue Parrot (6lueparr0t)',
		//mail : '6lueparr0t@gmail.com'
	//}];

	//httpRequest('post', '/api/google', JSON.stringify(data), data => { location.reload(); }, data => { console.log(data); });

//});

!(() => {
	//startApp();
})();
