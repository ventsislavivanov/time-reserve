import { useEffect } from "react";
import { Link, useNavigate, useSearchParams } from "react-router";
import { notify } from "../../../../services";
import {
	UIAppForm,
	UIInput,
	UICheckbox,
	UIButton,
} from "../../../../components/common/ui";
import { useAppForm, useRecaptcha } from "../../../../hooks";
import { loginRules } from "../../validations/loginRules.js";
import { login as loginUser } from "../../services/authService.js";
import { useAuth } from "../../../../context";

const initialValues  = {
	email: '',
	password: '',
	remember: false
};

const Login = ({ isClient, guard }) => {
	const [searchParams] = useSearchParams()
	const { login } = useAuth();
	const navigate = useNavigate();
	const { getToken } = useRecaptcha();

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
		const token = await getToken("login");

		const { email, password, remember  } = data;

		const response = await loginUser({
			email,
			password,
			guard,
			remember,
			recaptcha: token
		});
		notify.success('Login successful');

		localStorage.setItem("token", response.token);
		login({
			uid: response.user.id,
			email: response.user.email,
			role: response.user.role
		});

		reset();
		navigate(response.user.role === 'client' ? '/' : '/staff/dashboard');
	};

	const onInvalid = (errors) => {
		console.log(errors);
	};

	const rules = loginRules;

	return (
		<div className="mx-auto w-full max-w-7xl px-4 flex-1 flex justify-center items-center py-12">
			<div className="w-full max-w-md rounded-2xl border bg-card p-8 shadow-lg">
				<h1 className="mb-6 text-center">Login</h1>

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

					<UIButton type="submit" className="w-full" isLoading={isLoading}>
						Login
					</UIButton>
				</UIAppForm>

				{isClient && (
					<p className="text-center mt-4">
						Don't have an account? <Link to="/sign-up" className="font-medium text-primary hover:underline">Sign up</Link>
					</p>
				)}
			</div>
		</div>
	);
}

export default Login;