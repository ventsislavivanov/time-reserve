export default function Footer() {
	const date = new Date();
	const  year = date.getFullYear();
	
	return (
		<footer className="text-center py-3 bg-primary text-white">
			&copy; {year} MovieSearch. All rights reserved.
		</footer>
	);
}