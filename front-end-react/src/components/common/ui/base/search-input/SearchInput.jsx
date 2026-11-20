import { Search } from "lucide-react";
import { Input } from "@/components/ui/input";
import { cn } from "@/lib/utils";

const SearchInput = ({
	value,
	onChange,
	placeholder = "Search...",
	className = "",
	type = "text"
}) => {
	return (
		<div className={cn("relative w-full md:max-w-xs", className)}>
			<Search className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
			<Input
				type={type}
				className="pl-9"
				placeholder={placeholder}
				value={value}
				onChange={(e) => onChange(e.target.value)}
			/>
		</div>
	);
};

export default SearchInput;
