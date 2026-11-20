import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
	Dialog,
	DialogContent,
	DialogDescription,
	DialogFooter,
	DialogHeader,
	DialogTitle,
} from "@/components/ui/dialog";
import { cn } from "@/lib/utils";
import { hideModal, useModalOpen } from "../../../../../hooks/useBootstrapModal.js";

const SIZES = {
	"modal-sm": "sm:max-w-sm",
	"modal-md": "sm:max-w-lg",
	"modal-lg": "sm:max-w-3xl",
	"modal-xl": "sm:max-w-5xl",
};

// Opened and closed through showModal(id) / hideModal(id) from hooks/useBootstrapModal.
const UIModal = ({
	id,
	title,
	icon,
	children,
	footer,
	size = "modal-md",
	staticBackdrop = false,
	onClose,
}) => {
	const open = useModalOpen(id);

	const handleOpenChange = (next) => {
		if (next) return;
		hideModal(id);
		onClose?.();
	};

	const blockIfStatic = (e) => staticBackdrop && e.preventDefault();

	return (
		<Dialog open={open} onOpenChange={handleOpenChange}>
			<DialogContent
				className={cn("flex max-h-[90vh] flex-col gap-0 p-0", SIZES[size] ?? SIZES["modal-md"])}
				onInteractOutside={blockIfStatic}
				onEscapeKeyDown={blockIfStatic}
			>
				<DialogHeader className="border-b px-6 py-4">
					<DialogTitle className="flex items-center gap-2 pr-6">
						{icon && <FontAwesomeIcon icon={icon} className="text-primary" />}
						{title}
					</DialogTitle>
					<DialogDescription className="sr-only">{title}</DialogDescription>
				</DialogHeader>

				<div className="flex-1 overflow-y-auto px-6 py-5">
					{children}
				</div>

				{footer && (
					<DialogFooter className="border-t px-6 py-4">
						{footer}
					</DialogFooter>
				)}
			</DialogContent>
		</Dialog>
	);
};

export default UIModal;
