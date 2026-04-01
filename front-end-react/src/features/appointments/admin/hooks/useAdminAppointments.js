import { useFetchList } from '../../hooks/useFetchList';
import { useActionHandler } from '../../hooks/useActionHandler';
import {
    getStaffAppointments,
    confirmAppointment,
    declineAppointment,
    noShowAppointment
} from '../../services/appointmentService';

export const useAdminAppointments = () => {
    const {
        items: appointments,
        setItems: setAppointments,
        isLoading,
        fetchData: fetchAppointments
    } = useFetchList(getStaffAppointments);

    const {
        isUpdating,
        activeActionId,
        activeActionType,
        handleAction
    } = useActionHandler();

    const confirm = (id) =>
        handleAction({
            id,
            type: "confirm",
            requestFn: confirmAppointment,
            successMessage: "Appointment confirmed",
            refetchFn: fetchAppointments,
            optimisticUpdate: (updated) =>
                setAppointments(prev =>
                    prev.map(a => a.id === id ? updated : a)
                )
        });

    const decline = (id, reason) =>
        handleAction({
            id,
            type: "decline",
            requestFn: () => declineAppointment(id, reason),
            successMessage: "Appointment declined",
            refetchFn: fetchAppointments,
            optimisticUpdate: (updated) =>
                setAppointments(prev =>
                    prev.map(a => a.id === id ? updated : a)
                )
        });

    const noShow = (id) =>
        handleAction({
            id,
            type: "no_show",
            requestFn: noShowAppointment,
            successMessage: "Marked as no-show",
            refetchFn: fetchAppointments,
            optimisticUpdate: (updated) =>
                setAppointments(prev =>
                    prev.map(a => a.id === id ? updated : a)
                )
        });

    return {
        appointments,
        isLoading,
        isUpdating,
        activeActionId,
        activeActionType,
        confirm,
        decline,
        noShow,
        refetch: fetchAppointments
    };
};
