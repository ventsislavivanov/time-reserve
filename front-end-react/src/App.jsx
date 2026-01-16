import { Route, Routes } from "react-router";
// import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'

import Header from "./components/header/Header.jsx";
import Footer from "./components/footer/Footer.jsx";
import Login from "./components/login/Login.jsx";
import SignUp from "./components/sign-up/SignUp.jsx";

function App() {

	return (
		<>
			<Header />

			<Routes>
				<Route path="/" element={<h1>Home</h1>} />

				<Route path="/login" element={<Login/>}/>
				<Route path="/sign-up" element={<SignUp/>}/>
			</Routes>

			<Footer />
		</>
	)
}

export default App
