import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
// import checkSlice, { checkInActions } from '../../store/checkSlice'
import axios from 'axios';
import { API } from '../../store/authSlice';
import { employeeHeaders } from '../../store/dashboardSlice';

import './ChechInOut.css';

const CheckIn = () => {
	const [checkedInState, setcheckedInState] = useState(false);

	const dispatch = useDispatch();

	const handleChange = async (e) => {
		e.preventDefault();
		const abc = employeeHeaders;
		debugger;
		const resp = await axios.post(`${API}/attendences`, {
			headers: abc,
		});
		console.log('checked in', resp);
		setcheckedInState(true);
	};

	return (
		<>
			{checkedInState === false ? (
				<button
					className="checkinBtn btn btn-success"
					onClick={handleChange}>
					CheckIn
				</button>
			) : (
				<button
					className="checkinBtn btn btn-danger"
					onClick={() => setcheckedInState(false)}>
					CheckOut
				</button>
			)}
		</>
	);
};

export default CheckIn;
