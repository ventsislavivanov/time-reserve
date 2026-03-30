import { useForm, FormProvider } from "react-hook-form";
import { UIActionModal, UITextarea } from "../../../../../components/common/ui";

const CancelAppointmentModal = ({
	appointment,
	onClose,
	onConfirm,
	isCancelling
}) => {
	const methods = useForm({
		defaultValues: { reason: "" }
	});

	const {
		handleSubmit,
		watch,
		reset
	} = methods;

	const requiresReason = appointment?.status === "confirmed";
	const reason = watch("reason");

	const submit = ({ reason }) => {
		onConfirm(reason);
		reset();
	};

	return (
		<UIActionModal
			id="cancelAppointmentModal"
			title="Cancel Appointment"
			icon="triangle-exclamation"
			loading={isCancelling}
			loadingLabel="Cancelling..."
			confirmLabel="Yes, Cancel"
			cancelLabel="Keep it"
			onConfirm={handleSubmit(submit)}
			onClose={() => {
				reset();
				onClose();
			}}
			disableConfirm={requiresReason && !reason?.trim()}
		>
			{appointment && (
				<FormProvider {...methods}>
					<form onSubmit={handleSubmit(submit)}>
						<p className="mb-3">
							Are you sure you want to cancel this appointment?
						</p>

						{requiresReason && (
							<UITextarea
								name="reason"
								label="Reason for cancellation"
								placeholder="Please explain why you need to cancel"
								rules={{ required: "Reason is required" }}
							/>
						)}
					</form>
				</FormProvider>
			)}
		</UIActionModal>
	);
};

export default CancelAppointmentModal;