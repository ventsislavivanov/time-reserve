import { useState, useMemo } from "react";
import { useFetchList } from "../../hooks/useFetchList.js";
import { getStaffAppointments } from "../../services/appointmentService.js";

export const useHistoryAppointments = () => {
    const {
        items: allAppointments,
        isLoading,
        fetchData: fetchHistoryRaw
    } = useFetchList(getStaffAppointments);

    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage, setItemsPerPage] = useState(10);

    const [filters, setFilters] = useState({
        status: "",
        dateFrom: "",
        dateTo: "",
        search: ""
    });

    const historyStatuses = [
        "completed",
        "cancelled",
        "declined",
        "no_show",
        "expired",
        "timed_out"
    ];

    const filtered = useMemo(() => {
        let items = allAppointments.filter(a =>
            historyStatuses.includes(a.status)
        );

        if (filters.status) {
            items = items.filter(a => a.status === filters.status);
        }

        if (filters.dateFrom) {
            items = items.filter(a =>
                new Date(a.starts_at) >= new Date(filters.dateFrom)
            );
        }

        if (filters.dateTo) {
            items = items.filter(a =>
                new Date(a.starts_at) <= new Date(filters.dateTo)
            );
        }

        if (filters.search) {
            const search = filters.search.toLowerCase();
            items = items.filter(a =>
                a.client?.name?.toLowerCase().includes(search)
            );
        }

        return items;
    }, [allAppointments, filters]);

    const totalItems = filtered.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);

    const history = useMemo(() => {
        const start = (currentPage - 1) * itemsPerPage;
        return filtered.slice(start, start + itemsPerPage);
    }, [filtered, currentPage, itemsPerPage]);

    return {
        history,
        isLoading,
        currentPage,
        itemsPerPage,
        totalItems,
        totalPages,
        filters,
        setFilters,
        setCurrentPage,
        setItemsPerPage,
        refetch: fetchHistoryRaw
    };
};
