import { useFormContext } from "react-hook-form";
import { useFieldError } from "../../../../../hooks";

const Checkbox = ({
	name,
	label,
	rules = {},
	disabled = false,
	className = "",
	showErrors = true
}) => {
	const { register } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

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

			{errorMessages.map((e) => (
				<div key={e.$uid} className="invalid-feedback d-block">
					{e.$message}
				</div>
			))}
		</div>
	);
}

export default Checkbox;