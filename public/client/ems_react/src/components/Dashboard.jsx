import React, { useEffect, useState } from 'react';
import { useDispatch } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { cookies } from '../store/authSlice';
import { GetDailyTasks } from '../store/dailyTaskSlice';
import { DashboardApi } from '../store/dashboardSlice';
import HomePage from './dashboardHome/HomePage';
import Navbar from './headers/Navbar';

const Dashboard = () => {
	const [page, setpage] = useState(false);
	const navigate = useNavigate();
	const dispatch = useDispatch();
	// dispatch(GetDailyTasks());
	useEffect(() => {
		if (cookies.get('access') === undefined) {
			setpage(false);
			debugger;
			navigate('login');
		} else {
			setpage(true);
			debugger;
			navigate('');
		}
	}, []);

	return (
		<>
			{page === true ? (
				<>
					<Navbar />
					<HomePage />
				</>
			) : (
				navigate('/login')
			)}
		</>
	);
};

export default Dashboard;
