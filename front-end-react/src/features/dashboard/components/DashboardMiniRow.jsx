const DashboardMiniRow = ({ app }) => {
    return (
        <div className="flex justify-between py-2 border-b">
            <div>
                <strong>{app.client.name}</strong>
                <div className="text-muted-foreground text-sm">{app.service.name}</div>
            </div>

            <div className="text-right">
                <div>{app.date}</div>
                <div className="text-sm">{app.time}</div>
            </div>
        </div>
    );
};

export default DashboardMiniRow;
