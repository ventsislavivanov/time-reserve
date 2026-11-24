import { CalendarX } from "lucide-react";
import { UIButton } from "../../../../components/common/ui";

const TimeSlotsSelector = ({ slots, selectedSlot, onSelect }) => {
	if (!slots || slots.length === 0) {
		return (
			<div className="flex flex-col items-center gap-2 rounded-lg border border-warning/40 bg-warning/15 px-4 py-6 text-center text-sm">
				<CalendarX className="size-6" />
				<p>No available slots for this date. Please select another date.</p>
			</div>
		);
	}

	return (
		<div className="grid grid-cols-3 gap-2 lg:grid-cols-4">
			{slots.map((slot, index) => (
				<UIButton
					key={index}
					variant={selectedSlot?.time === slot.time ? 'primary' : 'outline-primary'}
					onClick={() => onSelect(slot)}
				>
					{slot.time}
				</UIButton>
			))}
		</div>
	);
};

export default TimeSlotsSelector;
