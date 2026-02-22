const WorkerCard = () => {
	return (
		<div className="card h-100 shadow-sm">
			<div className="card-body">
				<div className="d-flex align-items-center mb-3">
					<div className="placeholder-glow me-3">
						<div className="rounded-circle bg-secondary"
							 style={{ width: '60px', height: '60px' }}>
						</div>
					</div>
					<div className="flex-grow-1">
						<div className="placeholder-glow">
							<span className="placeholder col-6"></span>
						</div>
						<div className="placeholder-glow">
							<span className="placeholder col-4"></span>
						</div>
					</div>
				</div>

				<div className="mb-3">
					<div className="placeholder-glow mb-2">
						<span className="placeholder col-3"></span>
					</div>
					<div className="placeholder-glow">
						<span className="placeholder col-12 mb-1"></span>
						<span className="placeholder col-10 mb-1"></span>
						<span className="placeholder col-11"></span>
					</div>
				</div>

				<div className="placeholder-glow">
					<span className="placeholder col-12 btn btn-primary disabled"></span>
				</div>
			</div>
		</div>
	);
};

export default WorkerCard;