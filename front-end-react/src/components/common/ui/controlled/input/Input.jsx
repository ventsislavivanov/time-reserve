import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useFormContext } from "react-hook-form";
import { useFieldError } from "../../../../../hooks";

const Input = ({
	type = 'text',
	name,
	placeholder,
	rules,
	label,
	icon = [],
	disabled,
	classes = 'form-control',
	showErrors = true,
	...rest
}) => {
	const { register } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	const cx = (...classes) => classes.filter(Boolean).join(' ');

	return (
		<div className="form-group mb-3">
			{label && <label htmlFor={name} className="control-label">{label}</label>}

			<div className="input-group">
				{icon.length > 0 && (
					<span className="input-group-text">
						<FontAwesomeIcon icon={icon} />
					</span>
				)}

				<input
					type={type}
					id={name}
					placeholder={placeholder}
					{...register(name, rules)}
					className={cx(classes, isInvalid ? 'is-invalid' : null)}
					disabled={disabled}
					{...rest}
				/>
			</div>

			{errorMessages.map((e) => (
				<div key={e.$uid} className="invalid-feedback d-block">
					{e.$message}
				</div>
			))}
		</div>
	);
}

export default Input;