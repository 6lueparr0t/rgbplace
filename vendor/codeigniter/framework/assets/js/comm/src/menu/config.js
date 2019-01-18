let favorite = document.querySelector("#menu-favorite");
let darkMode = document.querySelector("#dark-mode");

function stageSave() {
	
	let data = [];

	data.push({
		'map':__URL_ARRAY__[1]
	});

	let background = (document.querySelector('body').classList.contains('dark'))?'#495057':'#fff';

	const toast = Swal.mixin({
		toast: true,
		position: 'bottom-end',
		background: background,
		showConfirmButton: false,
		timer: 5000
	});

	httpRequest('post', '/api/config/map/save', JSON.stringify(data), data => {
		toast({
			type: 'success',
			title: "stage changed '"+__URL_ARRAY__[1]+"'"
		});
	}, data => {
		toast({
			type: 'error',
			title: JSON.parse(data.responseText)
		});
	});
}

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

if (favorite) favorite.addEventListener("click", stageSave);
if (darkMode) darkMode.addEventListener("click", darkModeOnOff);
