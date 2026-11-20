import SkeletonTable from '../skeleton-table/SkeletonTable.jsx';

const SkeletonTableCompact = ({ rows = 8, columns = 5 }) => (
	<SkeletonTable rows={rows} columns={columns} compact />
);

export default SkeletonTableCompact;
