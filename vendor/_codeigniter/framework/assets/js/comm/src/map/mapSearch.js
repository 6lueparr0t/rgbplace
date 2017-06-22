function mapSearch (recv) {
	//console.log(recv.value);
	let request = new XMLHttpRequest();
	let lists = "";
	let data = "";
	let dataLength = 0;

	request.open('get', '/map/search?keyword='+recv.value, true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);
			if(data.code != undefined) dataLength = data.code.length;

			if(dataLength != 0) {
				lists += "<ul>";
				for (let i=0; i<dataLength; i++) {
					/*
					place[0] : locality:서울특별시|Seoul
					place[1] : political1:동작구|Dongjak-gu
					place[2] : political2:흑석동|Heukseok-dong
					place[3] : political3:흑석동|Heukseok-dong
					*/
					//let place = data.place[i].split('&');
					lists += "<a href='/"+data.code[i]+"'><li>"+data.country[i]+" > "+data.place[i]+"</li></a>"
				}
				lists += "</ul>";
			} else {
				lists = "No Results";
			}

			console.log(lists);

			document.querySelector("#map-search-result").innerHTML = lists;
		} else {
			// We reached our target server, but it returned an error
			document.querySelector("#map-search-result").innerHTML = "No Results";
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

	request.send();
}

let searchBtn = document.querySelector("#map-search-button");
let searchBox = document.querySelector("#map-search-box");

if (searchBtn) searchBtn.addEventListener("click", function() { mapSearch(searchBox); });
if (searchBox) searchBox.addEventListener("keypress", function(e) { if(e.keyCode == "13") mapSearch(this) });
