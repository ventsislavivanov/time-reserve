import { useEffect } from "react";
import { Link, useNavigate, useSearchParams } from "react-router";
import { useDispatch } from "react-redux";
import { notify } from "../../../../services";
import {
	UIAppForm,
	UIInput,
	UICheckbox,
	UIButton,
	UILoading,
} from "../../../../components/common/ui";
import { useAppForm } from "../../../../hooks";
import { loginRules } from "../../validations/loginRules.js";
import { login as loginUser } from "../../services/authService.js";
import { login } from "../../../../store/authSlice.js";

const initialValues  = {
	email: '',
	password: '',
	remember: false
};

const Login = ({ isClient, guard }) => {
	const [searchParams] = useSearchParams()
	const dispatch = useDispatch();
	const navigate = useNavigate();

	const methods = useAppForm({
		defaultValues: initialValues
	});

	const {
		isLoading,
		reset,
		setValue
	} = methods;

	useEffect(() => {
		const emailFromUrl = searchParams.get('email');
		if (emailFromUrl) {
			setValue('email', emailFromUrl);
		}
	}, [searchParams, setValue]);

	const loginHandler = async (data) => {
		const { email, password, remember  } = data;

		const response = await loginUser(email, password, guard, remember);
		notify.success('Login successful');

		localStorage.setItem("token", response.token);
		dispatch(login({
			uid: response.user.uid,
			email: response.user.email,
			role: response.user.role
		}));

		reset();
		navigate(response.user.role === 'client' ? '/' : '/staff/dashboard');
	};

	const onInvalid = (errors) => {
		console.log(errors);
	};

	const rules = loginRules;

	return (
		<div className="container flex-grow-1 d-flex justify-content-center align-items-center py-4">
			<div className="card shadow-sm p-4 bg-dark-subtle"
				 style={{ maxWidth: 400, width: "100%"}}
			>
				<h3 className="text-center mb-4">Login</h3>

				<UIAppForm methods={methods} onSubmit={loginHandler} onInvalid={onInvalid}>
					<UIInput
						name="email"
						rules={rules.email}
						placeholder="Please enter email..."
						label="Email"
						icon={['fas', 'user']}
					/>

					<UIInput
						type="password"
						name="password"
						rules={rules.password}
						placeholder="Please enter password..."
						label="Password"
						icon={['fas', 'lock']}
					/>

					<UICheckbox
						name="remember"
						label="Remember me"
					/>

					<UIButton type="submit" className="w-100" isLoading={isLoading}>
						Login
					</UIButton>
				</UIAppForm>

				{isClient && (
					<p className="text-center mt-3">
						Don't have an account? <Link to="/sign-up">Sign up</Link>
					</p>
				)}
			</div>
		</div>
	);
}

export default Login;