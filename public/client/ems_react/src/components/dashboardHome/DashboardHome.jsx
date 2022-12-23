import React, { useEffect, useState } from 'react';
// import { useSelector } from 'react-redux'
import logo from '../../images/sassLogo.png';
// import DashboardCookies from '../../store/dashboardSlice.js'
import axios from 'axios';
import { API, cookies } from '../../store/authSlice';
import CheckIn from '../checkInOut/CheckIn';

const DashboardHome = () => {
	const [dashboardData, setdashboardData] = useState({});
	const employeeData = cookies.get('empData');

	const data = {
		'access-token': cookies.get('access'),
		client: cookies.get('client'),
		uid: cookies.get('uid'),
	};
	const getData = async () => {
		const resp = await axios.get(`${API}/dashboard`, { headers: data });
		console.log('dashboardData', resp);
		const newData = await resp.data.data;
		setdashboardData(newData);
		debugger;
	};

	useEffect(() => {
		getData();
	}, []);

	return (
		<>
			<div className="">
				<h6>DashboardHome</h6>
				<CheckIn />
				{/* <img src={logo} /> */}
				<div class="card-body">
					<h5 class="card-title">
						Leave <span>| Balance</span>
					</h5>
					<h6> {employeeData.data.leave_count}</h6>
				</div>

				<div class="card-body">
					<h5 class="card-title">
						Shift <span></span>
					</h5>
					<h6>11 AM to 8 PM</h6>
				</div>

				<div>
					<h1 class=" card-title p-4 bi bi-emoji-smile">
						&nbsp; Upcoming Holidays
					</h1>
					<table class="table table-striped holiday">
						<thead>
							<tr>
								<th class="holiday">Date</th>
								<th
									class="holiday"
									scope="col">
									Holiday Name
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="holiday">25 Dec 2022</td>
								<td class="holiday">Christmas day</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h1 class=" card-title p-4 happy-birthdays">Today's Birthdays</h1>

				<div>
					<h1>Recent Joinings</h1>
					<p>{dashboardData.recent_join_employees}</p>
				</div>
			</div>
		</>
	);
};

export default DashboardHome;
