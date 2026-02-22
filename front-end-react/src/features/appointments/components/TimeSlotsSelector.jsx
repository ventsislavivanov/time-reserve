const TimeSlotsSelector = ({ slots, selectedSlot, onSelect }) => {
	if (!slots || slots.length === 0) {
		return (
			<div className="alert alert-warning text-center">
				<i className="fas fa-calendar-times fa-2x mb-3"></i>
				<p className="mb-0">No available slots for this date. Please select another date.</p>
			</div>
		);
	}

	return (
		<div className="row g-2">
			{slots.map((slot, index) => (
				<div key={index} className="col-6 col-md-4 col-lg-3">
					<button
						className={`btn w-100 ${
							selectedSlot?.time === slot.time
								? 'btn-primary'
								: 'btn-outline-primary'
						}`}
						onClick={() => onSelect(slot)}
					>
						{slot.time}
					</button>
				</div>
			))}
		</div>
	);
};

export default TimeSlotsSelector;