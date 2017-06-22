function mapSearch (recv) {
	//console.log(recv.value);

	let request = new XMLHttpRequest();
	let data = "";

	request.open('post', '/map/search, true);
	request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			if(data.valid) {
				console.log(data.search);
			} else {
				//console.log(data);
			}
			// console.log(data);
		} else {
			// We reached our target server, but it returned an error
			// console.log(this.status);
		}
	};

	request.onprogress = function() {
		//console.log("event.lengthComputable:"+event.lengthComputable);
		//console.log("event.loaded:"+event.loaded);
		//console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		// There was a connection error of some sort
	};

	request.send(JSON.stringify({keyword: recv.value}));

/*
	===========================
		when receive on php,
	===========================

	$data = json_decode($this->input->raw_input_stream, true);
	$output = ['valid' => true, 'search' => $data['search'], 'results' => []];
*/

}

let searchBtn = document.querySelector("#map-search-button");
let searchBox = document.querySelector("#map-search-box");

if (searchBtn) searchBtn.addEventListener("click", function() { mapSearch(searchBox); });
if (searchBox) searchBox.addEventListener("keypress", function(e) { if(e.keyCode == "13") mapSearch(this) });
