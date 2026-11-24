import { UIModal, SkeletonTableCompact, UIButton } from "../../../../../components/common/ui/index.js";
import { useAppointmentTimeline } from "../../../hooks/useAppointmentTimeline.js";
import AppointmentTimeline from "../../../components/AppointmentTimeline.jsx";

const AppointmentDetailsModal = ({ appointment, onClose }) => {
    const { timeline, loading } = useAppointmentTimeline(appointment?.id);

    if (!appointment) return null;

    return (
        <UIModal
            id="appointmentDetailsModal"
            title="Appointment Details"
            icon="calendar"
            centered
            onClose={onClose}
            footer={
                <UIButton variant="outline-secondary" onClick={onClose}>
                    Close
                </UIButton>
            }
        >
            <div>
                <h5 className="mb-4">General Info</h5>

                <div className="mb-6">
                    <strong>Service:</strong> {appointment.service?.name} <br />
                    <strong>Worker:</strong> {appointment.worker?.name} <br />
                    {appointment.worker?.job_position && (
                        <>
                            <strong>Position:</strong> {appointment.worker.job_position.name} <br />
                        </>
                    )}
                    <strong>Date:</strong> {appointment.date} <br />
                    <strong>Time:</strong> {appointment.time}
                </div>

                <h5 className="mt-6">Status Timeline</h5>

                {loading ? (
                    <SkeletonTableCompact rows={3} columns={4} />
                ) : (
                    <AppointmentTimeline timeline={timeline} />
                )}
            </div>
        </UIModal>
    );
};

export default AppointmentDetailsModal;
