let mapSearchResult = document.querySelector("#map-result");
let mapSearchBtn    = document.querySelector("#map-search-button");
let mapSearchBox    = document.querySelector("#map-search-box");
let mapSearchToggle = document.querySelector("#map-search");


function mapSearch (recv) {
	//console.log(recv.value);
	let request    = new XMLHttpRequest();
	let lists      = "";
	let data       = "";
	let dataLength = 0;

	request.open('get', '/api/search?keyword='+recv.value, true);

	request.onload = function() {
		if (this.status >= 200 && this.status < 400) {
			// Success!
			data = JSON.parse(this.response);

			if(data) {
				dataLength = data.map.length;
			} else {
				dataLength = null;
			}

			if(dataLength != null) {
				let place = [];

				for (let i=0; i < dataLength; i++) {

					/*
					 * Example )
					 * global = {"address": ["Goean-dong", "Sosa-gu", "Bucheon-si", "Gyeonggi-do", "South Korea"]}
					 * native = {"address": ["괴안동", "소사구", "부천시", "경기도", "대한민국"]}
					*/

					let native = JSON.parse(data.native)['address'];
					let global = JSON.parse(data.global)['address'];

					//console.log(global);

					let place_org = '';
					for (let j=native.length-1; j>=0; j--) {
						place_org += native[j] + ((j==0)?"":" ");
					}

					let place_eng = '';
					for (let j=0; j<global.length; j++) {
						place_eng += global[j] + ((j==global.length-1)?"":", ");
					}

					lists += "<a href='/"+data.map[i]+"'><li>"+place_org+"<br/>"+place_eng+"</li></a>";
				}
			} else {
				lists  = "<a href='#'><li>No Results</li></a>";
			}

			//console.log(lists);
			mapSearchResult.innerHTML = lists;
		} else {
			// We reached our target server, but it returned an error
			mapSearchResult.innerHTML = "No Results";
		}
	};

	request.onprogress = function() {
		//console.log("event.lengthComputable:"+event.lengthComputable);
		//console.log("event.loaded:"+event.loaded);
		//console.log("event.total:"+event.total);
	};


	request.onerror = function() {
		//There was a connection error of some sort
	};

	request.send();
}

if (mapSearchBtn) mapSearchBtn.addEventListener("click", function() { mapSearchToggle.checked = false; mapSearch(mapSearchBox); });
if (mapSearchBox) mapSearchBox.addEventListener("keydown", function(e) {
	if(mapSearchBox.value == "") {
		mapSearchToggle.checked = false;
		mapSearchResult.innerHTML = "<a href='#'><li>No Results</li></a>";
	}
	if(e.keyCode == "13") {
		mapSearchToggle.checked = true;
		mapSearch(this)
	}
});
