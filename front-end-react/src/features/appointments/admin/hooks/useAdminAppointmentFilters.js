import { useState } from "react";

export const useAdminAppointmentFilters = () => {
    const [filters, setFilters] = useState({
        id: "",
        client: "",
        worker: "",
        status: "",
        dateFrom: "",
        dateTo: "",
        createdFrom: "",
        createdTo: "",
        updatedBy: ""
    });

    const updateFilter = (key, value) => {
        setFilters(prev => ({ ...prev, [key]: value }));
    };

    const resetFilters = () => {
        setFilters({
            id: "",
            client: "",
            worker: "",
            status: "",
            dateFrom: "",
            dateTo: "",
            createdFrom: "",
            createdTo: "",
            updatedBy: ""
        });
    };

    return {
        filters,
        updateFilter,
        resetFilters
    };
};
