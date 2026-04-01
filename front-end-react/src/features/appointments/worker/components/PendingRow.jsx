import { UIAppointmentBadge, UIRowActions } from "../../../../components/common/ui";

const WorkerRow = ({
                       app,
                       isUpdating,
                       activeActionId,
                       activeActionType,
                       openModal
                   }) => {
    const now = new Date();
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
            id: `start-${app.id}`,
            label: "Start",
            variant: "outline-warning",
            loading: isRowBusy && activeActionType === "start",
            loadingLabel: "Starting...",
            onClick: () => openModal("start", app),
            ...base,
        });

        actions.push({
            id: `decline-${app.id}`,
            label: "Decline",
            variant: "outline-danger",
            onClick: () => openModal("decline", app),
            ...base,
        });
    }

    if (app.status === "confirmed" && now >= twoHoursAfterEnd) {
        actions.push({
            id: `no-show-${app.id}`,
            label: "Mark No-Show",
            variant: "outline-dark",
            loading: isRowBusy && activeActionType === "no_show",
            loadingLabel: "Marking...",
            onClick: () => openModal("no_show", app),
            ...base,
        });
    }

    if (app.status === "in_progress") {
        actions.push({
            id: `complete-${app.id}`,
            label: "Complete",
            variant: "outline-success",
            loading: isRowBusy && activeActionType === "complete",
            loadingLabel: "Completing...",
            onClick: () => openModal("complete", app),
            ...base,
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
