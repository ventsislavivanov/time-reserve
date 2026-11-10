import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUsers, faScissors, faCalendarCheck } from '@fortawesome/free-solid-svg-icons';
import { Link } from 'react-router';

const steps = [
	{ icon: faUsers, title: 'Choose a specialist', text: 'Browse our team and pick the professional that suits you.' },
	{ icon: faScissors, title: 'Pick a service', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' },
	{ icon: faCalendarCheck, title: 'Book your time', text: 'Select a free slot and confirm your appointment in seconds.' }
];

const Home = () => (
	<>
		<section className="bg-primary text-white text-center py-5">
			<div className="container py-5">
				<h1 className="display-4 fw-bold">Welcome to Time Reserve</h1>
				<p className="lead mb-4">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.
				</p>
				<Link to="/our-team" className="btn btn-light btn-lg m-1">Meet our team</Link>
				<Link to="/services" className="btn btn-outline-light btn-lg m-1">View services</Link>
			</div>
		</section>

		<section className="container py-5">
			<h2 className="text-center mb-4">How it works</h2>
			<div className="row g-4">
				{steps.map(step => (
					<div key={step.title} className="col-md-4">
						<div className="card h-100 text-center shadow-sm">
							<div className="card-body p-4">
								<FontAwesomeIcon icon={step.icon} size="3x" className="text-primary mb-3" />
								<h5 className="card-title">{step.title}</h5>
								<p className="card-text text-muted">{step.text}</p>
							</div>
						</div>
					</div>
				))}
			</div>
		</section>
	</>
);

export default Home;
