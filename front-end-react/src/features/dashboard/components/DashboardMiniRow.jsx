const DashboardMiniRow = ({ app }) => {
    return (
        <div className="d-flex justify-content-between py-2 border-bottom">
            <div>
                <strong>{app.client.name}</strong>
                <div className="text-muted small">{app.service.name}</div>
            </div>

            <div className="text-end">
                <div>{app.date}</div>
                <div className="small">{app.time}</div>
            </div>
        </div>
    );
};

export default DashboardMiniRow;
