
class SignIn extends React.Component {

	constructor(props) {
		super(props);

		this.state = {
			uid: '',
			pswd: ''
		};

		this.handleChange = this.handleChange.bind(this);
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	handleChange(e) {
		e.target.classList.add('active');

		this.setState({
			[e.target.name]: e.target.value
		});

		this.showInputError(e.target.name);
	}

	handleSubmit(e) {
		e.preventDefault();

		const handleSubmitForSignIn = this.props.handleSubmitForSignIn;

		if (!this.showFormErrors()) {
			console.log('form is invalid: do not submit');
		} else {
			handleSubmitForSignIn(this.state);
			console.log('form is valid: submit');
		}
	}

	showInputError(refName) {
		const validity = this.refs[refName].validity;
		const error = document.querySelector(`#sign-in div[name='${refName}Error']`);

		if (!validity.valid) {
			if (validity.valueMissing) {
				error.textContent = "꼭 입력해주세요."; 
			} else if (refName.indexOf('uid') !== -1 && validity.patternMismatch) {
				error.textContent = "6글자 이상 입력해주세요"; 
			} else if (refName.indexOf('pswd') !== -1 && validity.patternMismatch) {
				error.textContent = "8글자 이상 입력해주세요"; 
			}
			return false;
		}

		error.textContent = '';
		
		return true;
	}

	showFormErrors() {
		const inputs = document.querySelectorAll('#sign-in input');
		let isFormValid = true;

		inputs.forEach(input => {
			input.classList.add('active');

			const isInputValid = this.showInputError(input.name);

			if (!isInputValid) {
				isFormValid = false;
			}
		});

		return isFormValid;
	}

	render() {
		return (
				<form className="" name="sign-in" id="sign-in" method="post">
				<div className="">
				<input className=""
					type="text"
					name="uid"
					ref="uid"
					pattern=".{6,}"
					placeholder="ID"
					value={ this.state.uid } 
					onChange={ this.handleChange }
					required
				/>
				<div className="error" name="uidError" />
				</div>

				<div className="">
				<input className=""
					type="password" 
					name="pswd"
					ref="pswd"
					pattern=".{8,}"
					placeholder="Password"
					value={ this.state.pswd } 
					onChange={ this.handleChange }
					required
				/>
				<div className="error" name="pswdError" />
				</div>

				<button className=""
				onClick={ this.handleSubmit } >
				로그인
				</button>
				</form>
		);
	}
}
