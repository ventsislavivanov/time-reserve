export const reviewRules = () => {
	return {
		rating: {
			required: 'Rating is required',
			min: { value: 1, message: 'Rating must be between 1 and 5' },
			max: { value: 5, message: 'Rating must be between 1 and 5' },
		},
		comment: {
			required: 'Comment is required',
			minLength: { value: 3, message: 'Comment must be at least 3 characters' },
			maxLength: { value: 1000, message: 'Max 1000 characters' },
			validate: (value) => value.trim().length >= 3 || 'Comment cannot be blank',
		},
	};
};
