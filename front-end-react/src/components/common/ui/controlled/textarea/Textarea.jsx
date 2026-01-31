import { useFormContext } from 'react-hook-form';

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
	const {
		register,
		formState,
		getFieldState
	} = useFormContext();

	const { errors, isSubmitted } = formState;

	const cx = (...classes) => classes.filter(Boolean).join(' ');

	const isInvalid = (field) => {
		const { isTouched } = getFieldState(field, formState);
		return (isTouched || isSubmitted) && errors[field];
	};

	const fieldErrors = (field) => {
		const { isTouched } = getFieldState(field, formState);

		if (!isTouched && !isSubmitted) return [];

		const types = errors[field]?.types || {};
		return Object.entries(types).map(([key, message]) => ({
			$uid: `${field}-${key}`,
			$message: message,
		}));
	};

	const showInvalid = showErrors && isInvalid(name);

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
				className={cx(classes, showInvalid ? 'is-invalid' : null)}
				disabled={disabled}
			/>

			{showErrors && fieldErrors(name).map((e) => (
				<div
					key={e.$uid}
					className="invalid-feedback d-block"
				>
					{e.$message}
				</div>
			))}
		</div>
	);
};

export default Textarea;
