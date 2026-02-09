import { UICard } from '../../../components/common/ui';

const ServiceCard = ({ service, category }) => {
	return (
		<UICard className="h-100 shadow-sm hover-shadow transition">
			<div
				className="card-img-top bg-gradient"
				style={{
					height: '200px',
					background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
					display: 'flex',
					alignItems: 'center',
					justifyContent: 'center'
				}}
			>
				<i className="fas fa-spa fa-3x text-white opacity-50"></i>
			</div>

			<div className="card-body">
				<div className="d-flex justify-content-between align-items-start mb-2">
					<h5 className="card-title mb-0">{service.name}</h5>
					<span className="badge bg-primary">{category?.name}</span>
				</div>

				{service.description && (
					<p className="card-text text-muted small mb-3">
						{service.description}
					</p>
				)}

				<div className="d-flex justify-content-between align-items-center">
					<div>
						<i className="fas fa-clock me-1"></i>
						<small>{service.duration} min</small>
					</div>
					<div className="text-end">
						<h6 className="mb-0 text-primary">{service.price} €</h6>
					</div>
				</div>
			</div>
		</UICard>
	);
};

export default ServiceCard;