import { MoreVertical } from "lucide-react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button } from "@/components/ui/button";
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu";
import { cn } from "@/lib/utils";
import { UIButton, UILoadingButton } from "../../";

const ALIGN = { start: "justify-start", center: "justify-center", end: "justify-end" };

const UIRowActions = ({ actions = [], align = "end" }) => {
	if (!actions.length) return null;

	return (
		<div>
			{/* DESKTOP */}
			<div className={cn("hidden gap-2 md:flex", ALIGN[align])}>
				{actions.map(action => {
					const {
						id,
						loading,
						loadingLabel,
						label,
						...buttonProps
					} = action;

					const ButtonComponent = loading ? UILoadingButton : UIButton;

					return (
						<ButtonComponent
							key={id ?? buttonProps.title ?? label}
							loading={loading || undefined}
							{...buttonProps}
							size={buttonProps.size ?? "sm"}
						>
							{loading ? loadingLabel : label}
						</ButtonComponent>
					);
				})}
			</div>

			{/* MOBILE */}
			<div className="text-end md:hidden">
				<DropdownMenu>
					<DropdownMenuTrigger asChild>
						<Button variant="outline" size="icon-sm" aria-label="Actions">
							<MoreVertical />
						</Button>
					</DropdownMenuTrigger>
					<DropdownMenuContent align="end">
						{actions.map(action => {
							const { id, icon, iconClassName, label, title, onClick } = action;

							return (
								<DropdownMenuItem key={id ?? title ?? label} onSelect={() => onClick?.()}>
									{icon && <FontAwesomeIcon icon={icon} className={iconClassName} fixedWidth />}
									{label || title}
								</DropdownMenuItem>
							);
						})}
					</DropdownMenuContent>
				</DropdownMenu>
			</div>
		</div>
	);
};

export default UIRowActions;
