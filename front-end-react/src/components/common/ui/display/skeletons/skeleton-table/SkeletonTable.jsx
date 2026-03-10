import styles from './SkeletonTable.module.css';

const SkeletonTable = ({ rows = 5, columns = 5 }) => {
	const randomWidth = () => `${Math.floor(60 + Math.random() * 35)}%`;

	return (
		<div className="table-responsive">
			<table className="table">
				<thead>
				<tr>
					{[...Array(columns)].map((_, i) => (
						<th key={i}>
							<div
								className={`${styles.skeleton} ${styles.headerCell}`}
								style={{ width: randomWidth() }}
							></div>
						</th>
					))}
				</tr>
				</thead>

				<tbody>
				{[...Array(rows)].map((_, rowIndex) => (
					<tr key={rowIndex}>
						{[...Array(columns)].map((_, colIndex) => (
							<td key={colIndex}>
								<div
									className={`${styles.skeleton} ${styles.bodyCell}`}
									style={{ width: randomWidth() }}
								></div>
							</td>
						))}
					</tr>
				))}
				</tbody>
			</table>
		</div>
	);
};

export default SkeletonTable;
