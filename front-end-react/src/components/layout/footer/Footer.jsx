import { CalendarClock } from "lucide-react";

const Footer = () => {
	const year = new Date().getFullYear();

	return (
		<footer className="border-t bg-card">
			<div className="mx-auto flex max-w-7xl flex-col items-center justify-between gap-2 px-4 py-6 text-sm text-muted-foreground sm:flex-row">
				<div className="flex items-center gap-2 font-medium text-foreground">
					<CalendarClock className="size-4 text-primary" />
					Time Reserve
				</div>
				<p>&copy; {year} Time Reserve. All rights reserved.</p>
			</div>
		</footer>
	);
}

export default Footer;
