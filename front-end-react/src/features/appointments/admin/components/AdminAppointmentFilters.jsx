import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { UICard, UIButton } from "../../../../components/common/ui";
import { appointmentStatusLabel } from "../../../../components/common/ui/display/appointment-badge/statusLabels.js";
import { NativeSelect } from "../../../../components/common/ui/base/native-select/NativeSelect.jsx";

const Field = ({ label, children }) => (
    <div className="space-y-1.5">
        <Label>{label}</Label>
        {children}
    </div>
);

const AdminAppointmentFilters = ({
                                     filters,
                                     updateFilter,
                                     resetFilters,
                                     workers,
                                     statuses,
                                     updatedByList,
                                     onApply
                                 }) => {
    const text = (key, type = "text") => (
        <Input
            type={type}
            value={filters[key]}
            onChange={e => updateFilter(key, e.target.value)}
        />
    );

    return (
        <UICard className="mb-6">
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                <Field label="ID">{text("id")}</Field>
                <Field label="Client">{text("client")}</Field>

                <Field label="Worker">
                    <NativeSelect value={filters.worker} onChange={e => updateFilter("worker", e.target.value)}>
                        <option value="">All</option>
                        {workers.map(w => (
                            <option key={w.id} value={w.id}>{w.name}</option>
                        ))}
                    </NativeSelect>
                </Field>

                <Field label="Status">
                    <NativeSelect value={filters.status} onChange={e => updateFilter("status", e.target.value)}>
                        <option value="">All</option>
                        {statuses.map(s => (
                            <option key={s} value={s}>{appointmentStatusLabel(s)}</option>
                        ))}
                    </NativeSelect>
                </Field>

                <Field label="Date from">{text("dateFrom", "date")}</Field>
                <Field label="Date to">{text("dateTo", "date")}</Field>
                <Field label="Created from">{text("createdFrom", "date")}</Field>
                <Field label="Created to">{text("createdTo", "date")}</Field>

                <Field label="Updated by">
                    <NativeSelect value={filters.updatedBy} onChange={e => updateFilter("updatedBy", e.target.value)}>
                        <option value="">All</option>
                        {updatedByList.map(u => (
                            <option key={u.id} value={u.id}>{u.name}</option>
                        ))}
                    </NativeSelect>
                </Field>
            </div>

            <div className="mt-6 flex justify-end gap-2">
                <UIButton variant="outline-secondary" onClick={resetFilters}>
                    Reset
                </UIButton>

                <UIButton onClick={onApply}>
                    Apply filters
                </UIButton>
            </div>
        </UICard>
    );
};

export default AdminAppointmentFilters;
