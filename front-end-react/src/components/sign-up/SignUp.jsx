import { useState } from "react";
import { useNavigate } from "react-router";
import { FormProvider, useForm } from "react-hook-form";

import { FormInput, FormRadio, FormDatePicker } from "../ui";
import { makeSignUpRules } from "../../formValidations";
import { register as registerUser } from "../../services/authService.js";
import Loading from "../loading/Loading.jsx"

const intialValues = {
	name: '',
	email: '',
	password: '',
	confirm_password: '',
	phone: '',
	address: '',
	birth_date: ''
}

export default function SignUp() {
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
		} catch (err) {
			const message = err.response?.data?.message || err.message;
			alert(message);
		} finally {
			setIsLoading(false);
		}
	}

	const onInvalid = (errors) => {
		console.log(errors);
	}

	const buildFieldRules = makeSignUpRules({ getValues });

	return (
		<>
			{isLoading && <Loading fullscreen={true} color="#436d9a" size={60} />}

			<div className="container flex-grow-1 d-flex justify-content-center align-items-center py-4">
				<div className="card shadow-sm p-4 bg-dark-subtle"
					 style={{ maxWidth: 500, width: "100%"}}
				>
					<h3 className="text-center mb-4">Login</h3>

					<FormProvider {...methods}>
						<form onSubmit={handleSubmit(registerHandler, onInvalid)}>
							<div className="row">
								<div className="col-md-12">
									<FormInput
										name="name"
										rules={buildFieldRules.name}
										placeholder="Full Name"
										icon={['fas', 'user']}
									/>
								</div>

								<div className="col-md-12">
									<FormInput
										name="email"
										rules={buildFieldRules.email}
										placeholder="Email"
										icon={['fas', 'envelope']}
									/>
								</div>

								<div className="col-md-6">
									<FormInput
										type="password"
										name="password"
										rules={buildFieldRules.password}
										placeholder="Password"
										icon={['fas', 'unlock']}
									/>
								</div>

								<div className="col-md-6">
									<FormInput
										type="password"
										name="confirm_password"
										rules={buildFieldRules.confirm_password}
										placeholder="Confirm password"
										icon={['fas', 'unlock-keyhole']}
									/>
								</div>

								<div className="col-md-12">
									<FormInput
										name="address"
										rules={buildFieldRules.address}
										placeholder="Address"
										icon={['fas', 'location-pin']}
									/>
								</div>
							</div>

							<div className="row">
								<div className="col-md-8">
									<div className="row">
										<div className="col-md-12">
											<FormInput
												name="phone"
												rules={buildFieldRules.phone}
												placeholder="Phone"
												icon={['fas', 'phone']}
												inputMode="numeric"
											/>
										</div>

										<div className="col-md-12">
											<FormDatePicker
												name="birth_date"
												rules={buildFieldRules.birth_date}
												placeholder="dd/mm/yyyy"
												icon={['fas', 'calendar']}
											/>
										</div>
									</div>
								</div>

								<div className="col-md-4">
									<FormRadio
										name="gender"
										rules={buildFieldRules.gender}
										label="Gender"
										options={['male', 'female', 'other']}
									/>
								</div>
							</div>

							<button type="submit" className="btn btn-primary w-100">
								Register
							</button>
						</form>
					</FormProvider>
				</div>
			</div>
		</>
	);
}