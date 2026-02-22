import ServiceCard from "./ServiceCard";
import ServiceFilters from "./ServiceFilters";
import { SkeletonServiceCard } from "../../../components/common/ui";
import { useServicesCatalog } from "../hooks/useServicesCatalog";

const ServicesCatalog = () => {
	const {
		services,
		categories,
		selectedCategory,
		setSelectedCategory,
		isLoading
	} = useServicesCatalog();

	return (
		<div className="container py-5">
			<div className="text-center mb-5">
				<h1 className="display-4">Our Services</h1>
				<p className="lead text-muted">Choose from our wide range of professional services</p>
			</div>

			<ServiceFilters
				categories={categories}
				selectedCategory={selectedCategory}
				onCategoryChange={setSelectedCategory}
			/>

			<div className="row g-4">
				{isLoading ? (
						[...Array(6)].map((_, index) => (
							<div key={`skeleton-${index}`} className="col-md-6 col-lg-4">
								<SkeletonServiceCard />
							</div>
						))
					) : services.length === 0 ? (
					<div className="col-12 text-center py-5">
						<p className="text-muted">No services available in this category.</p>
					</div>
				) : (
					services.map(service => (
						<div key={service.id} className="col-md-6 col-lg-4">
							<ServiceCard
								service={service}
								category={categories.find(c => c.id === service.category_id)}
							/>
						</div>
					))
				)}
			</div>
		</div>
	);
};

export default ServicesCatalog;