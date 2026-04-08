import { UIAppointmentBadge, UIRowActions } from "../../../../components/common/ui";

const WorkerRow = ({
                       app,
                       isUpdating,
                       activeActionId,
                       openModal
                   }) => {
    const isRowBusy = isUpdating && activeActionId === app.id;
    const base = {
        size: "sm",
        disabled: isRowBusy
    };

    const actions = [];

    if (app.status === "pending") {
        actions.push({
            id: `confirm-${app.id}`,
            label: "Confirm",
            variant: "outline-primary",
            onClick: () => openModal("confirm", app),
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
