import { useGoogleReCaptcha } from 'react-google-recaptcha-v3';

export function useRecaptcha() {
	const { executeRecaptcha } = useGoogleReCaptcha();

	const getToken = async (action = 'submit') => {
		if (!executeRecaptcha) return null;
		return await executeRecaptcha(action);
	};

	return { getToken };
}
