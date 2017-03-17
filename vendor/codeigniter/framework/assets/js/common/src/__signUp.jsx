
class SignUp extends React.Component {

	constructor(props) {
		super(props);

		this.state = {
			uid: '',
			name: '',
			pswd: '',
			conf: ''
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

		if(e.target.name === "pswd" || e.target.name === "conf") {
			this.checkPasswordError();
		}
	}

	handleSubmit(e) {
		e.preventDefault();

		const handleSubmitForSignUp = this.props.handleSubmitForSignUp;

		if (!this.showFormErrors()) {
			console.log('form is invalid: do not submit');
		} else {
			handleSubmitForSignUp(this.state);
			console.log('form is valid: submit');
		}
	}

	showInputError(refName) {
		const validity = this.refs[refName].validity;
		const error = document.querySelector(`#sign-up div[name='${refName}Error']`);

		if (!validity.valid) {
			if (validity.valueMissing) {
				error.textContent = "꼭 입력해주세요."; 
			} else if (refName.indexOf('uid') !== -1 && validity.patternMismatch) {
				error.textContent = "영어와 숫자, -_ 를 조합하여 6글자 이상 입력해주세요";
			} else if (refName.indexOf('name') !== -1 && validity.patternMismatch) {
				error.textContent = "2글자 이상 입력해주세요";
			}
			return false;
		}

		error.textContent = '';
		
		return true;
	}

	checkPasswordError() {
		const validity_pswd = this.refs['pswd'].validity;
		const validity_conf = this.refs['conf'].validity;

		const error_pswd = document.querySelector("#sign-up div[name='pswdError'");
		const error_conf = document.querySelector("#sign-up div[name='confError'");

		if (this.refs.pswd.value !== this.refs.conf.value && this.refs.conf.value !== "") {
			this.refs.conf.setCustomValidity('패스워드를 확인해주세요.');
		} else {
			this.refs.conf.setCustomValidity('');
		}

		error_pswd.textContent="";
		error_conf.textContent="";

		if (validity_pswd.patternMismatch) {
			error_pswd.textContent = "8글자 이상 입력해주세요.";
		}

		if (validity_conf.customError) {
			error_conf.textContent="패스워드를 확인해주세요.";
		} 
		
		return true;
	}
	showFormErrors() {
		const inputs = document.querySelectorAll('#sign-up input');
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
				<form className="" name="sign-up" id="sign-up" method="post">
				<div className="">
					<input className=""
					type="text"
					name="uid"
					ref="uid"
					pattern="[0-9A-Za-z_-]{6,}"
					placeholder="ID"
					value={ this.state.uid } 
					onChange={ this.handleChange }
					required
					/>
				<div className="error" name="uidError" />
				</div>

				<div className="">
					<input className=""
					type="text"
					name="name"
					ref="name"
					pattern=".{2,}"
					placeholder="Nick Name"
					value={ this.state.name } 
					onChange={ this.handleChange }
					required
					/>
				<div className="error" name="nameError" />
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
					required />
				<div className="error" name="pswdError" />
				</div>

				<div className="">
					<input className=""
					type="password" 
					name="conf"
					ref="conf"
					placeholder="Confirm Password"
					value={ this.state.conf } 
					onChange={ this.handleChange }
					required />
				<div className="error" name="confError" />
				</div>

				<button className=""
				onClick={ this.handleSubmit }>
				아이디 만들기
				</button>
				</form>
		);
	}
}
