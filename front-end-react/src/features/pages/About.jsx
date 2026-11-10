const About = () => (
	<div className="container py-5">
		<div className="text-center mb-5">
			<h1 className="display-4">About Us</h1>
			<p className="lead text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
		</div>

		<div className="row g-4 align-items-center">
			<div className="col-md-6">
				<h3>Our story</h3>
				<p className="text-muted">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris nisi ut aliquip ex ea commodo consequat.
				</p>
				<p className="text-muted">
					Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident.
				</p>
			</div>
			<div className="col-md-6">
				<div className="card shadow-sm">
					<div className="card-body p-4">
						<h3>Our mission</h3>
						<p className="text-muted mb-0">
							Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
							laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
);

export default About;
