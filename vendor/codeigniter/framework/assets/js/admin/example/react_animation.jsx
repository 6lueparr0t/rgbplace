"use strict";
class MyComponent extends React.Component {
	constructor(props) {
		super(props);
		this.onUnload = this.onUnload.bind(this); // if you need to bind callback to this
	}
	webkitAnimationEnd (event) {
		setTimeout(function() { this.style.display = 'none';}.bind(this), 2000);
	}
	sleep(ms) {
		return new Promise(resolve => setTimeout(resolve, ms));
	}
	onUnload(event) { // the method that will be used for both add and remove event
		//console.log("Test")
		event.returnValue = 1;
	}
	componentDidMount() {
		window.addEventListener("beforeunload", this.onUnload)
		document.getElementById('test').addEventListener('webkitAnimationEnd', this.webkitAnimationEnd);
	}
	componentWillUnmount() {
		window.removeEventListener("beforeunload", this.onUnload)
		document.getElementById('test').removeEventListener('webkitAnimationEnd', this.webkitAnimationEnd);
	}
	render() {
		return (
				<div>
				Dev main
				</div>
			   )
	}
}
ReactDOM.render(
		<MyComponent name="Daihyun99" />, document.getElementById('action')
);
function sleep(milliseconds) {
  let start = new Date().getTime();
  for (let i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}
