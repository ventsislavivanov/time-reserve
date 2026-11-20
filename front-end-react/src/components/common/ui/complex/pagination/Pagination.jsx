import { ChevronLeft, ChevronRight, ChevronsLeft, ChevronsRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import { NativeSelect } from "../../base/native-select/NativeSelect.jsx";

const Pagination = ({
	currentPage,
	totalPages,
	totalItems,
	itemsPerPage,
	onPageChange,
	onItemsPerPageChange,
}) => {
	const getPageNumbers = () => {
		const pages = [];
		const maxVisibleBefore = 3;
		const maxVisibleAfter = 3;

		for (let i = 1; i <= totalPages; i++) {
			if (
				i === 1 ||
				i === totalPages ||
				(i >= currentPage - maxVisibleBefore && i <= currentPage + maxVisibleAfter)
			) {
				pages.push(i);
			}
		}

		const pagesWithEllipsis = [];
		for (let i = 0; i < pages.length; i++) {
			if (i > 0) {
				if (pages[i] - pages[i - 1] === 2) {
					pagesWithEllipsis.push(pages[i] - 1);
				} else if (pages[i] - pages[i - 1] > 2) {
					pagesWithEllipsis.push("...");
				}
			}
			pagesWithEllipsis.push(pages[i]);
		}

		return pagesWithEllipsis;
	};

	if (totalPages <= 0) return null;

	const atStart = currentPage === 1;
	const atEnd = currentPage === totalPages;

	return (
		<div className="mt-4 flex flex-col items-center justify-between gap-3 px-2 sm:flex-row">
			<div className="flex items-center gap-2 text-sm text-muted-foreground">
				<span>Show</span>
				<div className="w-20">
					<NativeSelect
						className="h-8"
						value={itemsPerPage}
						onChange={(e) => onItemsPerPageChange(Number(e.target.value))}
					>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</NativeSelect>
				</div>
				<span>entries of {totalItems}</span>
			</div>

			<nav aria-label="Page navigation" className="flex items-center gap-1">
				<Button variant="outline" size="icon-sm" disabled={atStart} onClick={() => onPageChange(1)} title="First Page">
					<ChevronsLeft />
				</Button>
				<Button variant="outline" size="icon-sm" disabled={atStart} onClick={() => onPageChange(currentPage - 1)} title="Previous">
					<ChevronLeft />
				</Button>

				{getPageNumbers().map((page, index) =>
					page === '...' ? (
						<span key={index} className="px-1 text-muted-foreground">…</span>
					) : (
						<Button
							key={index}
							size="icon-sm"
							variant={page === currentPage ? "default" : "ghost"}
							aria-current={page === currentPage ? "page" : undefined}
							onClick={() => onPageChange(page)}
						>
							{page}
						</Button>
					)
				)}

				<Button variant="outline" size="icon-sm" disabled={atEnd} onClick={() => onPageChange(currentPage + 1)} title="Next">
					<ChevronRight />
				</Button>
				<Button variant="outline" size="icon-sm" disabled={atEnd} onClick={() => onPageChange(totalPages)} title="Last Page">
					<ChevronsRight />
				</Button>
			</nav>
		</div>
	);
};

export default Pagination;
