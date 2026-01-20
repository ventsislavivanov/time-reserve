import { useSelector } from "react-redux";
import AdminDashboard from "./AdminDashboard";
import WorkerDashboard from "./WorkerDashboard.jsx";

export default function StaffDashboard() {
  const user = useSelector((s) => s.auth.user);
  const role = user?.role;

  if (role === "admin") return <AdminDashboard />;
  if (role === "worker") return <WorkerDashboard />;

  return null;
}
