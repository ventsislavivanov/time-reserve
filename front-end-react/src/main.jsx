import { StrictMode } from 'react'
import { BrowserRouter } from "react-router";
import { GoogleReCaptchaProvider } from 'react-google-recaptcha-v3';
import { ThemeProvider } from 'next-themes';

import { createRoot } from 'react-dom/client'
import App from './App.jsx'

import './utils/fontawesome.js';

import { AuthProvider } from "./context";

import '@fontsource-variable/inter';
import './index.css';

createRoot(document.getElementById('root')).render(
	//<StrictMode>
		<ThemeProvider attribute="class" defaultTheme="system" enableSystem disableTransitionOnChange>
			<BrowserRouter>
				<AuthProvider>
					<GoogleReCaptchaProvider
						reCaptchaKey={import.meta.env.VITE_RECAPTCHA_SITE_KEY}
						scriptProps={{ async: true, defer: true, appendTo: 'head', }}
					>
						<App/>
					</GoogleReCaptchaProvider>
				</AuthProvider>
			</BrowserRouter>
		</ThemeProvider>
	//</StrictMode>,
)
