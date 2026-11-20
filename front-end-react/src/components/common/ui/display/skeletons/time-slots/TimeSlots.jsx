import { Skeleton } from '@/components/ui/skeleton';

const TimeSlots = ({ slots = 32 }) => {
	return (
		<div className="grid grid-cols-2 gap-2 md:grid-cols-3 lg:grid-cols-4">
			{[...Array(slots)].map((_, index) => (
				<Skeleton key={index} className="h-9" />
			))}
		</div>
	);
};

export default TimeSlots;
