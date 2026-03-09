import WorkerCard from './components/WorkerCard.jsx';
import { SkeletonWorkerCard } from '../../components/common/ui/index.js';
import { useWorkers } from './hooks/useWorkers.js';

const WorkersList = () => {
	const { workers, isLoading, error } = useWorkers();

	if (error) {
		return (
			<div className="container py-5">
				<div className="alert alert-danger" role="alert">
					Error loading workers: {error}
				</div>
			</div>
		);
	}

	return (
		<div className="container py-5">
			<div className="text-center mb-5">
				<h1 className="display-4">Our Team</h1>
				<p className="lead text-muted">Choose your preferred specialist</p>
			</div>

			<div className="row g-4">
				{isLoading ? (
					[...Array(6)].map((_, index) => (
						<div key={index} className="col-md-6 col-lg-4">
							<SkeletonWorkerCard />
						</div>
					))
				) : workers.length === 0 ? (
					<div className="col-12 text-center py-5">
						<i className="fas fa-users fa-4x text-muted mb-3"></i>
						<h3 className="text-muted">No workers available</h3>
						<p>Please check back later.</p>
					</div>
				) : (
					workers.map(worker => (
						<div key={worker.id} className="col-md-6 col-lg-4">
							<WorkerCard worker={worker} />
						</div>
					))
				)}
			</div>
		</div>
	);
};

export default WorkersList;