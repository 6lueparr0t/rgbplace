"use strict";

class MyComponent extends React.Component {
    constructor(props) {
        super(props);

        this.onUnload = this.onUnload.bind(this); // if you need to bind callback to this
    }

    onUnload(event) { // the method that will be used for both add and remove event
        //console.log("Test")
        event.returnValue = 1;
    }

    componentDidMount() {
       window.addEventListener("beforeunload", this.onUnload)
    }

    componentWillUnmount() {
        window.removeEventListener("beforeunload", this.onUnload)
    }

    render() {

        return (
            <div>
                Hello, World!!!!
            </div>
        )
    }

}

ReactDOM.render(<MyComponent name="Daihyun99" />, document.getElementById("action"));
