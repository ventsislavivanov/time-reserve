import styles from '../skeleton-list/SkeletonList.module.css';
import { UICard } from '../../../index.js';

const ServiceCard = () => {
	return (
		<UICard className="h-100 shadow-sm border-0">
			<div
				className={`${styles.skeleton}`}
				style={{ height: '200px', borderRadius: '8px 8px 0 0' }}
			></div>

			<div className="card-body">
				<div className="d-flex justify-content-between align-items-start mb-3">
					<div className={`${styles.skeleton}`} style={{ height: '24px', width: '60%' }}></div>
					<div className={`${styles.skeleton}`} style={{ height: '20px', width: '25%', borderRadius: '10px' }}></div>
				</div>

				<div className={`${styles.skeleton} mb-2`} style={{ height: '14px', width: '90%' }}></div>
				<div className={`${styles.skeleton} mb-3`} style={{ height: '14px', width: '70%' }}></div>

				<div className="d-flex justify-content-between align-items-center mt-auto">
					<div className={`${styles.skeleton}`} style={{ height: '16px', width: '30%' }}></div>
					<div className={`${styles.skeleton}`} style={{ height: '20px', width: '20%' }}></div>
				</div>
			</div>
		</UICard>
	);
};

export default ServiceCard;