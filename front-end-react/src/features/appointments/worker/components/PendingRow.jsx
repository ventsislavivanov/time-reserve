import { TableCell, TableRow } from "@/components/ui/table";
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
        <TableRow>
            <TableCell>{app.client.name}</TableCell>
            <TableCell>{app.service.name}</TableCell>
            <TableCell>{app.date}</TableCell>
            <TableCell>{app.time}</TableCell>
            <TableCell className="text-center">
                <UIAppointmentBadge status={app.status} />
            </TableCell>
            <TableCell className="text-right">
                <UIRowActions actions={actions} />
            </TableCell>
        </TableRow>
    );
};

export default WorkerRow;
