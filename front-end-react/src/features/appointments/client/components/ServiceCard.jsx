import { useState } from "react";

const ServiceCard = ({ service, isSelected, onSelect }) => {
	const [expanded, setExpanded] = useState(false);

	const handleToggle = (e) => {
		e.stopPropagation();
		setExpanded(prev => !prev);
	};

	return (
		<div
			onClick={() => onSelect(service)}
			style={{
				cursor: 'pointer',
				borderRadius: '0.75rem',
				border: isSelected ? '2px solid #0d6efd' : '2px solid #e9ecef',
				backgroundColor: isSelected ? '#f0f5ff' : '#fff',
				transition: 'border-color 0.15s ease, background-color 0.15s ease',
				padding: '1rem',
			}}
		>
			<div className="d-flex justify-content-between align-items-start">
				<div className="flex-grow-1">
					<h5
						className="mb-1"
						style={{ color: isSelected ? '#0d6efd' : 'inherit' }}
					>
						{service.name}
					</h5>
					{service.category && (
						<span className="badge bg-light text-dark mb-2">
							{service.category.name}
						</span>
					)}
					{service.description && (
						<div className="mb-2">
							<p
								className="text-muted small mb-0"
								style={
									expanded
										? undefined
										: {
											display: '-webkit-box',
											WebkitLineClamp: 3,
											WebkitBoxOrient: 'vertical',
											overflow: 'hidden',
										}
								}
							>
								{service.description}
							</p>
							<button
								onClick={handleToggle}
								className="btn btn-link btn-sm p-0 text-primary"
								style={{ fontSize: '0.75rem', textDecoration: 'none' }}
							>
								{expanded ? 'Show less' : 'Read more'}
							</button>
						</div>
					)}
					<div className="d-flex gap-3 text-muted small">
						<span>
							<i className="fas fa-clock me-1"></i>
							{service.duration} min
						</span>
						<span className="fw-bold text-primary">
							{service.price} €
						</span>
					</div>
				</div>
				<div
					style={{
						width: '22px',
						height: '22px',
						borderRadius: '50%',
						border: isSelected ? '2px solid #0d6efd' : '2px solid #ced4da',
						backgroundColor: isSelected ? '#0d6efd' : 'transparent',
						flexShrink: 0,
						marginLeft: '0.75rem',
						display: 'flex',
						alignItems: 'center',
						justifyContent: 'center',
						transition: 'all 0.15s ease',
					}}
				>
					{isSelected && (
						<i className="fas fa-check text-white" style={{ fontSize: '11px' }}></i>
					)}
				</div>
			</div>
		</div>
	);
}

export default ServiceCard;