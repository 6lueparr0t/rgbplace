var kakao = document.getElementById('kakao');

if(kakao) {
	Kakao.init('9135b26ea16bc5992bc76c59b9b32873');
	kakao.addEventListener("click", () => {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success: function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res) {
						let profile = res;

						let data = [{
							uid : profile.id,
							name : profile.properties.nickname
						}];

						httpRequest('post', '/oauth/kakao', JSON.stringify(data), data => { location.replace(document.querySelector("input[name='http_referer']").value); }, data => { console.log(data); });
					},
					fail: function(error) {
						console.log(JSON.stringify(error));
					}
				});
			},
			fail: function(err) {
				console.log(JSON.stringify(err));
			}
		});
	});
}

!(() => {

})();
