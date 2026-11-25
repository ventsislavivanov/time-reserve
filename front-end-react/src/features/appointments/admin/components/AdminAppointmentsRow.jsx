import { TableCell, TableRow } from "@/components/ui/table";
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
        <TableRow>
            <TableCell>{app.id}</TableCell>
            <TableCell>{app.date}</TableCell>
            <TableCell>{app.time}</TableCell>
            <TableCell>{app.client?.name ?? "—"}</TableCell>
            <TableCell>{app.worker?.name ?? "—"}</TableCell>
            <TableCell><UIAppointmentBadge status={app.status} /></TableCell>
            <TableCell>{app.created_at}</TableCell>
            <TableCell>{app.updated_at}</TableCell>
            <TableCell>{app.changed_by?.type ?? "system"}{/* → {app.changed_by.name}*/}</TableCell>
            <TableCell className="pr-4 text-right">
                <UIRowActions actions={actions} />
            </TableCell>
        </TableRow>
    );
};

export default AdminAppointmentsRow;
