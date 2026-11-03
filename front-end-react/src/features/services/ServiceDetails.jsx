import { Link, useParams } from 'react-router';
import { UILoading } from '../../components/common/ui';
import { useServiceDetails } from './hooks/useServiceDetails.js';

const ServiceDetails = () => {
	const { serviceId } = useParams();
	const { service, isLoading, error } = useServiceDetails(serviceId);

	if (isLoading) {
		return <UILoading />;
	}

	if (error || !service) {
		return (
			<div className="container py-5">
				<div className="alert alert-danger" role="alert">
					{error ? `Error loading service: ${error}` : 'This service was not found.'}
				</div>
				<Link to="/services" className="btn btn-outline-primary">Back to services</Link>
			</div>
		);
	}

	return (
		<div className="container py-5">
			<div className="card shadow-sm">
				<div className="card-body p-4">
					<div className="d-flex justify-content-between align-items-start mb-3">
						<h1 className="h2 mb-0">{service.name}</h1>
						{service.category?.name && (
							<span className="badge bg-primary">{service.category.name}</span>
						)}
					</div>

					{service.description && <p className="lead text-muted">{service.description}</p>}

					<div className="d-flex gap-4 mb-4">
						<div>
							<i className="fas fa-clock me-2"></i>
							{service.duration} min
						</div>
						<div className="text-primary fw-bold">{service.price} €</div>
					</div>

					<div className="d-flex gap-2">
						<Link to="/our-team" className="btn btn-primary">Choose a specialist</Link>
						<Link to="/services" className="btn btn-outline-secondary">Back to services</Link>
					</div>
				</div>
			</div>
		</div>
	);
};

export default ServiceDetails;
