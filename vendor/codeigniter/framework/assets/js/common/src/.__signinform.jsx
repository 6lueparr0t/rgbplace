
class SignInForm extends React.Component {

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

		console.log('component state', JSON.stringify(this.state));

		if (!this.showFormErrors()) {
			console.log('form is invalid: do not submit');
		} else {
			console.log('form is valid: submit');
		}
	}

	showInputError(refName) {
		const validity = this.refs[refName].validity;
		const error = document.getElementById(`${refName}Error`);

		if (!validity.valid) {
			if (validity.valueMissing) {
				error.textContent = "꼭 입력해주세요!"; 
			}
			return false;
		}

		error.textContent = '';
		
		return true;
	}

	showFormErrors() {
		const inputs = document.querySelectorAll('input');
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
				<form method="post">
					<div className="form-group">
						<input className="form-control"
						type="text"
						name="uid"
						ref="uid"
						value={ this.state.uid } 
						onChange={ this.handleChange }
						required />
						<div className="error" id="uidError" />
					</div>

					<div className="form-group">
						<input className="form-control"
						type="password" 
						name="pswd"
						ref="pswd"
						value={ this.state.pswd } 
						onChange={ this.handleChange }
						pattern=".{5,}"
						required />
						<div className="error" id="pswdError" />
					</div>
				</div>

				<button className="btn btn-primary"
				onClick={ this.handleSubmit }>
				Sign In	
				</button>
				</form>
		);
	}
}
