export const jobRules = () => {
	return {
		name: { required: 'Name is required' },
		description: {
			maxLength: { value: 500, message: 'Max 500 characters' }
		},
	};
}