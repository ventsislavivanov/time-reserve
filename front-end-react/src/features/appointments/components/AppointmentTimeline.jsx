import { UIAppointmentBadge } from "../../../components/common/ui";

const AppointmentTimeline = ({ timeline }) => {
    if (!timeline?.length) {
        return <p className="text-muted-foreground">No timeline data available.</p>;
    }

    return (
        <ul className="divide-y rounded-xl border bg-card">
            {timeline.map((event) => (
                <li key={event.id} className="px-4 py-3">

                    <div className="flex items-center gap-2">
                        <small className="text-xs text-muted-foreground">
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
                            <em className="text-muted-foreground">Reason: {event.reason}</em>
                        </div>
                    )}
                </li>
            ))}
        </ul>
    );
};

export default AppointmentTimeline;
