import { useState } from "react";
import { Link, useLocation } from "react-router";
import { CalendarClock, Menu } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Sheet, SheetContent, SheetDescription, SheetHeader, SheetTitle, SheetTrigger } from "@/components/ui/sheet";
import ThemeToggle from "../theme/ThemeToggle.jsx";

const Brand = ({ to }) => (
	<Link to={to} className="flex items-center gap-2 text-lg font-bold tracking-tight">
		<span className="flex size-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
			<CalendarClock className="size-5" />
		</span>
		Time Reserve
	</Link>
);

// children: the navigation links, actions: the right hand side (user info, buttons),
// homeTo: where the logo leads (the staff layout points it at the dashboard)
const Header = ({ children, actions, homeTo = "/" }) => {
	const [open, setOpen] = useState(false);
	const { pathname } = useLocation();
	const [lastPath, setLastPath] = useState(pathname);

	// Close the mobile menu after navigating.
	if (lastPath !== pathname) {
		setLastPath(pathname);
		setOpen(false);
	}

	return (
		<header className="sticky top-0 z-40 border-b bg-background/80 backdrop-blur supports-[backdrop-filter]:bg-background/60">
			<div className="mx-auto flex h-16 max-w-7xl items-center gap-4 px-4">
				<Brand to={homeTo} />

				<nav className="ml-4 hidden flex-1 items-center gap-1 lg:flex">
					{children}
				</nav>

				<div className="ml-auto hidden items-center gap-2 lg:flex">
					{actions}
					<ThemeToggle />
				</div>

				<div className="ml-auto flex items-center gap-1 lg:hidden">
					<ThemeToggle />
					<Sheet open={open} onOpenChange={setOpen}>
						<SheetTrigger asChild>
							<Button variant="ghost" size="icon" aria-label="Open menu">
								<Menu />
							</Button>
						</SheetTrigger>
						<SheetContent side="right" className="w-72">
							<SheetHeader>
								<SheetTitle>Menu</SheetTitle>
								<SheetDescription className="sr-only">Site navigation</SheetDescription>
							</SheetHeader>
							<nav className="flex flex-col gap-1 px-4">
								{children}
							</nav>
							<div className="mt-4 flex flex-col gap-3 border-t px-4 pt-4">
								{actions}
							</div>
						</SheetContent>
					</Sheet>
				</div>
			</div>
		</header>
	);
}

export default Header;
