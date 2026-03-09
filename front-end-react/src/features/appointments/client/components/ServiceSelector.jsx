import ServiceCard from "./ServiceCard.jsx";

const ServiceSelector = ({ services, selectedService, onSelect }) => {
	if (!services || services.length === 0) {
		return (
			<div className="alert alert-info">
				This worker has no available services.
			</div>
		);
	}

	return (
		<div className="row g-3">
			{services.map(service => (
				<div key={service.id} className="col-md-6">
					<ServiceCard
						service={service}
						isSelected={selectedService?.id === service.id}
						onSelect={onSelect}
					/>
				</div>
			))}
		</div>
	);
};

export default ServiceSelector;