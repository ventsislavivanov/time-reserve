import ServiceCard from "./components/ServiceCard.jsx";
import ServiceFilters from "./components/ServiceFilters.jsx";
import { SkeletonServiceCard } from "../../components/common/ui/index.js";
import { useServicesCatalog } from "./hooks/useServicesCatalog.js";

const ServicesCatalog = () => {
	const {
		services,
		categories,
		selectedCategory,
		setSelectedCategory,
		isLoading
	} = useServicesCatalog();

	return (
		<div className="mx-auto w-full max-w-7xl px-4 py-12">
			<div className="mb-10 text-center">
				<h1 className="text-4xl font-bold">Our services</h1>
				<p className="mt-2 text-lg text-muted-foreground">Choose from our wide range of professional services</p>
			</div>

			<ServiceFilters
				categories={categories}
				selectedCategory={selectedCategory}
				onCategoryChange={setSelectedCategory}
			/>

			{!isLoading && services.length === 0 ? (
				<p className="py-12 text-center text-muted-foreground">No services available in this category.</p>
			) : (
				<div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
					{isLoading
						? [...Array(6)].map((_, index) => <SkeletonServiceCard key={`skeleton-${index}`} />)
						: services.map(service => (
							<ServiceCard
								key={service.id}
								service={service}
								category={categories.find(c => c.id === service.category_id)}
							/>
						))}
				</div>
			)}
		</div>
	);
};

export default ServicesCatalog;
