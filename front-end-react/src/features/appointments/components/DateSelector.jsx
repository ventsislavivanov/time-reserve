import { useState } from 'react';
import ReactDatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { registerLocale } from 'react-datepicker';
import { bg } from 'date-fns/locale/bg';

registerLocale('bg', bg);

const DateSelector = ({ selectedDate, onSelect }) => {
	const [startDate, setStartDate] = useState(selectedDate ? new Date(selectedDate) : null);

	const handleDateChange = (date) => {
		setStartDate(date);
		// Format as YYYY-MM-DD
		const formatted = date.toISOString().split('T')[0];
		onSelect(formatted);
	};

	const dayOff = (date) => {
		const day = date.getDay();
		return day !== 0; // Disable Sundays
	};

	const tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate() + 1);
	tomorrow.setHours(0, 0, 0, 0)

	const after6Months = new Date(Date.now() + 6 * 30 * 24 * 60 * 60 * 1000);

	return (
		<div className="d-flex justify-content-center">
			<div className="input-group" style={{ maxWidth: '400px' }}>
                <span className="input-group-text">
                    <FontAwesomeIcon icon={['fas', 'calendar']} />
                </span>
				<ReactDatePicker
					selected={startDate}
					onChange={handleDateChange}
					minDate={tomorrow}
					maxDate={after6Months}
					filterDate={dayOff}
					placeholderText="Select a date"
					dateFormat="dd/MM/yyyy"
					locale="bg"
					className="form-control"
					autoComplete="off"
					showMonthDropdown
					showYearDropdown
					dropdownMode="select"
					inline
					showMonthYearDropdown={false}
				/>
			</div>
		</div>
	);
};

export default DateSelector;