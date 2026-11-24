import ServiceCard from "./ServiceCard.jsx";

const ServiceSelector = ({ services, selectedService, onSelect }) => {
	if (!services || services.length === 0) {
		return (
			<div className="rounded-lg border px-4 py-3 text-sm border-primary/20 bg-primary/5 text-foreground">
				This worker has no available services.
			</div>
		);
	}

	return (
		<div className="grid grid-cols-12 gap-4">
			{services.map(service => (
				<div key={service.id} className="col-span-12 md:col-span-6">
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