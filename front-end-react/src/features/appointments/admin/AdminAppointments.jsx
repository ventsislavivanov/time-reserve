import { useState } from "react";
import AdminAppointmentFilters from "./components/AdminAppointmentFilters";
import AdminAppointmentsTable from "./components/AdminAppointmentsTable";
import { useAdminAppointments } from "./hooks/useAdminAppointments";
import { useAdminAppointmentFilters } from "./hooks/useAdminAppointmentFilters";

import { useAppointmentModals } from "../hooks/useAppointmentModals.js";
import {
    AppointmentDetailsModal,
    DeclineAppointmentModal,
    ConfirmAppointmentModal,
    NoShowAppointmentModal
} from "../components/modals";
import {useBootstrapModal} from "../../../hooks/index.js";

const AdminAppointments = () => {
    const {
        appointments,
        isLoading,
        isUpdating,
        activeActionId,
        confirm,
        decline,
        noShow
    } = useAdminAppointments();

    const {
        filters,
        updateFilter,
        resetFilters
    } = useAdminAppointmentFilters();

    const {
        modalType,
        modalTarget,
        openModal,
        closeModal,
        confirmModal
    } = useAppointmentModals({
        confirm,
        decline,
        noShow
    });

    const [selectedAppointment, setSelectedAppointment] = useState(null);
    const { showModal, hideModal } = useBootstrapModal();

    const applyFilters = () => {
        refetch(filters);
    };

    const openDetails = (appointment) => {
        setSelectedAppointment(appointment);
        setTimeout(() => showModal("appointmentDetailsModal"), 10);
    };

    const closeDetails = () => {
        hideModal("appointmentDetailsModal");
        setSelectedAppointment(null);
    };

    return (
        <div className="container py-5">
            <h2 className="mb-4">Admin Appointments</h2>

            <AdminAppointmentFilters
                filters={filters}
                updateFilter={updateFilter}
                resetFilters={resetFilters}
                workers={[]} // TODO: fetch workers
                statuses={[
                    "pending",
                    "confirmed",
                    "declined",
                    "cancelled",
                    "in_progress",
                    "completed",
                    "no_show",
                    "expired",
                    "timed_out"
                ]}
                updatedByList={[]} // TODO: fetch admins/staff
                onApply={applyFilters}
            />

            <AdminAppointmentsTable
                appointments={appointments}
                isLoading={isLoading}
                isUpdating={isUpdating}
                activeActionId={activeActionId}
                openModal={openModal}
                openDetails={openDetails}
            />

            {modalType === "confirm" && (
                <ConfirmAppointmentModal
                    appointment={modalTarget}
                    isConfirming={isUpdating}
                    onClose={closeModal}
                    onConfirm={confirmModal}
                />
            )}

            {modalType === "decline" && (
                <DeclineAppointmentModal
                    appointment={modalTarget}
                    isDeclining={isUpdating}
                    onClose={closeModal}
                    onConfirm={confirmModal}
                />
            )}

            {modalType === "no_show" && (
                <NoShowAppointmentModal
                    appointment={modalTarget}
                    isMarking={isUpdating}
                    onClose={closeModal}
                    onConfirm={confirmModal}
                />
            )}

            {selectedAppointment && (
                <AppointmentDetailsModal
                    appointment={selectedAppointment}
                    onClose={closeDetails}
                />
            )}
        </div>
    );
};

export default AdminAppointments;
