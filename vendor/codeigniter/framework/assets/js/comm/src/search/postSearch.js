let postSearchBtn    = document.querySelector("#search-button");
let postSearchInput  = document.querySelector("#search-input");

function postSearch (recv) {
	let mode = [];

	mode['title']   = document.querySelector("#search-mode-title").checked;
	mode['content'] = document.querySelector("#search-mode-content").checked;
	mode['reply']   = document.querySelector("#search-mode-reply").checked;
	mode['name']    = document.querySelector("#search-mode-name").checked;
	mode['keyword'] = document.querySelector("#search-mode-keyword").checked;
	mode['date']    = document.querySelector("#search-mode-date").checked;

	//console.log(mode);
	//console.log(recv);

	let where = '';
	for(let i in mode) {
		if(mode[i]) {
			where += i+'='+recv+'&';
		}
	}

	console.log(where);
	redirect ('list?'+where);
}

if (postSearchBtn)postSearchBtn.addEventListener("click", function() {
	postSearch(postSearchInput.value);
});

if (postSearchInput) postSearchInput.addEventListener("keydown", function(e) {
	if(e.keyCode == "13") {
		postSearch(this.value);
	}
});
