const WizardServiceCard = () => {
	return (
		<div
			style={{
				borderRadius: '0.75rem',
				border: '2px solid #e9ecef',
				backgroundColor: '#fff',
				padding: '1rem',
			}}
		>
			<div className="d-flex justify-content-between align-items-start">
				<div className="flex-grow-1">

					<div className="placeholder-glow mb-2">
						<span className="placeholder col-7" style={{ borderRadius: '4px', height: '20px', display: 'block' }}></span>
					</div>

					<div className="placeholder-glow mb-2">
						<span
							className="placeholder col-3"
							style={{ borderRadius: '4px', height: '20px', display: 'inline-block', backgroundColor: '#e9ecef' }}
						></span>
					</div>

					<div className="placeholder-glow mb-2">
						<span className="placeholder col-12" style={{ borderRadius: '4px', height: '14px', display: 'block', marginBottom: '4px' }}></span>
						<span className="placeholder col-9" style={{ borderRadius: '4px', height: '14px', display: 'block' }}></span>
					</div>

					<div className="placeholder-glow d-flex gap-3">
						<span className="placeholder col-3" style={{ borderRadius: '4px', height: '14px', display: 'block' }}></span>
						<span className="placeholder col-2" style={{ borderRadius: '4px', height: '14px', display: 'block' }}></span>
					</div>
				</div>

				<div
					style={{
						width: '22px',
						height: '22px',
						borderRadius: '50%',
						border: '2px solid #e9ecef',
						backgroundColor: '#f8f9fa',
						flexShrink: 0,
						marginLeft: '0.75rem',
					}}
				/>
			</div>
		</div>
	);
};

export default WizardServiceCard;