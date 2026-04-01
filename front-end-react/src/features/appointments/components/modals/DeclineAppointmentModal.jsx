import { useForm, FormProvider } from "react-hook-form";
import { UIActionModal, UITextarea } from "../../../../components/common/ui/index.js";

const DeclineAppointmentModal = ({
    appointment,
    onClose,
    onConfirm,
    isDeclining
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
            id="declineAppointmentModal"
            title="Decline Appointment"
            icon="x-circle"
            variantAction="danger"
            loading={isDeclining}
            loadingLabel="Declining..."
            confirmLabel="Decline"
            cancelLabel="Cancel"
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
                            Please provide a reason for declining this appointment.
                        </p>

                        {requiresReason && (
                            <UITextarea
                                name="reason"
                                label="Reason for decline"
                                placeholder="Please explain why you need to decline"
                                rules={{ required: "Reason is required" }}
                            />
                        )}
                    </form>
                </FormProvider>
            )}

            <p className="text-muted small">
                Once confirmed, the client will be notified.
            </p>
        </UIActionModal>
    );
};

export default DeclineAppointmentModal;