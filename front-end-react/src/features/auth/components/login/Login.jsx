import { useEffect, useState } from "react";
import { Link, useNavigate, useSearchParams } from "react-router";
import { useDispatch } from "react-redux";
import { FormProvider, useForm } from "react-hook-form";
import { notify } from "../../../../services";
import { UIInput, UICheckbox, UIButton, UILoading  } from "../../../../components/common/ui";
import { loginRules } from "../../validation/loginRules.js";
import { login as loginUser } from "../../services/authService.js";
import { login } from "../../../../store/authSlice.js";

const intialValues = {
	email: '',
	password: '',
	remember: false
};

const Login = ({ isClient, guard }) => {
	const [searchParams] = useSearchParams()
	const dispatch = useDispatch();
	const navigate = useNavigate();
	const [isLoading, setIsLoading] = useState(false);

	const methods = useForm({
		defaultValues: intialValues,
		mode: 'onTouched',
		reValidateMode: 'onChange',
		criteriaMode: 'all'
	});

	const {
		handleSubmit,
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
		try {
			setIsLoading(true);
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
		}
		catch (error) {
			console.error("Login error", error);
		}
		finally {
			setIsLoading(false);
		}
	};

	const onInvalid = (errors) => {
		console.log(errors);
	};

	const buildFieldRules = loginRules;

	return (
		<>
			{isLoading && <UILoading fullscreen={true} color="#436d9a" size={60} />}

			<div className="container flex-grow-1 d-flex justify-content-center align-items-center py-4">
				<div className="card shadow-sm p-4 bg-dark-subtle"
					 style={{ maxWidth: 400, width: "100%"}}
				>
					<h3 className="text-center mb-4">Login</h3>

					<FormProvider {...methods}>
						<form onSubmit={handleSubmit(loginHandler, onInvalid)}>
							<UIInput
								name="email"
								rules={buildFieldRules.email}
								placeholder="Place enter email..."
								label="Email"
								icon={['fas', 'user']}
							/>

							<UIInput
								type="password"
								name="password"
								rules={buildFieldRules.password}
								placeholder="Place enter password..."
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
						</form>
					</FormProvider>

					{isClient && (
						<p className="text-center mt-3">
							Don't have an account? <Link to="/sign-up">Sign up</Link>
						</p>
					)}
				</div>
			</div>
		</>

	);
}

export default Login;