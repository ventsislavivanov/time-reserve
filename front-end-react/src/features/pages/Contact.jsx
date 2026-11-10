import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLocationDot, faPhone, faEnvelope } from '@fortawesome/free-solid-svg-icons';

const Contact = () => (
	<div className="container py-5">
		<div className="text-center mb-5">
			<h1 className="display-4">Contact Us</h1>
			<p className="lead text-muted">We would love to hear from you</p>
		</div>

		<div className="row g-4 justify-content-center">
			<div className="col-md-4">
				<div className="card h-100 text-center shadow-sm">
					<div className="card-body p-4">
						<FontAwesomeIcon icon={faLocationDot} size="2x" className="text-primary mb-3" />
						<h5>Address</h5>
						<p className="text-muted mb-0">123 Lorem Ipsum Street<br />Sofia, Bulgaria</p>
					</div>
				</div>
			</div>
			<div className="col-md-4">
				<div className="card h-100 text-center shadow-sm">
					<div className="card-body p-4">
						<FontAwesomeIcon icon={faPhone} size="2x" className="text-primary mb-3" />
						<h5>Phone</h5>
						<p className="text-muted mb-0">+359 888 123 456</p>
					</div>
				</div>
			</div>
			<div className="col-md-4">
				<div className="card h-100 text-center shadow-sm">
					<div className="card-body p-4">
						<FontAwesomeIcon icon={faEnvelope} size="2x" className="text-primary mb-3" />
						<h5>Email</h5>
						<p className="text-muted mb-0">info@timereserve.example</p>
					</div>
				</div>
			</div>
		</div>

		<p className="text-center text-muted mt-5 mb-0">
			Open Monday – Friday, 09:00 – 18:00. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		</p>
	</div>
);

export default Contact;
