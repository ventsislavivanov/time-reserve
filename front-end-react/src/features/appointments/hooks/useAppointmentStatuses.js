import { useEffect, useState } from "react";
import { appointmentStatuses } from "../services/appointmentService.js";

export const useAppointmentStatuses = () => {
    const [statuses, setStatuses] = useState([]);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        loadStatuses();
    }, []);

    const loadStatuses = async () => {
        try {
            setLoading(true);
            const data = await appointmentStatuses();
            setStatuses(data);
        } finally {
            setLoading(false);
        }
    };

    return { statuses, loading };
};
