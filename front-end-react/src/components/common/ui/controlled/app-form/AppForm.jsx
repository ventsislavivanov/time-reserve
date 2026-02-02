import { FormProvider } from "react-hook-form";

const AppForm = ({ methods, onSubmit, onInvalid, children, ...props }) => {
	return (
		<FormProvider {...methods}>
			<form onSubmit={methods.handleAppSubmit(onSubmit)} {...props}>
				{children}
			</form>
		</FormProvider>
	);
};

export default AppForm;