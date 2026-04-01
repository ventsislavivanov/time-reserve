const AdminAppointmentFilters = ({
                                     filters,
                                     updateFilter,
                                     resetFilters,
                                     workers,
                                     statuses,
                                     updatedByList,
                                     onApply
                                 }) => {
    return (
        <div className="card mb-4">
            <div className="card-body">
                <div className="row g-3">

                    <div className="col-md-2">
                        <label className="form-label">ID</label>
                        <input
                            type="text"
                            className="form-control"
                            value={filters.id}
                            onChange={e => updateFilter("id", e.target.value)}
                        />
                    </div>

                    <div className="col-md-3">
                        <label className="form-label">Client</label>
                        <input
                            type="text"
                            className="form-control"
                            value={filters.client}
                            onChange={e => updateFilter("client", e.target.value)}
                        />
                    </div>

                    <div className="col-md-3">
                        <label className="form-label">Worker</label>
                        <select
                            className="form-select"
                            value={filters.worker}
                            onChange={e => updateFilter("worker", e.target.value)}
                        >
                            <option value="">All</option>
                            {workers.map(w => (
                                <option key={w.id} value={w.id}>{w.name}</option>
                            ))}
                        </select>
                    </div>

                    <div className="col-md-2">
                        <label className="form-label">Status</label>
                        <select
                            className="form-select"
                            value={filters.status}
                            onChange={e => updateFilter("status", e.target.value)}
                        >
                            <option value="">All</option>
                            {statuses.map(s => (
                                <option key={s} value={s}>{s}</option>
                            ))}
                        </select>
                    </div>

                    <div className="col-md-2">
                        <label className="form-label">Date From</label>
                        <input
                            type="date"
                            className="form-control"
                            value={filters.dateFrom}
                            onChange={e => updateFilter("dateFrom", e.target.value)}
                        />
                    </div>

                    <div className="col-md-2">
                        <label className="form-label">Date To</label>
                        <input
                            type="date"
                            className="form-control"
                            value={filters.dateTo}
                            onChange={e => updateFilter("dateTo", e.target.value)}
                        />
                    </div>

                    <div className="col-md-2">
                        <label className="form-label">Created From</label>
                        <input
                            type="date"
                            className="form-control"
                            value={filters.createdFrom}
                            onChange={e => updateFilter("createdFrom", e.target.value)}
                        />
                    </div>

                    <div className="col-md-2">
                        <label className="form-label">Created To</label>
                        <input
                            type="date"
                            className="form-control"
                            value={filters.createdTo}
                            onChange={e => updateFilter("createdTo", e.target.value)}
                        />
                    </div>

                    <div className="col-md-3">
                        <label className="form-label">Updated By</label>
                        <select
                            className="form-select"
                            value={filters.updatedBy}
                            onChange={e => updateFilter("updatedBy", e.target.value)}
                        >
                            <option value="">All</option>
                            {updatedByList.map(u => (
                                <option key={u.id} value={u.id}>{u.name}</option>
                            ))}
                        </select>
                    </div>

                </div>

                <div className="d-flex justify-content-end mt-3 gap-2">
                    <button className="btn btn-secondary" onClick={resetFilters}>
                        Reset
                    </button>

                    <button className="btn btn-primary" onClick={onApply}>
                        Apply Filters
                    </button>
                </div>
            </div>
        </div>
    );
};

export default AdminAppointmentFilters;
