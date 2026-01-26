import React from 'react';
import { UILoading, UIButton, UICard } from '../../../components/common/ui';

const JobsList = ({ positions, isLoading, onEdit, onDelete }) => {
	return (
		<UICard title="Job Positions List">
			{isLoading ? (
				<UILoading />
			) : positions.length === 0 ? (
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
						{positions.map((position) => (
							<tr key={position.id}>
								<td className="fw-bold">{position.name}</td>
								<td className="text-muted small">
									{position.description}
								</td>
								<td className="text-end">
									<UIButton
										size="sm"
										variant="outline-primary"
										className="me-2"
										onClick={() => onEdit(position)}
										icon="edit"
									/>
									<UIButton
										size="sm"
										variant="outline-danger"
										onClick={() => onDelete(position.id)}
										icon="trash"
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
