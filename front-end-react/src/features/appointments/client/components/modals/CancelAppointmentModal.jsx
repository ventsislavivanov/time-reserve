import { useState } from 'react';
import { UIModal, UIButton } from '../../../../../components/common/ui/index.js';

const CancelAppointmentModal = ({
	appointment,
	onClose,
	onConfirm,
	isCancelling
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
			id="cancelAppointmentModal"
			title="Cancel Appointment"
			icon="triangle-exclamation"
			centered
			staticBackdrop
			onClose={onClose}
			footer={
				<>
					<UIButton variant="outline-secondary" onClick={onClose}>
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
			<p className="mb-3">
				Are you sure you want to cancel this appointment?
			</p>

			{requiresReason && (
				<div className="mb-3">
					<label className="form-label">Reason for cancellation</label>
					<textarea
						className="form-control"
						rows="3"
						value={reason}
						onChange={(e) => setReason(e.target.value)}
						placeholder="Please explain why you need to cancel"
					/>
				</div>
			)}
		</UIModal>
	);
};

export default CancelAppointmentModal;