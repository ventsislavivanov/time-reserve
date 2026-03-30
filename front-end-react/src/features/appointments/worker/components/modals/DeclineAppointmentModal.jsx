import { useState } from 'react';
import { UIModal, UIButton, UILoadingButton } from '../../../../../components/common/ui/index.js';

const DeclineAppointmentModal = ({
    appointment,
    onClose,
    onConfirm,
    isDeclining
}) => {
    if (!appointment) return null;

    const [reason, setReason] = useState('');

    const requiresReason = appointment.status === 'confirmed';

    const handleConfirm = () => {
        if (requiresReason && !reason.trim()) return;
        onConfirm(reason);
    };

    return (
        <UIModal
            id="declineAppointmentModal"
            title="Decline Appointment"
            icon="x-circle"
            centered
            staticBackdrop
            onClose={onClose}
            footer={
                <>
                    <UIButton variant="outline-secondary" onClick={onClose}>
                        Cancel
                    </UIButton>

                    <UILoadingButton
                        variant="danger"
                        onClick={handleConfirm}
                        loading={isDeclining}
                        loadingLabel="Declining..."
                        disabled={requiresReason && !reason.trim()}
                    >
                        Decline
                    </UILoadingButton>

                </>
            }
        >
            <p className="mb-3">
                Please provide a reason for declining this appointment.
            </p>

            {requiresReason && (
                <div className="mb-3">
                    <label className="form-label">Reason for decline</label>
                    <textarea
                        className="form-control"
                        rows="3"
                        value={reason}
                        onChange={(e) => setReason(e.target.value)}
                        placeholder="Please explain why you need to decline"
                    />
                </div>
            )}
        </UIModal>
    );
};

export default DeclineAppointmentModal;