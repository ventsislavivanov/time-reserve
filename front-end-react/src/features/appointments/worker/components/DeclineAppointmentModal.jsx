import { useEffect, useRef, useState } from 'react';
import { Modal } from 'bootstrap';
import { UIModal, UIButton, UITextarea } from '../../../../components/common/ui';

const DeclineAppointmentModal = ({ appointmentId, onClose, declineAppointment, isDeclining }) => {
    const modalRef = useRef(null);
    const bsModalRef = useRef(null);
    const [reason, setReason] = useState('');

    useEffect(() => {
        if (modalRef.current) {
            bsModalRef.current = new Modal(modalRef.current);
        }
        return () => {
            bsModalRef.current?.dispose();
        };
    }, []);

    useEffect(() => {
        if (appointmentId) {
            setReason('');
            bsModalRef.current?.show();
        } else {
            bsModalRef.current?.hide();
        }
    }, [appointmentId]);

    const handleConfirm = async () => {
        if (!reason.trim()) return; // required
        await declineAppointment(appointmentId, reason);
        bsModalRef.current?.hide();
        onClose();
    };

    const handleClose = () => {
        bsModalRef.current?.hide();
        onClose();
    };

    return (
        <UIModal
            ref={modalRef}
            id="declineAppointmentModal"
            title="Decline Appointment"
            icon="x-circle"
            centered
            staticBackdrop
            onClose={handleClose}
            footer={
                <>
                    <UIButton variant="outline-secondary" onClick={handleClose}>
                        Cancel
                    </UIButton>
                    <UIButton
                        variant="danger"
                        onClick={handleConfirm}
                        disabled={isDeclining || !reason.trim()}
                    >
                        {isDeclining ? 'Declining...' : 'Decline'}
                    </UIButton>
                </>
            }
        >
            <p className="mb-3">Please provide a reason for declining this appointment.</p>

            <textarea
                className="form-control"
                rows="4"
                value={reason}
                onChange={(e) => setReason(e.target.value)}
                placeholder="Reason for decline..."
                required
            />
        </UIModal>
    );
};

export default DeclineAppointmentModal;
