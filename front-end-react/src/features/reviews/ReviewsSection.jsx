import { Link } from 'react-router';
import { useAuth } from '../../context';
import { UICard, UILoading } from '../../components/common/ui';
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
		<section className="mt-12">
			<div className="flex justify-between items-center mb-4">
				<h2 className="text-2xl">Reviews</h2>
				{summary.count > 0 && (
					<div>
						<Stars value={summary.average} />
						<span className="ml-2 text-muted-foreground">
							{summary.average} ({summary.count})
						</span>
					</div>
				)}
			</div>

			{isLoading ? (
				<UILoading />
			) : error ? (
				<div className="rounded-lg border px-4 py-3 text-sm border-destructive/30 bg-destructive/10 text-destructive" role="alert">
					Error loading reviews: {error}
				</div>
			) : reviews.length === 0 ? (
				<p className="text-muted-foreground">No reviews yet. Be the first to share your experience!</p>
			) : (
				<ul className="divide-y rounded-xl border bg-card mb-6">
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
					<Link to="/login" className="font-medium text-primary hover:underline">Log in</Link> to leave a review.
				</p>
			)}

			{isClient && !hasReviewed && !isLoading && !error && (
				<UICard>
						<h3 className="mb-4">Leave a review</h3>
						<ReviewForm submitLabel="Submit review" onSubmit={createReview} />
					</UICard>
			)}
		</section>
	);
};

export default ReviewsSection;
