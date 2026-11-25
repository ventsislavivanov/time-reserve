import { useCallback, useRef } from 'react';
import { useFetchList } from '../../hooks/useFetchList';
import { useActionHandler } from '../../hooks/useActionHandler';
import {
    getStaffAppointments,
    confirmAppointment,
    declineAppointment,
    noShowAppointment
} from '../../services/appointmentService';

// Form field -> query parameter of GET /staff/appointments
const FILTER_PARAMS = {
    id: 'id',
    client: 'client',
    worker: 'worker_id',
    status: 'status',
    dateFrom: 'date_from',
    dateTo: 'date_to',
    createdFrom: 'created_from',
    createdTo: 'created_to',
    updatedBy: 'updated_by'
};

const toParams = (filters = {}) =>
    Object.fromEntries(
        Object.entries(FILTER_PARAMS)
            .filter(([field]) => filters[field] !== undefined && filters[field] !== '')
            .map(([field, param]) => [param, filters[field]])
    );

export const useAdminAppointments = () => {
    // The applied filters live in a ref so the fetch function stays stable and the list is
    // reloaded with the same filters after confirm / decline / no-show.
    const paramsRef = useRef({});
    const fetchList = useCallback(() => getStaffAppointments(paramsRef.current), []);

    const {
        items: appointments,
        setItems: setAppointments,
        isLoading,
        fetchData: fetchAppointments
    } = useFetchList(fetchList);

    const refetch = (filters) => {
        if (filters) paramsRef.current = toParams(filters);
        return fetchAppointments();
    };

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
        refetch
    };
};
