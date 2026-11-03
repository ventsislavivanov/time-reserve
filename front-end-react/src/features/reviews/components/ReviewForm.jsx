import { UIAppForm, UISelect, UITextarea, UIButton } from '../../../components/common/ui';
import { useAppForm } from '../../../hooks';
import { reviewRules } from '../validations/reviewRules.js';

const ratingOptions = [
	{ id: 5, name: '5 - Excellent' },
	{ id: 4, name: '4 - Good' },
	{ id: 3, name: '3 - Average' },
	{ id: 2, name: '2 - Poor' },
	{ id: 1, name: '1 - Terrible' },
];

const ReviewForm = ({ initialValues, submitLabel, onSubmit, onCancel }) => {
	const methods = useAppForm({
		defaultValues: initialValues ?? { rating: '', comment: '' },
	});

	const rules = reviewRules();

	const handleSubmit = async (data) => {
		await onSubmit({ rating: Number(data.rating), comment: data.comment.trim() });

		if (!initialValues) {
			methods.reset({ rating: '', comment: '' });
		}
	};

	return (
		<UIAppForm methods={methods} onSubmit={handleSubmit}>
			<UISelect
				name="rating"
				label="Rating"
				placeholder="Select rating..."
				options={ratingOptions}
				rules={rules.rating}
			/>

			<UITextarea
				name="comment"
				label="Your review"
				placeholder="Share your experience..."
				rows={3}
				rules={rules.comment}
			/>

			<div className="d-flex gap-2">
				<UIButton type="submit" isLoading={methods.isLoading}>
					{submitLabel}
				</UIButton>
				{onCancel && (
					<button type="button" className="btn btn-outline-secondary" onClick={onCancel}>
						Cancel
					</button>
				)}
			</div>
		</UIAppForm>
	);
};

export default ReviewForm;
