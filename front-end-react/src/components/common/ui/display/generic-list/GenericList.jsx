import { UICard, UIRowActions } from '../../index.js';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table';
import { cn } from '@/lib/utils';

const GenericList = ({
	items,
	onEdit,
	onDelete,
	title,
	columns,
	emptyMessage
}) => {
	return (
		<UICard
			title={title}
			headerIcon="clipboard-list"
			bodyClassName="p-0"
		>
			{items.length === 0 ? (
				<p className="py-10 text-center text-muted-foreground">
					{emptyMessage}
				</p>
			) : (
				<Table>
					<TableHeader className="bg-muted/40">
						<TableRow>
							{columns.map(col => (
								<TableHead key={col.key}>{col.label}</TableHead>
							))}
							<TableHead className="pr-4 text-right">Actions</TableHead>
						</TableRow>
					</TableHeader>
					<TableBody>
						{items.map((item) => (
							<TableRow key={item.id}>
								{columns.map(col => (
									<TableCell key={col.key} className={cn(col.className)}>
										{col.render ? col.render(item[col.key]) : item[col.key]}
									</TableCell>
								))}
								<TableCell className="pr-4 text-right">
									<UIRowActions
										actions={[
											{
												icon: "edit",
												variant: "outline-warning",
												onClick: () => onEdit(item),
												title: "Edit"
											},
											{
												icon: "trash",
												variant: "outline-danger",
												onClick: () => onDelete(item.id),
												title: "Delete"
											}
										]}
									/>
								</TableCell>
							</TableRow>
						))}
					</TableBody>
				</Table>
			)}
		</UICard>
	);
};

export default GenericList;
