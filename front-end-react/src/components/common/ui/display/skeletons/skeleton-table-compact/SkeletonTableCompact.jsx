import styles from './SkeletonTableCompact.module.css';

const SkeletonTableCompact = ({ rows = 8, columns = 5 }) => {
	const randomWidth = () => `${Math.floor(50 + Math.random() * 40)}%`;

	return (
		<div className="table-responsive">
			<table className="table table-sm align-middle">
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

export default SkeletonTableCompact;
