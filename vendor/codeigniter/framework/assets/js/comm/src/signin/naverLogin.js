var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "Qvf9vW3Eitx9lFNGWahz",
		callbackUrl: "https://rgbplace.com/oauth/naverLoginCallBack",
		isPopup: false, /* 팝업을 통한 연동처리 여부 */
		loginButton: {color: "green", type: 3, height: 0} /* 로그인 버튼의 타입을 지정 */
	}
);
naverLogin.init();

var naver = document.querySelector('#naver');
if(naver) naver.addEventListener("click", () => {
	document.getElementById('naverIdLogin_loginButton').click();
});

!(() => {

})();
