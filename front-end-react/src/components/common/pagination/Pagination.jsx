import React from 'react';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function Pagination({
	currentPage,
	totalPages,
	onPageChange,
	itemsPerPage,
	onItemsPerPageChange,
	totalItems
}) {
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

	return (
		<div className="d-flex justify-content-between align-items-center mt-3 px-2">
			<div className="d-flex align-items-center gap-2">
				<span className="text-muted small">Show</span>
				<select
					className="form-select form-select-sm"
					style={{ width: 'auto' }}
					value={itemsPerPage}
					onChange={(e) => onItemsPerPageChange(Number(e.target.value))}
				>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
				</select>
				<span className="text-muted small">entries of {totalItems}</span>
			</div>

			<nav aria-label="Page navigation">
				<ul className="pagination pagination-sm mb-0">
					<li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
						<button className="page-link"
								onClick={() => onPageChange(1)}
								title="First Page"
						>
							<FontAwesomeIcon icon="angle-double-left" />
						</button>
					</li>

					<li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
						<button className="page-link"
								onClick={() => onPageChange(currentPage - 1)}
								title="Previous"
						>
							<FontAwesomeIcon icon="angle-left" />
						</button>
					</li>

					{getPageNumbers().map((page, index) => (
						<li key={index}
							className={`
								page-item
								${page === currentPage ? 'active' : ''}
								${page === '...' ? 'disabled' : ''}
							`}
						>
							<button
								className="page-link"
								onClick={() => typeof page === 'number' && onPageChange(page)}
							>
								{page}
							</button>
						</li>
					))}

					<li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
						<button className="page-link"
								onClick={() => onPageChange(currentPage + 1)}
								title="Next"
						>
							<FontAwesomeIcon icon="angle-right" />
						</button>
					</li>

					<li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
						<button className="page-link"
								onClick={() => onPageChange(totalPages)}
								title="Last Page"
						>
							<FontAwesomeIcon icon="angle-double-right" />
						</button>
					</li>
				</ul>
			</nav>
		</div>
	);
};
