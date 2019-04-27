var kakao = document.getElementById('kakao');

if(kakao) kakao.addEventListener("click", () => {
	Kakao.init('9135b26ea16bc5992bc76c59b9b32873');

	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success: function(authObj) {
			//let profile = JSON.parse('{"id":1072750866,"for_partner":{"uuid":"zv3K-8j5zvnO4tPr2u3Y4dDlyfqe"},"properties":{"nickname":"대현","profile_image":"http://k.kakaocdn.net/dn/d5jaKp/btquRblvWKC/qmEzJJmQNBbPV8M1QXKQZ0/profile_640x640s.jpg","thumbnail_image":"http://k.kakaocdn.net/dn/d5jaKp/btquRblvWKC/qmEzJJmQNBbPV8M1QXKQZ0/profile_110x110c.jpg"},"kakao_account":{"has_email":true,"email_needs_agreement":true}}');
			let profile = JSON.stringify(authObj);

			//console.log(profile);

			let data = [{
				uid : profile.id,
				name : profile.properties.nickname
			}];

			httpRequest('post', '/oauth/kakao', JSON.stringify(data), data => { location.replace(document.querySelector("input[name='http_referer']").value); }, data => { console.log(data); });
		},
		fail: function(err) {
			console.log(JSON.stringify(err));
		}
	});
});

!(() => {

})();
