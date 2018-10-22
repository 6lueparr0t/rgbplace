let searchButtonPost    = document.querySelector("#search-button");
let searchInputPost  = document.querySelector("#search-input");

function postSearch (recv) {
	console.log(recv.value);
}

if (searchButtonPost)searchButtonPost.addEventListener("click", function() {
	postSearch(searchInputPost);
});

if (searchInputPost) searchInputPost.addEventListener("keydown", function(e) {
	if(e.keyCode == "13") {
		postSearch(this);
	}
});
