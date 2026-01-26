import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { UIButton, UICard } from '../../../components/common/ui';

const AddNewJob = ({
	isEditing,
	position,
	setPosition,
	onSubmit,
	onCancel
}) => {
	const handleSubmit = (e) => {
		e.preventDefault();
		onSubmit();
	};

	return (
		<UICard
			variant="primary"
			title={isEditing ? 'Edit Position' : 'Add New Position'}
			headerIcon={<FontAwesomeIcon icon={isEditing ? 'edit' : 'plus-circle'} />}
		>
			<form onSubmit={handleSubmit}>
				<div className="mb-3">
					<label className="form-label fw-bold small">Name</label>
					<input
						type="text"
						className="form-control"
						value={position.name}
						onChange={(e) => setPosition({ ...position, name: e.target.value })}
						required
						placeholder="e.g. Job position"
					/>
				</div>

				<div className="mb-3">
					<label className="form-label fw-bold small">Description</label>
					<textarea
						className="form-control"
						rows="3"
						value={position.description}
						onChange={(e) =>
							setPosition({ ...position, description: e.target.value })
						}
						placeholder="Brief description of the role..."
					/>
				</div>

				<div className="d-grid gap-2">
					<UIButton type="submit">
						{isEditing ? 'Update Position' : 'Save Position'}
					</UIButton>

					{isEditing && (
						<UIButton
							variant="outline-secondary"
							type="button"
							onClick={onCancel}
						>
							Cancel
						</UIButton>
					)}
				</div>
			</form>
		</UICard>
	);
};

export default AddNewJob;
