import { ArrowRight, CalendarCheck, Scissors, Users } from 'lucide-react';
import { Link } from 'react-router';
import { Button } from '@/components/ui/button';

const steps = [
	{ icon: Users, title: 'Choose a specialist', text: 'Browse our team and pick the professional that suits you.' },
	{ icon: Scissors, title: 'Pick a service', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' },
	{ icon: CalendarCheck, title: 'Book your time', text: 'Select a free slot and confirm your appointment in seconds.' }
];

const Home = () => (
	<>
		<section className="relative overflow-hidden border-b bg-gradient-to-b from-accent/60 to-background">
			<div className="mx-auto max-w-4xl px-4 py-24 text-center">
				<span className="mb-4 inline-block rounded-full border bg-card px-3 py-1 text-xs font-medium text-muted-foreground">
					Online booking, made simple
				</span>
				<h1 className="text-4xl font-bold sm:text-6xl">
					Book your next appointment with <span className="text-primary">Time Reserve</span>
				</h1>
				<p className="mx-auto mt-6 max-w-2xl text-lg text-muted-foreground">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.
				</p>
				<div className="mt-8 flex flex-wrap justify-center gap-3">
					<Button size="lg" asChild>
						<Link to="/our-team">Meet our team <ArrowRight /></Link>
					</Button>
					<Button size="lg" variant="outline" asChild>
						<Link to="/services">View services</Link>
					</Button>
				</div>
			</div>
		</section>

		<section className="mx-auto w-full max-w-7xl px-4 py-16">
			<h2 className="mb-10 text-center text-3xl">How it works</h2>
			<div className="grid gap-6 md:grid-cols-3">
				{steps.map((step, index) => (
					<div key={step.title} className="rounded-2xl border bg-card p-8 text-center shadow-sm transition-shadow hover:shadow-md">
						<div className="mx-auto mb-5 flex size-14 items-center justify-center rounded-2xl bg-primary/10 text-primary">
							<step.icon className="size-7" />
						</div>
						<p className="mb-1 text-xs font-semibold uppercase tracking-wider text-muted-foreground">Step {index + 1}</p>
						<h3 className="mb-2 text-lg">{step.title}</h3>
						<p className="text-muted-foreground">{step.text}</p>
					</div>
				))}
			</div>
		</section>
	</>
);

export default Home;
