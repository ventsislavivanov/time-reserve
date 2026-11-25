import { Table, TableBody, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import HistoryRow from "./HistoryRow.jsx";
import { SkeletonTable } from "../../../../components/common/ui";


const HistoryTable = ({
                          history,
                          isLoading,
                          openModal
                      }) => {

    if (isLoading) {
        return <SkeletonTable rows={8} columns={6} /> ;
    }

    return (
        history.length === 0 ? (
            <div className="rounded-lg border px-4 py-3 text-sm border-primary/20 bg-primary/5 text-foreground">
                There are no entries in the history.
            </div>
        ) : (
            <div className="overflow-hidden rounded-xl border bg-card shadow-sm">
                <div className="overflow-x-auto">
                    <Table>
                        <TableHeader>
                        <TableRow>
                            <TableHead>#</TableHead>
                            <TableHead>Date</TableHead>
                            <TableHead>Time</TableHead>
                            <TableHead>Client</TableHead>
                            <TableHead>Service</TableHead>
                            <TableHead className="text-center">Status</TableHead>
                            <TableHead className="text-center">Details</TableHead>
                        </TableRow>
                        </TableHeader>

                        <TableBody>
                        {history.map(app => (
                            <HistoryRow
                                key={app.id}
                                app={app}
                                onView={openModal}
                            />
                        ))}
                        </TableBody>
                    </Table>
                </div>
            </div>
        )
    );
}

export default HistoryTable;