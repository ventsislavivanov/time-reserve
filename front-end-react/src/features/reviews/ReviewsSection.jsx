import { Link } from 'react-router';
import { useAuth } from '../../context';
import { UILoading } from '../../components/common/ui';
import { useReviews } from './hooks/useReviews.js';
import ReviewForm from './components/ReviewForm.jsx';
import ReviewItem, { Stars } from './components/ReviewItem.jsx';

const ReviewsSection = ({ serviceId }) => {
	const { user, isAuthenticated } = useAuth();
	const {
		reviews,
		summary,
		isLoading,
		error,
		createReview,
		updateReview,
		deleteReview,
	} = useReviews(serviceId);

	const isClient = isAuthenticated && user?.role === 'client';
	const hasReviewed = isClient && reviews.some(r => r.user_id === Number(user.uid));

	return (
		<section className="mt-5">
			<div className="d-flex justify-content-between align-items-center mb-3">
				<h2 className="h4 mb-0">Reviews</h2>
				{summary.count > 0 && (
					<div>
						<Stars value={summary.average} />
						<span className="ms-2 text-muted">
							{summary.average} ({summary.count})
						</span>
					</div>
				)}
			</div>

			{isLoading ? (
				<UILoading />
			) : error ? (
				<div className="alert alert-danger" role="alert">
					Error loading reviews: {error}
				</div>
			) : reviews.length === 0 ? (
				<p className="text-muted">No reviews yet. Be the first to share your experience!</p>
			) : (
				<ul className="list-group mb-4">
					{reviews.map(review => (
						<ReviewItem
							key={review.id}
							review={review}
							isAuthor={isAuthenticated && review.user_id === Number(user.uid)}
							onUpdate={updateReview}
							onDelete={deleteReview}
						/>
					))}
				</ul>
			)}

			{!isAuthenticated && (
				<p>
					<Link to="/login">Log in</Link> to leave a review.
				</p>
			)}

			{isClient && !hasReviewed && !isLoading && !error && (
				<div className="card">
					<div className="card-body">
						<h3 className="h5 mb-3">Leave a review</h3>
						<ReviewForm submitLabel="Submit review" onSubmit={createReview} />
					</div>
				</div>
			)}
		</section>
	);
};

export default ReviewsSection;
