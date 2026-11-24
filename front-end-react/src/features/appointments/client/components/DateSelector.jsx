import { bg } from 'react-day-picker/locale';
import { Calendar } from '@/components/ui/calendar';

const DateSelector = ({ selectedDate, onSelect }) => {
	const selected = selectedDate ? new Date(`${selectedDate}T00:00:00`) : undefined;

	const handleDateChange = (date) => {
		if (!date) return;
		// Format as YYYY-MM-DD
		onSelect(date.toLocaleDateString('en-CA'));
	};

	const tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate() + 1);
	tomorrow.setHours(0, 0, 0, 0);

	const after6Months = new Date(Date.now() + 6 * 30 * 24 * 60 * 60 * 1000);

	return (
		<div className="flex justify-center">
			<Calendar
				mode="single"
				locale={bg}
				selected={selected}
				defaultMonth={selected ?? tomorrow}
				onSelect={handleDateChange}
				disabled={[
					{ before: tomorrow },
					{ after: after6Months },
					{ dayOfWeek: [0] }, // Sundays are days off
				]}
				className="rounded-xl border"
			/>
		</div>
	);
};

export default DateSelector;
