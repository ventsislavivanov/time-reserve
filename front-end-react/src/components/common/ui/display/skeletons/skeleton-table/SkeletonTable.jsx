import { Skeleton } from '@/components/ui/skeleton';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table';

const SkeletonTable = ({ rows = 5, columns = 5, compact = false }) => {
	const randomWidth = () => `${Math.floor(50 + Math.random() * 40)}%`;

	return (
		<Table>
			<TableHeader>
				<TableRow>
					{[...Array(columns)].map((_, i) => (
						<TableHead key={i}>
							<Skeleton className="h-4" style={{ width: randomWidth() }} />
						</TableHead>
					))}
				</TableRow>
			</TableHeader>

			<TableBody>
				{[...Array(rows)].map((_, rowIndex) => (
					<TableRow key={rowIndex}>
						{[...Array(columns)].map((_, colIndex) => (
							<TableCell key={colIndex} className={compact ? 'py-1.5' : undefined}>
								<Skeleton className={compact ? 'h-3' : 'h-4'} style={{ width: randomWidth() }} />
							</TableCell>
						))}
					</TableRow>
				))}
			</TableBody>
		</Table>
	);
};

export default SkeletonTable;
