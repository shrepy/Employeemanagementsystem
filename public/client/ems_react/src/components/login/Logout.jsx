import React from 'react';
import { useDispatch } from 'react-redux';
import { LogoutEmployee } from '../../store/authSlice';

const Logout = () => {
	const dispatch = useDispatch();
	const HandleChange = async (e) => {
		e.preventDefault();
		const abc = await dispatch(LogoutEmployee());
	};
	return (
		<>
			<button
				className="logoutBtn btn btn-danger"
				style={{ margin: '2px' }}
				onClick={HandleChange}>
				LogOut
			</button>
		</>
	);
};

export default Logout;
