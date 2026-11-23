import { Users } from 'lucide-react';
import WorkerCard from './components/WorkerCard.jsx';
import { SkeletonWorkerCard } from '../../components/common/ui/index.js';
import { useWorkers } from './hooks/useWorkers.js';

const WorkersList = () => {
	const { workers, isLoading, error } = useWorkers();

	if (error) {
		return (
			<div className="mx-auto w-full max-w-7xl px-4 py-12">
				<div className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-3 text-sm text-destructive" role="alert">
					Error loading workers: {error}
				</div>
			</div>
		);
	}

	return (
		<div className="mx-auto w-full max-w-7xl px-4 py-12">
			<div className="mb-10 text-center">
				<h1 className="text-4xl font-bold">Our team</h1>
				<p className="mt-2 text-lg text-muted-foreground">Choose your preferred specialist</p>
			</div>

			{!isLoading && workers.length === 0 ? (
				<div className="flex flex-col items-center py-12 text-center">
					<Users className="mb-4 size-12 text-muted-foreground" />
					<h3 className="text-muted-foreground">No workers available</h3>
					<p className="text-sm text-muted-foreground">Please check back later.</p>
				</div>
			) : (
				<div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
					{isLoading
						? [...Array(6)].map((_, index) => <SkeletonWorkerCard key={index} />)
						: workers.map(worker => <WorkerCard key={worker.id} worker={worker} />)}
				</div>
			)}
		</div>
	);
};

export default WorkersList;
