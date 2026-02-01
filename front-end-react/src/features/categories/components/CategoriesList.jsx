import { UILoading, UICard, UIRowActions } from '../../../components/common/ui';

const CategoriesList = ({ categories, isLoading, onEdit, onDelete }) => {
	return (
		<UICard
			variant="primary"
			title="Categories List"
			headerIcon="clipboard-list"
		>
			{isLoading ? (
				<UILoading />
			) : categories.length === 0 ? (
				<p className="text-center text-muted py-4">
					No categories found. Create one to get started.
				</p>
			) : (
				<div className="table-responsive">
					<table className="table table-hover align-middle mb-0">
						<thead className="table-light">
						<tr>
							<th>Name</th>
							<th className="text-end pe-3">Actions</th>
						</tr>
						</thead>
						<tbody>
						{categories.map((category) => (
							<tr key={category.id}>
								<td className="fw-bold">{category.name}</td>
									<td className="text-end">
									<UIRowActions
										actions={[
											{
												icon: "edit",
												iconClassName: "text-warning",
												variant: "outline-warning",
												onClick: () => onEdit(category),
												title: "Edit"
											},
											{
												icon: "trash",
												iconClassName: "text-danger",
												variant: "outline-danger",
												onClick: () => onDelete(category.id),
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

export default CategoriesList;
