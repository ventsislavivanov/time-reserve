import { TableCell, TableRow } from "@/components/ui/table";
import { UIAppointmentBadge, UIButton } from "../../../../components/common/ui";

const HistoryRow = ({app, onView}) => {
    return (
        <TableRow key={app.id}>
            <TableCell>{app.id}</TableCell>
            <TableCell>{app.date}</TableCell>
            <TableCell>{app.time}</TableCell>
            <TableCell>{app.client.name}</TableCell>
            <TableCell>{app.service.name}</TableCell>
            <TableCell className="text-center"><UIAppointmentBadge status={app.status} /></TableCell>
            <TableCell className="text-center">
                <UIButton
                    variant="outline-info"
                    size="sm"
                    onClick={() => onView(app)}
                >
                    View
                </UIButton>
            </TableCell>
        </TableRow>
    );
};

export default HistoryRow;