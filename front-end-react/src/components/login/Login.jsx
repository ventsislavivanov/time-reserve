import { Link } from "react-router";
import { FormProvider, useForm } from "react-hook-form";
import FormInput from "../ui/form-input/FormInput.jsx";
import { loginRules } from "../../formValidations/index.js";

const intialValues = {
	email: '',
	password: ''
};

export default function Login() {
	const methods = useForm({
		defaultValues: intialValues,
		mode: 'onTouched',
		reValidateMode: 'onChange',
		criteriaMode: 'all'
	});

	const {
		handleSubmit,
		reset
	} = methods;

	const loginHandler = async (data) => {
		const { email, password } = data;
		console.log(email, password);
		// reset();
	};

	const onInvalid = (errors) => {
		console.log(errors);
	};

	const buildFieldRules = loginRules;

	return (
		<div className="container">
			<div className="container vh-100 d-flex justify-content-center align-items-center">
				<div className="card shadow-sm p-4 bg-dark-subtle"
					 style={{ maxWidth: 400, width: "100%"}}
				>
					<h3 className="text-center mb-4">Login</h3>

					<FormProvider {...methods}>
						<form onSubmit={handleSubmit(loginHandler, onInvalid)}>
							<FormInput
								name="email"
								rules={buildFieldRules.email}
								placeholder="Place enter email..."
								label="Email"
								icon={['fas', 'user']}
							/>

							<FormInput
								type="password"
								name="password"
								rules={buildFieldRules.password}
								placeholder="Place enter password..."
								label="Password"
								icon={['fas', 'lock']}
							/>

							<button type="submit" className="btn btn-primary w-100">Login</button>
						</form>
					</FormProvider>

					<p className="text-center mt-3">
						Don't have an account? <Link to="/sign-up">Sign up</Link>
					</p>
				</div>
			</div>
		</div>
	);
}