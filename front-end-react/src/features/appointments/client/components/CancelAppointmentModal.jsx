import { useEffect, useRef } from 'react';
import { Modal } from 'bootstrap';
import { UIModal, UIButton } from '../../../../components/common/ui/index.js';

const CancelAppointmentModal = ({ appointmentId, onClose, cancelAppointment, isCancelling }) => {
	const modalRef = useRef(null);
	const bsModalRef = useRef(null);

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
			bsModalRef.current?.show();
		} else {
			bsModalRef.current?.hide();
		}
	}, [appointmentId]);

	const handleConfirm = async () => {
		await cancelAppointment(appointmentId);
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
			id="cancelAppointmentModal"
			title="Cancel Appointment"
			icon="triangle-exclamation"
			centered
			staticBackdrop
			onClose={handleClose}
			footer={
				<>
					<UIButton variant="outline-secondary" onClick={handleClose}>
						Keep it
					</UIButton>
					<UIButton
						variant="danger"
						onClick={handleConfirm}
						disabled={isCancelling}
					>
						{isCancelling ? (
							<>
								<span className="spinner-border spinner-border-sm me-2"></span>
								Cancelling...
							</>
						) : (
							'Yes, Cancel'
						)}
					</UIButton>
				</>
			}
		>
			<p className="mb-0">
				Are you sure you want to cancel this appointment? This action cannot be undone.
			</p>
		</UIModal>
	);
};

export default CancelAppointmentModal;