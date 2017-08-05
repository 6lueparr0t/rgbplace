var searchResult = document.querySelector("#map-result");

function mapSearch (recv) {
	//console.log(recv.value);
	let request    = new XMLHttpRequest();
	let lists      = "";
	let data       = "";
	let dataLength = 0;

	request.open('get', '/map/search?keyword='+recv.value, true);

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
					 * place[locality]   : 서울특별시|Seoul
					 * place[political1] : 동작구|Dongjak-gu
					 * place[political2] : 흑석동|Heukseok-dong
					 * place[political3] : 서달로|Seodal-ro (option)
					*/

					let tmp = data.place[i].split('&');

					place['country'] = data.country[i];


					for (let j=0; j<tmp.length; j++) {
						place[tmp[j].split(':')[0]] =  tmp[j].split(':')[1];
					}

					let place_org = place['country'].split('|')[0]
						+" "+ place['locality'   ].split('|')[0]
						+" "+ place['political1' ].split('|')[0]
						+" "+ place['political2' ].split('|')[0]
						+   ((place['political3' ])?" "+place['political3'].split('|')[0]:"");

					let place_rev = ((place['political3'])?" "+place['political3'].split('|')[0]:"")
						+", "+ place['political2' ].split('|')[1]
						+", "+ place['political1' ].split('|')[1]
						+", "+ place['locality'   ].split('|')[1]
						+", "+ place['country'    ];

					lists += "<a href='/"+data.map[i]+"'><li class='org'>"+place_org+"</li><li class='rev'>"+place_rev+"</li></a>";
				}
			} else {
				lists  = "<a href='#'><li>No Results</li></a>";
			}

			//console.log(lists);
			searchResult.innerHTML = lists;
		} else {
			// We reached our target server, but it returned an error
			searchResult.innerHTML = "No Results";
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

let searchBtn    = document.querySelector("#map-search-button");
let searchBox    = document.querySelector("#map-search-box");
let searchToggle = document.querySelector("#map-search");

if (searchBtn) searchBtn.addEventListener("click", function() { searchToggle.checked = false; mapSearch(searchBox); });
if (searchBox) searchBox.addEventListener("keydown", function(e) {
	if(searchBox.value == "") {
		searchToggle.checked = false;
		searchResult.innerHTML = "<a href='#'><li>No Results</li></a>";
	}
	if(e.keyCode == "13") {
		searchToggle.checked = true;
		mapSearch(this)
	}
});
