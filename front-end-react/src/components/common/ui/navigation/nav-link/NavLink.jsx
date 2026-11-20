import { Link, useLocation } from "react-router";
import { cn } from "@/lib/utils";

const UINavLink = ({ to, children }) => {
	const location = useLocation();
	const isActive = location.pathname === to || (to !== '/' && location.pathname.startsWith(to + '/'));

	return (
		<Link
			to={to}
			aria-current={isActive ? "page" : undefined}
			className={cn(
				"rounded-md px-3 py-2 text-sm font-medium transition-colors",
				isActive
					? "bg-accent text-accent-foreground"
					: "text-muted-foreground hover:bg-muted hover:text-foreground"
			)}
		>
			{children}
		</Link>
	);
};

export default UINavLink;
