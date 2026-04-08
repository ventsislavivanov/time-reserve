import PendingRow from "./PendingRow.jsx";
import { SkeletonTable } from "../../../../components/common/ui";

const PendingTable = ({
                         appointments,
                         isLoading,
                         isUpdating,
                         activeActionId,
                         openModal
                     }) => {

    if (isLoading) {
        return <SkeletonTable rows={8} columns={6} /> ;
    }

    return (
        appointments.length === 0 ? (
            <div className="alert alert-info">
                You have no pending requests.
            </div>
        ) : (
            <table className="table table-striped align-middle">
                <thead>
                <tr>
                    <th>Client</th>
                    <th>Service</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th className="text-center">Status</th>
                    <th className="text-end">Actions</th>
                </tr>
                </thead>

                <tbody>
                {appointments.map(app => (
                    <PendingRow
                        key={app.id}
                        app={app}
                        isUpdating={isUpdating}
                        activeActionId={activeActionId}
                        openModal={openModal}
                    />
                ))}
                </tbody>
            </table>
        )
    );
};

export default PendingTable;