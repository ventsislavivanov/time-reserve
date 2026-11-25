import AdminAppointmentsRow from "./AdminAppointmentsRow.jsx";
import { SkeletonTable, UICard } from "../../../../components/common/ui";
import { Table, TableBody, TableHead, TableHeader, TableRow } from "@/components/ui/table";

const AdminAppointmentsTable = ({
                                    appointments,
                                    isLoading,
                                    isUpdating,
                                    activeActionId,
                                    openModal,
                                    openDetails
                                }) => {
    if (isLoading) {
        return <SkeletonTable rows={15} columns={6} />;
    }

    return (
        <UICard bodyClassName="p-0" className="overflow-x-auto">
            <Table>
                <TableHeader className="bg-muted/40">
                    <TableRow>
                        <TableHead>ID</TableHead>
                        <TableHead>Date &amp; time</TableHead>
                        <TableHead>Client</TableHead>
                        <TableHead>Worker</TableHead>
                        <TableHead className="text-center">Status</TableHead>
                        <TableHead>Created / updated</TableHead>
                        <TableHead className="text-center">Changed by</TableHead>
                        <TableHead className="pr-4 text-right">Actions</TableHead>
                    </TableRow>
                </TableHeader>

                <TableBody>
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
                </TableBody>
            </Table>
        </UICard>
    );
};

export default AdminAppointmentsTable;
