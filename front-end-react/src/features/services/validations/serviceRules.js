export const serviceRules = () => {
	return {
		name: { required: 'Name is required' },
		description: {
			maxLength: { value: 5000, message: 'Max 5000 characters' }
		},
	};
}