import { TableCell, TableRow } from "@/components/ui/table";
import { UIAppointmentBadge, UIRowActions } from "../../../../components/common/ui";

const WorkerRow = ({
                       app,
                       isUpdating,
                       activeActionId,
                       openModal
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
            id: `start-${app.id}`,
            label: "Start",
            variant: "outline-warning",
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
            onClick: () => openModal("no_show", app),
            ...base,
        });
    }

    if (app.status === "in_progress") {
        actions.push({
            id: `complete-${app.id}`,
            label: "Complete",
            variant: "outline-success",
            onClick: () => openModal("complete", app),
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
