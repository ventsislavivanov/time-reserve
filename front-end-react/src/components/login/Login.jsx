import { useEffect, useState } from "react";
import { Link, useNavigate, useSearchParams } from "react-router";
import { useDispatch } from "react-redux";
import { FormProvider, useForm } from "react-hook-form";
import { toast } from "react-toastify";
import { UIInput, UICheckbox  } from "../common/ui";
import { loginRules } from "../../formValidations/index.js";
import { login as loginUser } from "../../services/authService.js";
import { login } from "../../store/authSlice.js";
import Loading from "../common/loading/Loading.jsx";

const intialValues = {
	email: '',
	password: '',
	remember: false
};

export default function Login(props) {
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
			const response = await loginUser(email, password, props.guard, remember);

			toast.success('Login successful');

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
			{isLoading && <Loading fullscreen={true} color="#436d9a" size={60} />}

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
		</>

	);
}