import { UIAppointmentBadge } from "../../../components/common/ui";

const AppointmentTimeline = ({ timeline }) => {
    if (!timeline?.length) {
        return <p className="text-muted">No timeline data available.</p>;
    }

    return (
        <ul className="list-group">
            {timeline.map((event) => (
                <li key={event.id} className="list-group-item px-1 py-2">

                    <div className="d-flex align-items-center gap-2">
                        <small className="text-muted">
                            {new Date(event.created_at).toLocaleString()}
                        </small>

                        {event.old_status && (
                            <>
                                <UIAppointmentBadge status={event.old_status} />
                                <span>→</span>
                            </>
                        )}

                        <UIAppointmentBadge status={event.new_status} />
                    </div>

                    {event.reason && (
                        <div className="mt-1">
                            <em className="text-muted">Reason: {event.reason}</em>
                        </div>
                    )}
                </li>
            ))}
        </ul>
    );
};

export default AppointmentTimeline;
