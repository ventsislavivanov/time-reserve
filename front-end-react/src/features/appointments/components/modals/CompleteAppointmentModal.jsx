import { UIActionModal } from "../../../../components/common/ui";

const CompleteAppointmentModal = ({
                                      appointment,
                                      onClose,
                                      onConfirm,
                                      isCompleting
                                  }) => {
    if (!appointment) return null;

    const clientName = appointment.client?.name;
    const date = appointment.date;
    const time = appointment.time;
    const service = appointment.service?.name;

    return (
        <UIActionModal
            id="completeAppointmentModal"
            title="Complete Appointment"
            icon="check-circle"
            variantAction="success"
            loading={isCompleting}
            loadingLabel="Completing..."
            confirmLabel="Complete"
            confirmVariant="success"
            cancelLabel="Cancel"
            onConfirm={() => onConfirm(appointment.id)}
            onClose={onClose}
        >
            <p className="mb-3">
                Are you sure you want to complete this appointment?
            </p>

            <ul className="list-unstyled mb-3">
                <li><strong>Client:</strong> {clientName}</li>
                <li><strong>Date:</strong> {date}</li>
                <li><strong>Time:</strong> {time}</li>
                {service && <li><strong>Service:</strong> {service}</li>}
            </ul>

            <p className="text-muted small">
                The working time will be recorded and saved.
            </p>
        </UIActionModal>
    );
};

export default CompleteAppointmentModal;
