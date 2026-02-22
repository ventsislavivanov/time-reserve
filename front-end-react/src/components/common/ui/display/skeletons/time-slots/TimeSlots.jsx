const TimeSlots = ({ slots = 32 }) => {
	return (
		<div className="row g-2">
			{[...Array(slots)].map((_, index) => (
				<div key={index} className="col-6 col-md-4 col-lg-3">
					<div className="placeholder-glow">
                        <span className="placeholder col-12 btn btn-outline-primary disabled"
							  style={{ height: '38px' }}>
                        </span>
					</div>
				</div>
			))}
		</div>
	);
};

export default TimeSlots;