import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { cn } from "@/lib/utils";

const UINavTabLink = ({ tabKey, activeTab, onClick, icon, children }) => {
	const isActive = activeTab === tabKey;

	return (
		<li>
			<button
				type="button"
				role="tab"
				aria-selected={isActive}
				className={cn(
					"-mb-px flex items-center gap-2 border-b-2 px-4 py-2 text-sm font-medium transition-colors",
					isActive
						? "border-primary text-primary"
						: "border-transparent text-muted-foreground hover:text-foreground"
				)}
				onClick={() => onClick(tabKey)}
			>
				{icon && <FontAwesomeIcon icon={icon} />}
				{children}
			</button>
		</li>
	);
}

export default UINavTabLink
