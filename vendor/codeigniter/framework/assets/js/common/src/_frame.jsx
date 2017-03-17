class Frame extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			uid: '',
			isSignedIn : false
		};

		this.onUnload = this.onUnload.bind(this);

		const handleSubmitForSignIn = this.handleSubmitForSignIn.bind(this);
		const handleSubmitForSignUp = this.handleSubmitForSignUp.bind(this);
	}

	handleSubmitForSignIn(state) {
		event.preventDefault();

		console.log('Sign In -> child to parent : component state', JSON.stringify(state));
		// xmlhttprequset processing
		// this.setState({['uid']:state.uid, ['isSignedIn'] : true});

		axios.get('/sign/test')
			.then(function (response) {
					console.log(response);
					})
		.catch(function (error) {
				console.log(error);
				});

		this.setState({['isSignedIn'] : true});
	}

	handleSubmitForSignUp(state) {
		event.preventDefault();

		console.log('Sign Up -> child to parent : component state', JSON.stringify(state));

		this.setState({['isSignedIn'] : true});
	}

	handleSubmitForSignOut(state) {
		event.preventDefault();

		console.log('Sign Out -> child to parent : component state', JSON.stringify(state));

		this.setState({['isSignedIn'] : true});
	}

	onUnload(event) {
		console.log("onUnload");
		event.returnValue = 1;
	}


	signIn() {
		let tag = "";

		if(!this.state.isSignedIn) {
			tag = <SignIn handleSubmitForSignIn = {this.handleSubmitForSignIn.bind(this)} />;
		}

		return tag;
	}

	signUp() {
		let tag = "";

		if(!this.state.isSignedIn) {
			tag =  <SignUp handleSubmitForSignUp = {this.handleSubmitForSignUp.bind(this)} />;
		}

		return tag;
	}

	signOut() {
		//let tag = "";

		//if(!this.state.isSignedIn) {
		//	tag =  <SignOut handleSubmitForSignOut = {this.handleSubmitForSignOut.bind(this)} />;
		//}

		//return tag;
	}

	render() {
		return (
			<div>
				{this.signIn ()}
				{this.signUp ()}
				{this.signOut()}
			</div>
		);
	}
}

ReactDOM.render(<Frame />, document.querySelector("body"));
