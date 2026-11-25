import { Table, TableBody, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import WorkerRow from "./WorkerRow.jsx";
import { SkeletonTable } from "../../../../components/common/ui";

const WorkerTable = ({
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
            <div className="rounded-lg border px-4 py-3 text-sm border-primary/20 bg-primary/5 text-foreground">
                You have no confirmed requests.
            </div>
        ) : (
            <div className="overflow-hidden rounded-xl border bg-card shadow-sm">
<Table>
                <TableHeader>
                <TableRow>
                    <TableHead>Client</TableHead>
                    <TableHead>Service</TableHead>
                    <TableHead>Date</TableHead>
                    <TableHead>Time</TableHead>
                    <TableHead className="text-center">Status</TableHead>
                    <TableHead className="text-right">Actions</TableHead>
                </TableRow>
                </TableHeader>

                <TableBody>
                {appointments.map(app => (
                    <WorkerRow
                        key={app.id}
                        app={app}
                        isUpdating={isUpdating}
                        activeActionId={activeActionId}
                        openModal={openModal}
                    />
                ))}
                </TableBody>
            </Table>
</div>
        )
    );
};

export default WorkerTable;
