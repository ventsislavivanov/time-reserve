import React from "react";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Controller, useFormContext } from "react-hook-form";
import { registerLocale } from  "react-datepicker";
import { bg } from 'date-fns/locale/bg';
import styles from './FormDatePicker.module.css';

registerLocale('bg', bg);

export default function FormDatePicker({
   name,
   rules,
   label,
   placeholder,
   icon = ['fas', 'calendar']
}) {
	const { control, formState: { errors } } = useFormContext();

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
					render={({ field: { onChange, onBlur, value, ref } }) => (
						<DatePicker
							onChange={onChange}
							onBlur={onBlur}
							selected={value}
							placeholderText={placeholder}
							dateFormat="dd/MM/yyyy"
							locale="bg"
							wrapperClassName={styles.datepickerWrapper}
							className={`form-control ${errors[name] ? 'is-invalid' : ''} ${styles.customInput}`}
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

			{errors[name] && (
				<div className="invalid-feedback d-block">
					{errors[name]?.message}
				</div>
			)}
		</div>
	);
}