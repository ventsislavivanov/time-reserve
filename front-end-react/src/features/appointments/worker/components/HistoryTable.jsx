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
            <div className="alert alert-info">
                There are no entries in the history.
            </div>
        ) : (
            <div className="card shadow-sm border-0 rounded-3 overflow-hidden bg-white">
                <div className="table-responsive">
                    <table className="table table-striped align-middle mb-0">
                        <thead className="bg-light text-secondary text-uppercase">
                        <tr>
                            <th>#</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Client</th>
                            <th>Service</th>
                            <th className="text-center">Status</th>
                            <th className="text-center">Details</th>
                        </tr>
                        </thead>

                        <tbody>
                        {history.map(app => (
                            <HistoryRow
                                key={app.id}
                                app={app}
                                onView={openModal}
                            />
                        ))}
                        </tbody>
                    </table>
                </div>
            </div>
        )
    );
}

export default HistoryTable;