import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { employeeHeaders } from '../../store/dashboardSlice';
import { API } from '../../store/authSlice';
import CreateTask from './CreateTask';
import { TextField } from '@mui/material';
import { render } from 'react-dom';
import BasicPopover from './BasicPopover';
import EditTask from './EditTasks';
import { useDispatch, useSelector } from 'react-redux';
import { dailyTaskActions, GetDailyTasks } from '../../store/dailyTaskSlice';

const DailyTask = () => {
	const d = new Date();
	const [tasks, settasks] = useState({});
	const [showButton, setshowButton] = useState(false);
	const [createButton, setcreateButton] = useState(false);
	// const dispatch = useDispatch();

	// const selector = useSelector((state) => state.dailyTasks.taskData);

	const getData = async () => {
		const resp = await axios.get(`${API}/daily_tasks`, {
			headers: employeeHeaders,
		});

		const newData = await resp.data.data;
		settasks(newData);
		debugger;
		if (newData[0].created_at === dateString) {
			setcreateButton(false);
			setshowButton(true);
		} else {
			debugger;
			setcreateButton(true);
		}
		// dispatch(dailyTaskActions.dataStore(newData));
	};
	const months = [
		'Jan',
		'Feb',
		'Mar',
		'Apr',
		'May',
		'Jun',
		'Jul',
		'Aug',
		'Sept',
		'Oct',
		'Nov',
		'Dec',
	];

	const todayDate = d.getDate();
	const month = months[d.getMonth()];
	const year = d.getFullYear();

	const dateString = `${todayDate} ${month} ${year}`;

	useEffect(() => {
		getData();
	}, []);
	const handleChange = () => {};

	const taskAry = Object.keys(tasks);

	return (
		<>
			<div>Daily Status</div>
			<br />
			{createButton && <CreateTask />}
			{showButton && <EditTask data={tasks[0]} />}
			<br />

			<table className="table table-info table-striped ">
				<thead className="">
					<tr>
						<th>Created at</th>
						<th>Updated at</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody className="">
					{taskAry.map((keys) => {
						return (
							<>
								<tr>
									<td>{tasks[keys].created_at}</td>
									<td>{tasks[keys].updated_at}</td>
									<td>
										<BasicPopover props={tasks[keys].description} />
										{/* <button
											className="btn btn-warning btn-sm"
											onMouseOver={handleChange}>
											{tasks[keys].description}
										</button> */}
									</td>
								</tr>
							</>
						);
					})}
				</tbody>
			</table>
		</>
	);
};

export default DailyTask;
