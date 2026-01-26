import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const SearchInput = ({
	value,
	onChange,
	placeholder = "Search...",
	icon = "search",
	className = "col-md-4",
	type = "text"
}) => {
	return (
		<div className={className}>
			<div className="input-group">
                <span className="input-group-text bg-white border-end-0">
                    <FontAwesomeIcon icon={icon} className="text-muted" />
                </span>
				<input
					type={type}
					className="form-control border-start-0"
					placeholder={placeholder}
					value={value}
					onChange={(e) => onChange(e.target.value)}
				/>
			</div>
		</div>
	);
};

export default SearchInput;