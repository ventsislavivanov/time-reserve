import { UIButton } from "../../../components/common/ui";

const ServiceFilters = ({ categories, selectedCategory, onCategoryChange }) => {
	const options = [
		{ id: 'all', name: 'All services' },
		...categories.map(c => ({ id: c.id.toString(), name: c.name })),
	];

	return (
		<div className="mb-8 flex flex-wrap justify-center gap-2" role="group">
			{options.map(option => (
				<UIButton
					key={option.id}
					size="sm"
					className="rounded-full"
					variant={selectedCategory === option.id ? 'primary' : 'outline'}
					onClick={() => onCategoryChange(option.id)}
				>
					{option.name}
				</UIButton>
			))}
		</div>
	);
};

export default ServiceFilters;
