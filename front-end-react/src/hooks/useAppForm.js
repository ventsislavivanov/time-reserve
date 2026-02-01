import { useForm } from 'react-hook-form';

export const useAppForm = (options = {}) => {
	return useForm({
		mode: 'onTouched',
		reValidateMode: 'onChange',
		criteriaMode: 'all',
		shouldFocusError: true,
		...options
	});
};