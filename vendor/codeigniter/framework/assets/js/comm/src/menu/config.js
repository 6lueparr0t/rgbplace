let darkMode = document.querySelector("#dark-mode");

function darkModeOnOff() {

	let data = [];

	if (document.querySelector("#dark-mode").checked == true) {
		document.querySelector('body').classList.add('dark');

		data.push({
			'mode':'on',
		});

		httpRequest('post', '/api/config/dark', JSON.stringify(data), data => {}, null);
	}

	if (document.querySelector("#dark-mode").checked == false) {
		document.querySelector('body').classList.remove('dark');

		data.push({
			'mode':'off',
		});

		httpRequest('post', '/api/config/dark', JSON.stringify(data), data => {}, null);
	}

}

if (darkMode) darkMode.addEventListener("click", darkModeOnOff);
