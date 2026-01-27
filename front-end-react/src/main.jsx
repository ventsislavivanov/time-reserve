import { StrictMode } from 'react'
import { BrowserRouter } from "react-router";

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
				<App/>
			</BrowserRouter>
		</Provider>
	//</StrictMode>,
)
