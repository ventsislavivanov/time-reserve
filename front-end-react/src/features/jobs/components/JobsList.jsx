import { UILoading, UICard, UIRowActions } from '../../../components/common/ui';

const JobsList = ({ jobs, isLoading, onEdit, onDelete }) => {
	return (
		<UICard
			variant="primary"
			title="Job Positions List"
			headerIcon="clipboard-list"
		>
			{isLoading ? (
				<UILoading />
			) : jobs.length === 0 ? (
				<p className="text-center text-muted py-4">
					No job positions found. Create one to get started.
				</p>
			) : (
				<div className="table-responsive">
					<table className="table table-hover align-middle mb-0">
						<thead className="table-light">
						<tr>
							<th>Name</th>
							<th>Description</th>
							<th className="text-end pe-3">Actions</th>
						</tr>
						</thead>
						<tbody>
						{jobs.map((job) => (
							<tr key={job.id}>
								<td className="fw-bold">{job.name}</td>
								<td className="text-muted small">
									{job.description}
								</td>
								<td className="text-end">
									<UIRowActions
										actions={[
											{
												icon: "edit",
												iconClassName: "text-warning",
												variant: "outline-warning",
												onClick: () => onEdit(job),
												title: "Edit"
											},
											{
												icon: "trash",
												iconClassName: "text-danger",
												variant: "outline-danger",
												onClick: () => onDelete(job.id),
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

export default JobsList;
