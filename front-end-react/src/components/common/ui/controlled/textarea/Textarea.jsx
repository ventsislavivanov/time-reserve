import { useFormContext } from 'react-hook-form';
import { useFieldError } from "../../../../../hooks";

const Textarea = ({
	name,
	placeholder,
	rules,
	label,
	rows = 3,
	disabled,
	classes = 'form-control',
	showErrors = true,
}) => {
	const { register } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	const cx = (...classes) => classes.filter(Boolean).join(' ');

	return (
		<div className="form-group mb-3">
			{label && (
				<label htmlFor={name} className="control-label">
					{label}
				</label>
			)}

			<textarea
				id={name}
				rows={rows}
				placeholder={placeholder}
				{...register(name, rules)}
				className={cx(classes, isInvalid ? 'is-invalid' : null)}
				disabled={disabled}
			/>

			{errorMessages.map((e) => (
				<div key={e.$uid} className="invalid-feedback d-block">
					{e.$message}
				</div>
			))}
		</div>
	);
};

export default Textarea;
