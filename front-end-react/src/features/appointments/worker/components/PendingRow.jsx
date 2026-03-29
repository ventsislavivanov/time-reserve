import {UIAppointmentBadge, UILoadingButton} from "../../../../components/common/ui/index.js";

const PendingRow = ({
                        app,
                        isUpdating,
                        activeActionId,
                        activeActionType,
                        onConfirm,
                        onDecline
}) => {
    return (
        <tr key={app.id}>
            <td>{app.client.name}</td>
            <td>{app.service.name}</td>
            <td>{app.date}</td>
            <td>{app.time}</td>
            <td className="text-center">
                <UIAppointmentBadge status={app.status} />
            </td>
            <td className="text-end">
                <UILoadingButton
                    variant="outline-primary"
                    size="sm"
                    className="me-2"
                    loading={
                        isUpdating &&
                        activeActionId === app.id &&
                        activeActionType === "confirm"
                    }
                    loadingLabel="Confirming..."
                    onClick={() => onConfirm(app.id)}
                >
                    Confirm
                </UILoadingButton>

                <UILoadingButton
                    variant="outline-danger"
                    size="sm"
                    className="me-2"
                    loading={
                        isUpdating &&
                        activeActionId === app.id &&
                        activeActionType === "decline"
                    }
                    loadingLabel="Declining..."
                    onClick={() => onDecline(app.id)}
                >
                    Decline
                </UILoadingButton>
            </td>
        </tr>
    );
}

export default PendingRow;