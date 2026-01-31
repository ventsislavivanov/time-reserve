export const signUpRules = ({ getValues }) => {
	return {
		name: {
			required: 'Full name is required',
			pattern: {
				value: /^[A-Z][a-z]+ [A-Z][a-z]+$/,
				message:
					'Field must contain two names (letters only) separated by a space. Both should start with a capital letter',
			},
		},
		email: {
			required: 'Email is required',
			minLength: { value: 8, message: 'Email must be at least 8 characters long' },
			pattern: {
				value: /\S+@\S+\.\S+/,
				message: 'Entered value does not match email format',
			},
		},
		password: {
			required: 'Password is required',
			minLength: { value: 6, message: 'Password must be at least 6 characters long' },
			maxLength: { value: 10, message: 'Password must be at most 10 characters long' },
			pattern: {
				value: /[A-Za-z0-9]/,
				message: 'Only letters and numbers are allowed. No special characters allowed',
			},
		},
		confirmPassword: {
			required: true,
			validate: (val) => {
				const pwd = getValues('password');
				return pwd === val || 'Passwords do not match';
			},
		},
		phone: {
			required: 'Phone is required',
			minLength: { value: 5, message: 'Phone must be at least 5 characters long' },
			maxLength: { value: 14, message: 'Phone must be at most 14 characters long' },
			pattern: {
				value:  /^([\+]{1}|[0]{1})([0-9]{5,14})$/,
				message: 'Phone number must be valid'
			}
		},
		address: { required: 'Address is required' },
		birth_date: { required: 'Date of Birth is required' },
		gender: { required: 'Gender is required' },
	};
};