const Footer = () => {
	const date = new Date();
	const  year = date.getFullYear();

	return (
		<footer className="text-center py-3 bg-primary text-white">
			&copy; {year} Time Reserve. All rights reserved.
		</footer>
	);
}

export default Footer;