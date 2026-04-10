import { useNavigate } from "react-router";
import { UICard } from '../../../components/common/ui';

const WorkerCard = ({ worker, user }) => {
	const navigate = useNavigate();

	const handleBooking = () => {
		navigate(`/our-team/book/${worker.id}`);
	};

	return (
		<UICard
			className="h-100 d-flex flex-column"
			bodyClassName="d-flex flex-column flex-grow-1"
		>
			<div className="d-flex align-items-center mb-3">
				<div className="avatar bg-primary text-white rounded-circle me-3"
					 style={{ width: '60px', height: '60px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
					<i className="fas fa-user fa-2x"></i>
				</div>
				<div>
					<h5 className="mb-0">{worker.name}</h5>
					{worker.job_position && (
						<small className="text-muted">{worker.job_position.name}</small>
					)}
				</div>
			</div>

			<div className="mb-3 flex-grow-1">
				<h6 className="text-muted mb-2">Services:</h6>
				{worker.services && worker.services.length > 0 ? (
					<ul className="list-unstyled mb-0">
						{worker.services.slice(0, 3).map(service => (
							<li key={service.id} className="mb-1">
								<i className="fas fa-check-circle text-primary me-2"></i>
								<span>{service.name}</span>
								<span className="badge bg-light text-dark ms-2">
                                    {service.price} € • {service.duration} min
                                </span>
							</li>
						))}
						{worker.services.length > 3 && (
							<li className="text-muted small">
								+{worker.services.length - 3} more services
							</li>
						)}
					</ul>
				) : (
					<p className="text-muted small mb-0">No services available</p>
				)}
			</div>

			<button
				className="btn btn-primary w-100 mt-auto"
				onClick={handleBooking}
			>
				Book Appointment
			</button>
		</UICard>
	);
};

export default WorkerCard;