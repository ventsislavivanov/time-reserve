import { useState } from "react";
import { Input } from "@/components/ui/input";
import { SearchInput, Select, UIButton } from '../../../../components/common/ui';
import { useAppointmentStatuses } from "../../hooks/useAppointmentStatuses.js";

export default function HistoryFilters({ filters, onFilterChange, onReset }) {
    const [localFilters, setLocalFilters] = useState(filters);

    const { statuses } = useAppointmentStatuses();

    const statusOptions = statuses.map(s => ({
        value: s.value,
        label: s.label
    }));

    const handleApply = () => {
        Object.keys(localFilters).forEach(key => {
            onFilterChange(key, localFilters[key]);
        });
    };

    const handleReset = () => {
        const defaultFilters = {
            search: "",
            status: "",
            clientId: "",
            dateFrom: "",
            dateTo: ""
        };

        setLocalFilters(defaultFilters);
        onReset();
    };

    return (
        <div className="mb-6 rounded-xl border bg-card p-4 shadow-sm">
            <div className="flex flex-col gap-3 md:flex-row md:flex-wrap md:items-end">

                <div className="md:w-44">
                    <Input
                        type="date"
                        value={localFilters.dateFrom}
                        onChange={(e) =>
                            setLocalFilters(prev => ({ ...prev, dateFrom: e.target.value }))
                        }
                    />
                </div>

                <div className="md:w-44">
                    <Input
                        type="date"
                        value={localFilters.dateTo}
                        onChange={(e) =>
                            setLocalFilters(prev => ({ ...prev, dateTo: e.target.value }))
                        }
                    />
                </div>

                <SearchInput
                    placeholder="Search by client name..."
                    value={localFilters.search}
                    onChange={(val) =>
                        setLocalFilters(prev => ({ ...prev, search: val }))
                    }
                />

                <Select
                    icon="flag"
                    placeholder="All Statuses"
                    value={localFilters.status}
                    options={statusOptions}
                    onChange={(val) =>
                        setLocalFilters(prev => ({ ...prev, status: val }))
                    }
                />

                <div className="flex gap-2 md:ml-auto">
                    <UIButton
                        size="sm"
                       
                        onClick={handleApply}
                        icon="filter"
                    >
                        Apply
                    </UIButton>

                    <UIButton
                        size="sm"
                        variant="outline-secondary"
                                                onClick={handleReset}
                        title="Reset"
                        icon="undo"
                    />
                </div>

            </div>
        </div>
    );
}
