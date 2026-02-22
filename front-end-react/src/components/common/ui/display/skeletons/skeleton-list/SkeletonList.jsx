import styles from './SkeletonList.module.css';

const SkeletonList = ({ rows = 5 }) => {
	return (
		<div className="card p-4">
			<div className={styles.header}>
				<div className={`${styles.skeleton} ${styles.skeletonHeaderTitle}`}></div>
			</div>

			{[...Array(rows)].map((_, index) => (
				<div key={index} className={styles.listItem}>
					<div className={`${styles.skeleton} ${styles.skeletonTitle}`}></div>
					<div className={`${styles.skeleton} ${styles.skeletonText}`}></div>
					<div className="d-flex gap-2 mt-3">
						<div className={`${styles.skeleton} ${styles.skeletonActions}`}></div>
						<div className={`${styles.skeleton} ${styles.skeletonActions}`}></div>
					</div>
				</div>
			))}
		</div>
	);
};

export default SkeletonList;