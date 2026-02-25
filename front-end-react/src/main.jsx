import { StrictMode } from 'react'
import { BrowserRouter } from "react-router";
import { GoogleReCaptchaProvider } from 'react-google-recaptcha-v3';

import { createRoot } from 'react-dom/client'
import App from './App.jsx'

import './utils/fontawesome.js';

import { Provider } from "react-redux";
import { store } from "./store";

import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootswatch/dist/spacelab/bootstrap.min.css';

createRoot(document.getElementById('root')).render(
	//<StrictMode>
		<Provider store={store}>
			<BrowserRouter>
				<GoogleReCaptchaProvider
					reCaptchaKey={import.meta.env.VITE_RECAPTCHA_SITE_KEY}
					scriptProps={{ async: true, defer: true, appendTo: 'head', }}
				>
					<App/>
				</GoogleReCaptchaProvider>
			</BrowserRouter>
		</Provider>
	//</StrictMode>,
)
