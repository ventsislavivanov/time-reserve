import { useMemo } from "react";
import { useFetchList} from "../../../appointments/hooks/useFetchList.js";
import { getStaffAppointments } from "../../../appointments";

export const useWorkerDashboard = () => {
    const {
        items: allAppointments,
        isLoading,
        fetchData: refetch
    } = useFetchList(getStaffAppointments);

    const todayDate = new Date().toISOString().slice(0, 10);

    const pendingStatuses = ["pending"];
    const activeStatuses = ["confirmed", "in_progress"];


    const pending = useMemo(
        () => allAppointments.filter(a => pendingStatuses.includes(a.status)),
        [allAppointments]
    );

    const active = useMemo(
        () => allAppointments.filter(a => activeStatuses.includes(a.status)),
        [allAppointments]
    );


    const today = useMemo(
        () => active.filter(a => a.date === todayDate),
        [active, todayDate]
    );

    const next = useMemo(() => {
        return today
            .filter(a => a.status === "confirmed")
            .sort((a, b) => a.starts_at.localeCompare(b.starts_at))[0];
    }, [today]);

    return {
        isLoading,
        refetch,

        pending: pending.slice(0, 5),
        today: today.slice(0, 5),
        next,

        allPending: pending,
        allActive: active
    };
};
