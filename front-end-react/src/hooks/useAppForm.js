import { useEffect, useState } from "react";
import { useForm } from 'react-hook-form';

export const useAppForm = (options = {}) => {
	const { watchData, onError, ...useFormOptions } = options;
	const [isLoading, setIsLoading] = useState(false);

	const methods = useForm({
		mode: 'onTouched',
		reValidateMode: 'onChange',
		criteriaMode: 'all',
		shouldFocusError: true,
		...options
	});

	useEffect(() => {
		if (watchData) {
			methods.reset(watchData);
		}
	}, [watchData, methods]);

	const handleAppSubmit = (onSubmit) => {
		return methods.handleSubmit(async (data) => {
			try {
				setIsLoading(true);
				await onSubmit(data);
			} catch (error) {
				console.error("Form submission error", error);

				if (error.validationErrors) {
					Object.entries(error.validationErrors).forEach(([field, messages]) => {
						const message = Array.isArray(messages) ? messages[0] : messages;
						methods.setError(field, {
							type: 'server',
							message
						});
					});
				}

				else if (error.response?.data?.errors) {
					Object.entries(error.response.data.errors).forEach(([field, messages]) => {
						const message = Array.isArray(messages) ? messages[0] : messages;
						methods.setError(field, {
							type: 'server',
							message
						});
					});
				}

				if (onError) {
					onError(error);
				}

				throw error;
			} finally {
				setIsLoading(false);
			}
		});
	};

	return {
		...methods,
		handleAppSubmit,
		isLoading,
	};
};