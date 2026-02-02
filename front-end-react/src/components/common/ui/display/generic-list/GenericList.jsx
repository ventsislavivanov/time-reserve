import { UICard, UIRowActions } from '../../index.js';

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
			variant="primary"
			title={title}
			headerIcon="clipboard-list"
		>
			{items.length === 0 ? (
				<p className="text-center text-muted py-4">
					{emptyMessage}
				</p>
			) : (
				<div className="table-responsive">
					<table className="table table-hover align-middle mb-0">
						<thead className="table-light">
						<tr>
							{columns.map(col => (
								<th key={col.key}>{col.label}</th>
							))}
							<th className="text-end pe-3">Actions</th>
						</tr>
						</thead>
						<tbody>
						{items.map((item) => (
							<tr key={item.id}>
								{columns.map(col => (
									<td
										key={col.key}
										className={col.className}
									>
										{col.render ? col.render(item[col.key]) : item[col.key]}
									</td>
								))}
								<td className="text-end">
									<UIRowActions
										actions={[
											{
												icon: "edit",
												iconClassName: "text-warning",
												variant: "outline-warning",
												onClick: () => onEdit(item),
												title: "Edit"
											},
											{
												icon: "trash",
												iconClassName: "text-danger",
												variant: "outline-danger",
												onClick: () => onDelete(item.id),
												title: "Delete"
											}
										]}
									/>
								</td>
							</tr>
						))}
						</tbody>
					</table>
				</div>
			)}
		</UICard>
	);
};

export default GenericList;