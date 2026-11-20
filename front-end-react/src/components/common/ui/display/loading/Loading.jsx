import { Loader2 } from "lucide-react";
import { cn } from "@/lib/utils";

// `color` is kept for backwards compatibility; the spinner now follows the theme primary color.
const Loading = ({
	loading = true,
	size = 48,
	fullscreen = false,
	center = true,
	className = "",
	style,
}) => {
	if (!loading) return null;

	return (
		<div
			className={cn(
				center && "flex items-center justify-center",
				fullscreen ? "fixed inset-0 z-[9999] bg-background/70 backdrop-blur-sm" : "p-3",
				className
			)}
			style={style}
			aria-busy="true"
			aria-live="polite"
			role="status"
		>
			<Loader2 className="animate-spin text-primary" style={{ width: size, height: size }} strokeWidth={1.5} />
		</div>
	);
}

export default Loading;
