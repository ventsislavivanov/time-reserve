import { UIActionModal } from "../../../../components/common/ui";

const ConfirmAppointmentModal = ({
                                     appointment,
                                     onClose,
                                     onConfirm,
                                     isConfirming
                                 }) => {
    if (!appointment) return null;

    return (
        <UIActionModal
            id="confirmAppointmentModal"
            title="Confirm Appointment"
            icon="check-circle"
            variantAction="primary"
            loading={isConfirming}
            loadingLabel="Confirming..."
            confirmLabel="Confirm"
            cancelLabel="Cancel"
            onConfirm={() => onConfirm(appointment.id)}
            onClose={onClose}
        >
            <p className="mb-4">
                Are you sure you want to confirm appointment?
            </p>

            <ul className="list-none p-0 mb-4">
                <li><strong>Client:</strong> {appointment.client.name}</li>
                <li><strong>Date:</strong> {appointment.date}</li>
                <li><strong>Time:</strong> {appointment.time}</li>
                <li><strong>Service:</strong> {appointment.service.name}</li>
            </ul>

            <p className="text-muted-foreground text-sm">
                Once confirmed, the client will be notified.
            </p>
        </UIActionModal>
    );
};

export default ConfirmAppointmentModal;
