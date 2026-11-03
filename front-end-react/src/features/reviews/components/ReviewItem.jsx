import { useState } from 'react';
import ReviewForm from './ReviewForm.jsx';

export const Stars = ({ value }) => (
	<span className="text-warning" aria-label={`${value} out of 5`}>
		{'★'.repeat(Math.round(value))}
		<span className="text-muted">{'★'.repeat(5 - Math.round(value))}</span>
	</span>
);

const ReviewItem = ({ review, isAuthor, onUpdate, onDelete }) => {
	const [isEditing, setIsEditing] = useState(false);

	const handleUpdate = async (data) => {
		await onUpdate(review.id, data);
		setIsEditing(false);
	};

	return (
		<li className="list-group-item">
			<div className="d-flex justify-content-between align-items-start">
				<div>
					<strong>{review.author_name}</strong>
					<div><Stars value={review.rating} /></div>
				</div>
				<small className="text-muted">{review.created_at?.slice(0, 10)}</small>
			</div>

			{isEditing ? (
				<div className="mt-3">
					<ReviewForm
						initialValues={{ rating: review.rating, comment: review.comment }}
						submitLabel="Save"
						onSubmit={handleUpdate}
						onCancel={() => setIsEditing(false)}
					/>
				</div>
			) : (
				<>
					<p className="mb-2 mt-2" style={{ whiteSpace: 'pre-wrap' }}>{review.comment}</p>

					{isAuthor && (
						<div className="d-flex gap-2">
							<button className="btn btn-sm btn-outline-primary" onClick={() => setIsEditing(true)}>
								Edit
							</button>
							<button className="btn btn-sm btn-outline-danger" onClick={() => onDelete(review.id)}>
								Delete
							</button>
						</div>
					)}
				</>
			)}
		</li>
	);
};

export default ReviewItem;
