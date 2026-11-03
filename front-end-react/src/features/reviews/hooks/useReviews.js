import { useCallback, useEffect, useState } from 'react';
import { notify } from '../../../services';
import * as reviewService from '../services/reviewService';

export const useReviews = (serviceId) => {
	const [reviews, setReviews] = useState([]);
	const [summary, setSummary] = useState({ count: 0, average: 0 });
	const [isLoading, setIsLoading] = useState(true);
	const [error, setError] = useState(null);

	const loadReviews = useCallback(async (isCancelled = () => false) => {
		try {
			setError(null);
			const response = await reviewService.getByService(serviceId);

			if (isCancelled()) return;
			setReviews(response.data);
			setSummary(response.summary ?? { count: response.data.length, average: 0 });
		} catch (err) {
			if (!isCancelled()) setError(err.message);
		} finally {
			if (!isCancelled()) setIsLoading(false);
		}
	}, [serviceId]);

	useEffect(() => {
		let cancelled = false;

		setIsLoading(true);
		loadReviews(() => cancelled);

		return () => {
			cancelled = true;
		};
	}, [loadReviews]);

	const createReview = async (data) => {
		await reviewService.create(serviceId, data);
		notify.success('Review added');
		await loadReviews();
	};

	const updateReview = async (id, data) => {
		await reviewService.update(id, data);
		notify.success('Review updated');
		await loadReviews();
	};

	const deleteReview = async (id) => {
		if (!window.confirm('Are you sure you want to delete your review?')) return;

		try {
			await reviewService.remove(id);
			notify.success('Review deleted');
			await loadReviews();
		} catch {
			console.error('Failed to delete review');
		}
	};

	return {
		reviews,
		summary,
		isLoading,
		error,
		createReview,
		updateReview,
		deleteReview,
	};
};
