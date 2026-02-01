import { useState } from "react";
import { useNavigate } from "react-router";
import { FormProvider } from "react-hook-form";

import { UIInput, UIRadio, UIDatePicker, UIButton, UILoading } from "../../../../components/common/ui";
import { signUpRules } from "../../validations/signUpRules.js";
import { register as registerUser } from "../../services/authService.js";
import { useAppForm } from "../../../../hooks";

const intialValues = {
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
	const [isLoading, setIsLoading] = useState(false);

	const methods = useAppForm({
		defaultValues: intialValues,
	});

	const {
		handleSubmit,
		reset,
		getValues
	} = methods;

	const registerHandler = async (data) => {
		const { confirm_password, ...submitData } = data;

		try {
			setIsLoading(true);
			const response = await registerUser(submitData);

			alert(response.message);

			reset();
			navigate('/');
		}
		catch (error) {
			console.error("Sign up error", error);
		}
		finally {
			setIsLoading(false);
		}
	}

	const onInvalid = (errors) => {
		console.log(errors);
	}

	const rules = signUpRules({ getValues });

	return (
		<>
			{isLoading && <UILoading fullscreen={true} color="#436d9a" size={60} />}

			<div className="container flex-grow-1 d-flex justify-content-center align-items-center py-4">
				<div className="card shadow-sm p-4 bg-dark-subtle"
					 style={{ maxWidth: 500, width: "100%"}}
				>
					<h3 className="text-center mb-4">Login</h3>

					<FormProvider {...methods}>
						<form onSubmit={handleSubmit(registerHandler, onInvalid)}>
							<div className="row">
								<div className="col-md-12">
									<UIInput
										name="name"
										rules={rules.name}
										placeholder="Full Name"
										icon={['fas', 'user']}
									/>
								</div>

								<div className="col-md-12">
									<UIInput
										name="email"
										rules={rules.email}
										placeholder="Email"
										icon={['fas', 'envelope']}
									/>
								</div>

								<div className="col-md-6">
									<UIInput
										type="password"
										name="password"
										rules={rules.password}
										placeholder="Password"
										icon={['fas', 'unlock']}
									/>
								</div>

								<div className="col-md-6">
									<UIInput
										type="password"
										name="confirm_password"
										rules={rules.confirm_password}
										placeholder="Confirm password"
										icon={['fas', 'unlock-keyhole']}
									/>
								</div>

								<div className="col-md-12">
									<UIInput
										name="address"
										rules={rules.address}
										placeholder="Address"
										icon={['fas', 'location-pin']}
									/>
								</div>
							</div>

							<div className="row">
								<div className="col-md-8">
									<div className="row">
										<div className="col-md-12">
											<UIInput
												name="phone"
												rules={rules.phone}
												placeholder="Phone"
												icon={['fas', 'phone']}
												inputMode="numeric"
											/>
										</div>

										<div className="col-md-12">
											<UIDatePicker
												name="birth_date"
												rules={rules.birth_date}
												placeholder="dd/mm/yyyy"
												icon={['fas', 'calendar']}
											/>
										</div>
									</div>
								</div>

								<div className="col-md-4">
									<UIRadio
										name="gender"
										rules={rules.gender}
										label="Gender"
										options={['male', 'female', 'other']}
									/>
								</div>
							</div>

							<UIButton type="submit" className="w-100" isLoading={isLoading}>
								Register
							</UIButton>
						</form>
					</FormProvider>
				</div>
			</div>
		</>
	);
}

export default SignUp;