"use strict";

class MyComponent extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
    }

    componentWillUnmount() {
    }

    render() {

        return (
            <div>
                Admin main
            </div>
        )
    }

}

ReactDOM.render(<MyComponent name="Admin" />, document.querySelector("#action"));
