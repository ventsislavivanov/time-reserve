const UIStepper = ({ steps, currentStep }) => {
	return (
		<div className="mb-4">
			<div className="d-flex justify-content-between align-items-start">
				{steps.map((s, index) => (
					<div key={s.id} className="d-flex flex-column align-items-center flex-grow-1" style={{ position: 'relative' }}>
						{index < steps.length - 1 && (
							<div
								className={`position-absolute ${currentStep > s.id ? 'bg-primary' : 'bg-light'}`}
								style={{
									height: '2px',
									width: '100%',
									top: '20px',
									left: '50%',
									zIndex: 0
								}}
							/>
						)}

						<div
							className={`rounded-circle d-flex align-items-center justify-content-center mb-2 ${
								currentStep >= s.id ? 'bg-primary text-white' : 'bg-light text-muted'
							}`}
							style={{ width: '40px', height: '40px', zIndex: 1, position: 'relative' }}
						>
							{s.id}
						</div>

						<small className={`text-center ${currentStep >= s.id ? 'text-primary fw-bold' : 'text-muted'}`}
							   style={{ fontSize: '0.8rem' }}
						>
							{s.label}
						</small>
					</div>
				))}
			</div>
		</div>
	);
};

export default UIStepper;