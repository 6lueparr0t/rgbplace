"use strict";

class MyComponent extends React.Component {
    constructor(props) {
        super(props);

        this.onUnload = this.onUnload.bind(this); // if you need to bind callback to this
    }

	componentWillMount(){
		console.log("componentWillMount");
		window.addEventListener("beforeunload", this.onUnload)
	}

	render() {

		return (
				<div>
				add to body test
				</div>
			   )
	}

	componentWillReceiveProps(){
		console.log("componentWillReceiveProps");
	}

	shouldComponentUpdate(){
		console.log("shouldComponentUpdate");
	}

	componentDidMount() {
		console.log("componentDidMount");
	}

	componentDidUpdate(){
		console.log("componentDidUpdate");
	}

	componentWillUnmount() {
        window.removeEventListener("beforeunload", this.onUnload)
    }

    onUnload(event) { // the method that will be used for both add and remove event
        console.log("onUnload")
        event.returnValue = 1;
    }

}

ReactDOM.render(<MyComponent name="Daihyun99" />, document.querySelector("body"));
