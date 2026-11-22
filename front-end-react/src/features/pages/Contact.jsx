import { Mail, MapPin, Phone } from 'lucide-react';

const items = [
	{ icon: MapPin, title: 'Address', text: <>123 Lorem Ipsum Street<br />Sofia, Bulgaria</> },
	{ icon: Phone, title: 'Phone', text: '+359 888 123 456' },
	{ icon: Mail, title: 'Email', text: 'info@timereserve.example' },
];

const Contact = () => (
	<div className="mx-auto w-full max-w-5xl px-4 py-16">
		<div className="mb-12 text-center">
			<h1 className="text-4xl font-bold">Contact us</h1>
			<p className="mt-2 text-lg text-muted-foreground">We would love to hear from you</p>
		</div>

		<div className="grid gap-6 md:grid-cols-3">
			{items.map((item) => (
				<div key={item.title} className="rounded-2xl border bg-card p-8 text-center shadow-sm">
					<div className="mx-auto mb-4 flex size-12 items-center justify-center rounded-xl bg-primary/10 text-primary">
						<item.icon className="size-6" />
					</div>
					<h3 className="mb-1 text-base">{item.title}</h3>
					<p className="text-muted-foreground">{item.text}</p>
				</div>
			))}
		</div>

		<p className="mt-12 text-center text-muted-foreground">
			Open Monday – Friday, 09:00 – 18:00. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		</p>
	</div>
);

export default Contact;
