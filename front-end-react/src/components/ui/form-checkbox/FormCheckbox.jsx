import React from "react";
import { useFormContext } from "react-hook-form";

export default function FormCheckbox({
										 name,
										 label,
										 rules = {},
										 disabled = false,
										 className = ""
									 }) {
	const { register, formState: { errors, isSubmitted }, getFieldState } = useFormContext();

	// Проверка за валидност
	const { isTouched } = getFieldState(name);
	const isInvalid = (isTouched || isSubmitted) && errors[name];

	return (
		<div className={`form-check mb-3 ${className}`}>
			<input
				type="checkbox"
				id={name}
				className={`form-check-input ${isInvalid ? 'is-invalid' : ''}`}
				disabled={disabled}
				{...register(name, rules)}
			/>
			{label && (
				<label className="form-check-label text-secondary" htmlFor={name}>
					{label}
				</label>
			)}

			{isInvalid && (
				<div className="invalid-feedback d-block">
					{errors[name]?.message}
				</div>
			)}
		</div>
	);
}