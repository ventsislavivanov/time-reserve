import { useState } from 'react';
import { UIButton } from "../../../components/common/ui";
import ReviewForm from './ReviewForm.jsx';

export const Stars = ({ value }) => (
	<span className="text-warning" aria-label={`${value} out of 5`}>
		{'★'.repeat(Math.round(value))}
		<span className="text-muted-foreground">{'★'.repeat(5 - Math.round(value))}</span>
	</span>
);

const ReviewItem = ({ review, isAuthor, onUpdate, onDelete }) => {
	const [isEditing, setIsEditing] = useState(false);

	const handleUpdate = async (data) => {
		await onUpdate(review.id, data);
		setIsEditing(false);
	};

	return (
		<li className="px-4 py-3">
			<div className="flex justify-between items-start">
				<div>
					<strong>{review.author_name}</strong>
					<div><Stars value={review.rating} /></div>
				</div>
				<small className="text-xs text-muted-foreground">{review.created_at?.slice(0, 10)}</small>
			</div>

			{isEditing ? (
				<div className="mt-4">
					<ReviewForm
						initialValues={{ rating: review.rating, comment: review.comment }}
						submitLabel="Save"
						onSubmit={handleUpdate}
						onCancel={() => setIsEditing(false)}
					/>
				</div>
			) : (
				<>
					<p className="mb-2 mt-2" style={{ whiteSpace: "pre-wrap" }}>{review.comment}</p>

					{isAuthor && (
						<div className="flex gap-2">
							<UIButton size="sm" variant="outline-primary" onClick={() => setIsEditing(true)}>Edit</UIButton>
							<UIButton size="sm" variant="outline-danger" onClick={() => onDelete(review.id)}>Delete</UIButton>
						</div>
					)}
				</>
			)}
		</li>
	);
};

export default ReviewItem;
