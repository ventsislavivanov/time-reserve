import { useState } from "react";
import HistoryTable from "./components/HistoryTable.jsx";
import { useHistoryAppointments } from "./hooks/useHistoryAppointments.js";
import HistoryFilters from "./components/HistoryFilters.jsx";
import {AppointmentDetailsModal} from "../components/modals";
import { useBootstrapModal} from "../../../hooks/index.js";
import { SkeletonTable, UIPagination } from "../../../components/common/ui";


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

            <HistoryTable
                history={history}
                isLoading={isLoading}
                onView={openDetails}
            />

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
