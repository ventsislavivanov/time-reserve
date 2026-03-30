import { UIAppointmentBadge, UIRowActions } from "../../../../components/common/ui";

const PendingRow = ({
    app,
    isUpdating,
    activeActionId,
    activeActionType,
    confirm,
    decline
}) => {
    const isRowBusy = isUpdating && activeActionId === app.id;

    const base = {
        size: "sm",
        disabled: isRowBusy
    };

    const actions = [
        {
            id: `confirm-${app.id}`,
            label: "Confirm",
            variant: "outline-primary",
            loading: isRowBusy && activeActionType === "confirm",
            loadingLabel: "Confirming...",
            onClick: () => confirm(app.id),
            ...base
        },
        {
            id: `decline-${app.id}`,
            label: "Decline",
            variant: "outline-danger",
            onClick: decline,
            ...base,
        }
    ];

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

export default PendingRow;