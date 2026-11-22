import { useNavigate } from "react-router";

import { useAppForm, useRecaptcha } from "../../../../hooks";
import { UIAppForm, UIInput, UIRadio, UIDatePicker, UIButton } from "../../../../components/common/ui";
import { signUpRules } from "../../validations/signUpRules.js";
import { register as registerUser } from "../../services/authService.js";

const initialValues = {
	name: '',
	email: '',
	password: '',
	confirm_password: '',
	phone: '',
	address: '',
	birth_date: ''
}

const SignUp = () => {
	const navigate = useNavigate();
	const { getToken } = useRecaptcha();

	const methods = useAppForm({
		defaultValues: initialValues,
	});

	const {
		isLoading,
		reset,
		getValues
	} = methods;

	const registerHandler = async (data) => {
		const token = await getToken("register");

		const { confirm_password, ...submitData } = data;

		submitData.recaptcha = token;

		const response = await registerUser(submitData);

		alert(response.message);

		reset();
		navigate('/');
	}

	const onInvalid = (errors) => {
		console.log(errors);
	}

	const rules = signUpRules({ getValues });

	return (
		<div className="mx-auto w-full max-w-7xl px-4 flex-1 flex justify-center items-center py-12">
			<div className="w-full max-w-xl rounded-2xl border bg-card p-8 shadow-lg">
				<h1 className="mb-6 text-center">Sign up</h1>

				<UIAppForm methods={methods} onSubmit={registerHandler} onInvalid={onInvalid}>
					<div className="grid grid-cols-12 gap-4">
						<div className="col-span-12 md:col-span-12">
							<UIInput
								name="name"
								rules={rules.name}
								placeholder="Full Name"
								icon={['fas', 'user']}
							/>
						</div>

						<div className="col-span-12 md:col-span-12">
							<UIInput
								name="email"
								rules={rules.email}
								placeholder="Email"
								icon={['fas', 'envelope']}
							/>
						</div>

						<div className="col-span-12 md:col-span-6">
							<UIInput
								type="password"
								name="password"
								rules={rules.password}
								placeholder="Password"
								icon={['fas', 'unlock']}
							/>
						</div>

						<div className="col-span-12 md:col-span-6">
							<UIInput
								type="password"
								name="confirm_password"
								rules={rules.confirm_password}
								placeholder="Confirm password"
								icon={['fas', 'unlock-keyhole']}
							/>
						</div>

						<div className="col-span-12 md:col-span-12">
							<UIInput
								name="address"
								rules={rules.address}
								placeholder="Address"
								icon={['fas', 'location-pin']}
							/>
						</div>
					</div>

					<div className="grid grid-cols-12 gap-4">
						<div className="col-span-12 md:col-span-8">
							<div className="grid grid-cols-12 gap-4">
								<div className="col-span-12 md:col-span-12">
									<UIInput
										name="phone"
										rules={rules.phone}
										placeholder="Phone"
										icon={['fas', 'phone']}
										inputMode="numeric"
									/>
								</div>

								<div className="col-span-12 md:col-span-12">
									<UIDatePicker
										name="birth_date"
										rules={rules.birth_date}
										placeholder="dd/mm/yyyy"
										icon={['fas', 'calendar']}
									/>
								</div>
							</div>
						</div>

						<div className="col-span-12 md:col-span-4">
							<UIRadio
								name="gender"
								rules={rules.gender}
								label="Gender"
								options={['male', 'female', 'other']}
							/>
						</div>
					</div>

					<UIButton type="submit" className="w-full" isLoading={isLoading}>
						Register
					</UIButton>
				</UIAppForm>
			</div>
		</div>
	);
}

export default SignUp;