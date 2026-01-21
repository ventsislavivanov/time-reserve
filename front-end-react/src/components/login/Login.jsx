import { Link, useNavigate } from "react-router";
import { useDispatch } from "react-redux";
import { FormProvider, useForm } from "react-hook-form";
import { FormInput } from "../ui";
import { loginRules } from "../../formValidations/index.js";
import { login as loginUser } from "../../services/auth.js";
import { login } from "../../store/authSlice.js";

const intialValues = {
	email: '',
	password: ''
};

export default function Login(props) {
	const dispatch = useDispatch();
	const navigate = useNavigate();

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
		try {
			const response = await loginUser(email, password, props.guard);

			localStorage.setItem("token", response.token);

			dispatch(login({
				uid: response.user.uid,
				email: response.user.email,
				role: response.user.role
			}));

			if (response.user.role === 'client') {
				navigate('/');
				return;
			}

			navigate('/staff/dashboard');
		}
		catch (error) {
			console.log("Login error", error);
		}
		finally {
			reset();
		}
	};

	const onInvalid = (errors) => {
		console.log(errors);
	};

	const buildFieldRules = loginRules;

	return (
		<div className="container flex-grow-1 d-flex justify-content-center align-items-center py-4">
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

				{props.isClient && (
					<p className="text-center mt-3">
						Don't have an account? <Link to="/sign-up">Sign up</Link>
					</p>
				)}
			</div>
		</div>
	);
}