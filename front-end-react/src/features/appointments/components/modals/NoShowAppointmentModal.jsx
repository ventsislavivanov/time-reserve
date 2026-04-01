import { UIActionModal } from "../../../../components/common/ui";

const NoShowAppointmentModal = ({
                                    appointment,
                                    onClose,
                                    onConfirm,
                                    isMarking
                                }) => {
    if (!appointment) return null;

    return (
        <UIActionModal
            id="noShowAppointmentModal"
            title="Mark No-Show"
            icon="slash-circle"
            variantAction="dark"
            loading={isMarking}
            loadingLabel="Marking..."
            confirmLabel="Mark No-Show"
            cancelLabel="Cancel"
            onConfirm={() => onConfirm(appointment.id)}
            onClose={onClose}
        >
            <p className="mb-3">
                Are you sure you want to mark appointment as No-Show?
            </p>

            <ul className="list-unstyled mb-3">
                <li><strong>Client:</strong> {appointment.client.name}</li>
                <li><strong>Date:</strong> {appointment.date}</li>
                <li><strong>Time:</strong> {appointment.time}</li>
                <li><strong>Service:</strong> {appointment.service.name}</li>
            </ul>

            <p className="text-muted small">
                This action cannot be undone.
            </p>
        </UIActionModal>
    );
};

export default NoShowAppointmentModal;
