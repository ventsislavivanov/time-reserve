import { useState } from "react";
import { useBootstrapModal} from "../../../hooks/index.js";
import { SkeletonTable, UIPagination } from "../../../components/common/ui";
import { useHistoryAppointments } from "./hooks/useHistoryAppointments.js";
import HistoryFilters from "./components/HistoryFilters.jsx";
import HistoryRow from "./components/HistoryRow.jsx";
import AppointmentDetailsModal from "./components/modals/AppointmentDetailsModal.jsx";


const HistoryAppointments = () => {
    const [selectedAppointment, setSelectedAppointment] = useState(null);

    const { showModal, hideModal } = useBootstrapModal();

    const openDetails = (appointment) => {
        setSelectedAppointment(appointment);
        setTimeout(() => showModal('appointmentDetailsModal'), 10);
    };

    const closeDetails = () => {
        hideModal('appointmentDetailsModal');
        setSelectedAppointment(null);
    };

    const {
        history,
        isLoading,
        currentPage,
        itemsPerPage,
        totalItems,
        totalPages,
        filters,
        setFilters,
        setCurrentPage,
        setItemsPerPage
    } = useHistoryAppointments();

    if (isLoading) {
        return (
            <div className="container py-5">
                <h2 className="mb-4">Appointment History</h2>
                <SkeletonTable rows={8} columns={6} />
            </div>
        );
    }

    return (
        <div className="container py-5">
            <h2 className="mb-4">Appointment History</h2>

            <HistoryFilters
                filters={filters}
                onFilterChange={(key, value) =>
                    setFilters(prev => ({ ...prev, [key]: value }))
                }
                onReset={() =>
                    setFilters({ status: "", dateFrom: "", dateTo: "" })
                }
            />

            {history.length === 0 ? (
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
                                    onView={openDetails}
                                />
                             ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            )}

            <UIPagination
                currentPage={currentPage}
                totalPages={totalPages}
                totalItems={totalItems}
                itemsPerPage={itemsPerPage}
                onPageChange={setCurrentPage}
                onItemsPerPageChange={setItemsPerPage}
            />

            {selectedAppointment && (
                <AppointmentDetailsModal
                    appointment={selectedAppointment}
                    onClose={() => closeDetails(null)}
                />
            )}
        </div>
    );
};

export default HistoryAppointments;
