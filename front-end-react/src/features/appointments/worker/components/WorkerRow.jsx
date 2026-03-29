import { UIAppointmentBadge, UIRowActions } from "../../../../components/common/ui";

const WorkerRow = ({
    app,
    isUpdating,
    activeActionId,
    activeActionType,
    start,
    decline,
    markNoShow,
    complete
}) => {

    const now = new Date();
    const startsAt = new Date(app.starts_at);
    const endsAt = new Date(app.ends_at);
    const twoHoursAfterEnd = new Date(endsAt.getTime() + 2 * 60 * 60 * 1000);

    const isRowBusy = isUpdating && activeActionId === app.id;
    const base = {
        size: "sm",
        disabled: isRowBusy
    };

    const actions = [];

    if (app.status === "confirmed") {
        actions.push({
            ...base,
            key: `start-${app.id}`,
            label: "Start",
            variant: "outline-warning",
            loading: isRowBusy && activeActionType === "start",
            loadingLabel: "Starting...",
            onClick: () => start(app.id)
        });

        actions.push({
            ...base,
            key: `decline-${app.id}`,
            label: "Decline",
            variant: "outline-danger",
            loading: isRowBusy && activeActionType === "decline",
            loadingLabel: "Declining...",
            onClick: () => decline(app.id)
        });
    }

    if (app.status === "confirmed" && now >= twoHoursAfterEnd) {
        actions.push({
            ...base,
            key: `no-show-${app.id}`,
            label: "Mark no-show",
            variant: "outline-dark",
            loading: isRowBusy && activeActionType === "no_show",
            loadingLabel: "Marking...",
            onClick: () => markNoShow(app.id)
        });
    }

    if (app.status === "in_progress") {
        actions.push({
            ...base,
            key: `complete-${app.id}`,
            label: "Complete",
            variant: "outline-success",
            loading: isRowBusy && activeActionType === "complete",
            loadingLabel: "Completing...",
            onClick: () => complete(app.id)
        });
    }

    return (
        <tr>
            <td>{app.client.name}</td>
            <td>{app.service.name}</td>
            <td>{app.date}</td>
            <td>{app.time}</td>
            <td className="text-center">
                <UIAppointmentBadge status={app.status} />
            </td>
            <td className="text-end">
                <UIRowActions actions={actions} />
            </td>
        </tr>
    );
};

export default WorkerRow;
