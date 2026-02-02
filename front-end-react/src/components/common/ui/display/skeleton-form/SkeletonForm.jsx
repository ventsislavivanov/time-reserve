import styles from './SkeletonForm.module.css';

const SkeletonForm = ({ fields = 5 }) => {
	return (
		<div className="card p-4">
			<div className={`${styles.skeleton} ${styles.skeletonLabel} mb-4`} style={{ width: '40%' }}></div>

			{[...Array(fields)].map((_, index) => (
				<div key={index}>
					<div className={`${styles.skeleton} ${styles.skeletonLabel}`} style={{ width: '30%' }}></div>
					<div className={`${styles.skeleton} ${styles.skeletonInput}`}></div>
				</div>
			))}

			<div className={`${styles.skeleton} ${styles.skeletonButton}`}></div>
		</div>
	);
};

export default SkeletonForm;