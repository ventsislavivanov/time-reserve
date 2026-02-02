import { useFormContext } from 'react-hook-form';

export const useFieldError = (name, showErrors = true) => {
	const { formState, getFieldState } = useFormContext();
	const { errors, isSubmitted } = formState;
	const { isTouched } = getFieldState(name, formState);

	const shouldShowError = (isTouched || isSubmitted) && errors[name];

	const getErrorMessages = () => {
		if (!shouldShowError) return [];

		const error = errors[name];
		if (!error) return [];

		if (error.types) {
			return Object.entries(error.types).map(([key, message]) => ({
				$uid: `${name}-${key}`,
				$message: message,
			}));
		}

		if (error.message) {
			return [{
				$uid: `${name}-${error.type || 'error'}`,
				$message: error.message,
			}];
		}

		return [];
	};

	return {
		isInvalid: showErrors && shouldShowError,
		errorMessages: showErrors ? getErrorMessages() : [],
		hasError: !!shouldShowError
	};
};