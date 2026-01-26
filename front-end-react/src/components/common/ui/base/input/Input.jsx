import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const Input = ({
	type = 'text',
	label,
	labelClassName = '',
	inputClassName = 'form-control',
	placeholder,
	icon,
	iconClassName = '',
	value,
	onChange,
	positionClassName = "col-md-3",
	...props
}) => {
	return (
		<div className={positionClassName}>
			{label && <label htmlFor={name} className={labelClassName}>{label}</label>}

			<div className="input-group">
				{icon && (
					<span className={iconClassName}>
                        <FontAwesomeIcon icon={icon} />
                    </span>
				)}
				<input
					type={type}
					className={inputClassName}
					placeholder={placeholder}
					value={value}
					onChange={onChange}
					{...props}
				/>
			</div>
		</div>
	);
}

export default Input;