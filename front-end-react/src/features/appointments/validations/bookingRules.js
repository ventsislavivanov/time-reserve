export const bookingRules = () => {
	return {
		worker_id: {
			required: 'Please select a worker'
		},
		service_id: {
			required: 'Please select a service'
		},
		starts_at: {
			required: 'Please select date and time'
		},
		notes: {
			maxLength: { value: 500, message: 'Max 500 characters' }
		}
	};
};