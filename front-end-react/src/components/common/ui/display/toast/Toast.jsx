import { Slide, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import './Toast.module.css';

 const Toast = () => {
	 return (
		 <ToastContainer
			position="bottom-right"
			autoClose={3500}
			hideProgressBar={false}
			newestOnTop={true}
			closeOnClick
			rtl={false}
			pauseOnFocusLoss
			draggable
			pauseOnHover
			theme="dark"
			transition={Slide}
		/>
	);
}

export default Toast