import { UIAppointmentBadge, UIRowActions } from "../../../../components/common/ui";

const AdminAppointmentsRow = ({
                                  app,
                                  isUpdating,
                                  activeActionId,
                                  openModal,
                                  openDetails
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
    }

    if (app.status === "pending" || app.status === "confirmed") {
        actions.push({
            id: `decline-${app.id}`,
            label: "Decline",
            variant: "outline-danger",
            onClick: () => openModal("decline", app),
            ...base,
        });
    }

    if (app.status === "confirmed") {
        actions.push({
            id: `no-show-${app.id}`,
            label: "No-Show",
            variant: "outline-dark",
            onClick: () => openModal("no_show", app),
            ...base,
        });
    }

    if (app.status !== "pending") {
        actions.push({
            id: `view-${app.id}`,
            label: "View",
            variant: "outline-info",
            onClick: () => openDetails(app),
            size: "sm"
        });
    }

    return (
        <tr>
            <td>{app.id}</td>
            <td>{app.date}</td>
            <td>{app.time}</td>
            <td>{app.client.name}</td>
            <td>{app.worker.name}</td>
            <td><UIAppointmentBadge status={app.status} /></td>
            <td>{app.created_at}</td>
            <td>{app.updated_at}</td>
            <td>{app.changed_by.type}{/* → {app.changed_by.name}*/}</td>
            <td className="text-end">
                <UIRowActions actions={actions} />
            </td>
        </tr>
    );
};

export default AdminAppointmentsRow;
