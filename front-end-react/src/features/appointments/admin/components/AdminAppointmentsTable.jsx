import AdminAppointmentsRow from "./AdminAppointmentsRow.jsx";
import { SkeletonTable } from "../../../../components/common/ui";

const AdminAppointmentsTable = ({
                                    appointments,
                                    isLoading,
                                    isUpdating,
                                    activeActionId,
                                    openModal={openModal},
                                    openDetails= {openDetails}
                                }) => {
    if (isLoading) {
        return <SkeletonTable rows={15} columns={6} />;
    }

    return (
        <table className="table table-striped align-middle">
            <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Time</th>
                <th>Client</th>
                <th>Worker</th>
                <th>Status</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Changed By</th>
                <th className="text-end">Actions</th>
            </tr>
            </thead>

            <tbody>
            {appointments.map(app => (
                <AdminAppointmentsRow
                    key={app.id}
                    app={app}
                    isUpdating={isUpdating}
                    activeActionId={activeActionId}
                    openModal={openModal}
                    openDetails={openDetails}
                />
            ))}
            </tbody>
        </table>
    );
};

export default AdminAppointmentsTable;
