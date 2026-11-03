import { Link, useNavigate, useParams } from 'react-router';
import { UILoading } from '../../components/common/ui';
import { useWorker } from './hooks/useWorker.js';

const WorkerDetails = () => {
	const { workerId } = useParams();
	const navigate = useNavigate();
	const { worker, isLoading, error } = useWorker(workerId);

	if (isLoading) {
		return <UILoading />;
	}

	if (error || !worker) {
		return (
			<div className="container py-5">
				<div className="alert alert-danger" role="alert">
					{error && error !== 'not-found'
						? `Error loading team member: ${error}`
						: 'This team member was not found.'}
				</div>
				<Link to="/our-team" className="btn btn-outline-primary">Back to our team</Link>
			</div>
		);
	}

	return (
		<div className="container py-5">
			<div className="card shadow-sm">
				<div className="card-body p-4">
					<div className="d-flex align-items-center mb-4">
						<div
							className="bg-primary text-white rounded-circle me-3 d-flex align-items-center justify-content-center"
							style={{ width: '80px', height: '80px' }}
						>
							<i className="fas fa-user fa-3x"></i>
						</div>
						<div>
							<h1 className="h2 mb-0">{worker.name}</h1>
							{worker.job_position && (
								<p className="text-muted mb-0">{worker.job_position.name}</p>
							)}
						</div>
					</div>

					<h2 className="h5 text-muted mb-3">Services</h2>
					{worker.services && worker.services.length > 0 ? (
						<ul className="list-group mb-4">
							{worker.services.map(service => (
								<li
									key={service.id}
									className="list-group-item d-flex justify-content-between align-items-center"
								>
									<Link to={`/services/${service.id}`}>{service.name}</Link>
									<span className="badge bg-light text-dark">
										{service.price} € • {service.duration} min
									</span>
								</li>
							))}
						</ul>
					) : (
						<p className="text-muted">No services available.</p>
					)}

					<div className="d-flex gap-2">
						<button
							className="btn btn-primary"
							onClick={() => navigate(`/our-team/book/${worker.id}`)}
						>
							Book Appointment
						</button>
						<Link to="/our-team" className="btn btn-outline-secondary">Back to our team</Link>
					</div>
				</div>
			</div>
		</div>
	);
};

export default WorkerDetails;
