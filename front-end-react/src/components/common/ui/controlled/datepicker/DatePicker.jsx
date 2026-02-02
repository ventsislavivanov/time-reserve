import ReactDatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Controller, useFormContext } from "react-hook-form";
import { registerLocale } from  "react-datepicker";
import { bg } from 'date-fns/locale/bg';
import { useFieldError } from "../../../../../hooks";
import styles from './DatePicker.module.css';

registerLocale('bg', bg);

const DatePicker = ({
	name,
	rules,
	label,
	placeholder,
	icon = ['fas', 'calendar'],
	showErrors = true,
}) => {
	const { control } = useFormContext();
	const { isInvalid, errorMessages } = useFieldError(name, showErrors);

	return (
		<div className="form-group mb-3">
			{label && <label htmlFor={name} className="control-label">{label}</label>}

			<div className="input-group">
				{icon && (
					<span className="input-group-text">
                        <FontAwesomeIcon icon={icon} />
                    </span>
				)}

				<Controller
					control={control}
					name={name}
					rules={rules}
					render={({ field: { onChange, onBlur, value } }) => (
						<ReactDatePicker
							onChange={onChange}
							onBlur={onBlur}
							selected={value}
							placeholderText={placeholder}
							dateFormat="dd/MM/yyyy"
							locale="bg"
							wrapperClassName={styles.datepickerWrapper}
							className={`form-control ${isInvalid ? 'is-invalid' : ''} ${styles.customInput}`}
							autoComplete="off"
							showMonthDropdown
							showYearDropdown
							dropdownMode="select"
							yearDropdownItemNumber={100}
							scrollableYearDropdown
							showMonthYearDropdown={false}
						/>
					)}
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

export default DatePicker;