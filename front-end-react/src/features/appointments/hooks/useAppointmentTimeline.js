import { useState, useEffect } from "react";
import { getAppointmentHistory } from "../services/appointmentService";

export const useAppointmentTimeline = (appointmentId) => {
    const [timeline, setTimeline] = useState([]);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (!appointmentId) return;
        loadTimeline();
    }, [appointmentId]);

    const loadTimeline = async () => {
        try {
            setLoading(true);
            const response = await getAppointmentHistory(appointmentId);
            const { data } = response;

            const normalized = data.map(e => ({
                ...e,
                status: e.new_status
            }));

            setTimeline(normalized);
        } finally {
            setLoading(false);
        }
    };

    return { timeline, loading };
};

