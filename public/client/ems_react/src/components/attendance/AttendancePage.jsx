import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { API } from '../../store/authSlice';
import { employeeHeaders } from '../../store/dashboardSlice';

const AttendancePage = () => {
	const [attendanceData, setAttendanceData] = useState({});

	const AttendanceApi = async () => {
		const resp = await axios.get(`${API}/attendences`, {
			headers: employeeHeaders,
		});
		console.log('attendance', resp);
		const newData = await resp.data.data;
		setAttendanceData(newData);
	};

	useEffect(() => {
		AttendanceApi();
	}, []);

	const aryData = Object.keys(attendanceData);

	return (
		<>
			<div className="dashboard-card">
				<h2>Attendance Page</h2>
				<br />

				<table className="table table-group-divider ">
					<thead className="table-dark">
						<tr>
							<th>Date</th>
							<th>Check-in Time</th>
							<th>Check-out Time</th>
							<th>Working Hours</th>
							{/* <th></th> */}
						</tr>
					</thead>
					<tbody className="table-group-divider table-primary table-hover">
						{aryData.map((keys) => {
							const abc = attendanceData[keys];
							const dates = `${abc.checkin_time.split(' ')[2]} ${
								abc.checkin_time.split(' ')[1]
							} ${abc.checkin_time.split(' ')[3]}, ${
								abc.checkin_time.split(' ')[0]
							} `;

							const checkoutTime =
								abc.checkout_time &&
								`${abc.checkout_time.split(' ')[4]} ${
									abc.checkout_time.split(' ')[5]
								}`;
							const checkinTime =
								abc.checkin_time &&
								`${abc.checkin_time.split(' ')[4]} ${
									abc.checkin_time.split(' ')[5]
								}`;

							const total_time =
								abc.hour &&
								`${abc.hour.split(':')[0]} hours, ${
									abc.hour.split(':')[1]
								} min.`;
							debugger;
							return (
								<>
									<tr>
										<td>{dates}</td>
										<td>{checkinTime}</td>
										<td>{checkoutTime}</td>
										<td>{total_time}</td>
										{/* <td>{<button disabled>View</button>}</td> */}
									</tr>
								</>
							);
						})}
					</tbody>
				</table>
			</div>
		</>
	);
};

export default AttendancePage;
