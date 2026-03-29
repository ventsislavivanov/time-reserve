import { useState } from "react";
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
        <div className="card shadow-sm border-0 mb-4 p-3 bg-white rounded-3">
            <div className="row g-3 align-items-end">

                <div className="col-md-2">
                    <input
                        type="date"
                        className="form-control"
                        value={localFilters.dateFrom}
                        onChange={(e) =>
                            setLocalFilters(prev => ({ ...prev, dateFrom: e.target.value }))
                        }
                    />
                </div>

                <div className="col-md-2">
                    <input
                        type="date"
                        className="form-control"
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

                <div className="col-md-2 d-flex gap-2">
                    <UIButton
                        size="sm"
                        className="w-100 shadow-sm"
                        onClick={handleApply}
                        icon="filter"
                    >
                        Apply
                    </UIButton>

                    <UIButton
                        size="sm"
                        variant="outline-secondary"
                        className="shadow-sm"
                        onClick={handleReset}
                        title="Reset"
                        icon="undo"
                    />
                </div>

            </div>
        </div>
    );
}
