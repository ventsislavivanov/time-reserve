const ServiceFilters = ({ categories, selectedCategory, onCategoryChange }) => {
	return (
		<div className="mb-4">
			<div className="btn-group flex-wrap" role="group">
				<button
					type="button"
					className={`btn ${selectedCategory === 'all' ? 'btn-primary' : 'btn-outline-primary'}`}
					onClick={() => onCategoryChange('all')}
				>
					All Services
				</button>
				{categories.map(category => (
					<button
						key={category.id}
						type="button"
						className={`btn ${selectedCategory === category.id.toString() ? 'btn-primary' : 'btn-outline-primary'}`}
						onClick={() => onCategoryChange(category.id.toString())}
					>
						{category.name}
					</button>
				))}
			</div>
		</div>
	);
};

export default ServiceFilters;