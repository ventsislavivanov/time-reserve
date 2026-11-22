const About = () => (
	<div className="mx-auto w-full max-w-5xl px-4 py-16">
		<div className="mb-12 text-center">
			<h1 className="text-4xl font-bold">About us</h1>
			<p className="mt-2 text-lg text-muted-foreground">Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
		</div>

		<div className="grid items-center gap-10 md:grid-cols-2">
			<div className="space-y-4">
				<h2>Our story</h2>
				<p className="text-muted-foreground">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris nisi ut aliquip ex ea commodo consequat.
				</p>
				<p className="text-muted-foreground">
					Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident.
				</p>
			</div>
			<div className="rounded-2xl border bg-accent/50 p-8">
				<h3 className="mb-3">Our mission</h3>
				<p className="text-muted-foreground">
					Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
					laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis.
				</p>
			</div>
		</div>
	</div>
);

export default About;
