import { useId } from 'react';
import { useFormContext } from "react-hook-form";
import { useFieldError } from "../../../../../hooks";

const Radio = ({
	name,
	options,
	rules = {},
	label,
	showErrors = true,
}) => {
	const groupId = useId();
	const { register } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	const capitalizeFirstLetter = (string) => string.charAt(0).toUpperCase() + string.slice(1);

	return (
		<div className="form-group mb-3">
			<label className="form-label" style={{ paddingLeft: 5 }}>
				{label}
			</label>
			<br />

			{options.map((option, idx) => {
				const id = `${groupId}-${option}`;
				const regProps = idx === 0 ? register(name, rules) : register(name);

				return (
					<div key={option} className="form-check">
						<input
							type="radio"
							id={id}
							value={option}
							name={name}
							{...regProps}
							className={`form-check-input ${isInvalid ? 'is-invalid' : ''}`}
							aria-invalid={isInvalid ? 'true' : undefined}
						/>

						<label htmlFor={id} className="form-check-label" style={{ paddingLeft: 5 }}>
							{capitalizeFirstLetter(option)}
						</label>
					</div>
				);
			})}

			{errorMessages.map((e) => (
				<div key={e.$uid} className="invalid-feedback d-block">
					{e.$message}
				</div>
			))}
		</div>
	);
}

export default Radio;