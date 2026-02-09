export const serviceRules = () => {
	return {
		name: { required: 'Name is required' },
		description: {
			maxLength: { value: 5000, message: 'Max 5000 characters' }
		},
		category_id: {
			required: 'Category is required'
		},
		duration: {
			required: 'Duration is required',
			min: { value: 1, message: 'Duration must be at least 1 minute' },
			max: { value: 1440, message: 'Duration cannot exceed 1440 minutes (24 hours)' }
		},
		price: {
			required: 'Price is required',
			min: { value: 0, message: 'Price cannot be negative' },
			max: { value: 999999, message: 'Price is too high' }
		},
		preparation_time: {
			min: { value: 0, message: 'Preparation time cannot be negative' },
			max: { value: 480, message: 'Preparation time cannot exceed 480 minutes (8 hours)' }
		},
		cleanup_time: {
			min: { value: 0, message: 'Cleanup time cannot be negative' },
			max: { value: 480, message: 'Cleanup time cannot exceed 480 minutes (8 hours)' }
		},
	};
}