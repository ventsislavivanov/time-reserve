import { UIAppointmentBadge, UIButton } from "../../../../components/common/ui";

const HistoryRow = ({app, onView}) => {
    return (
        <tr key={app.id}>
            <td>{app.id}</td>
            <td>{app.date}</td>
            <td>{app.time}</td>
            <td>{app.client.name}</td>
            <td>{app.service.name}</td>
            <td className="text-center"><UIAppointmentBadge status={app.status} /></td>
            <td className="text-center">
                <UIButton
                    variant="outline-info"
                    size="sm"
                    onClick={() => onView(app)}
                >
                    View
                </UIButton>
            </td>
        </tr>
    );
}

export default HistoryRow;