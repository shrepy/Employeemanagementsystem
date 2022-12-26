import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { API } from '../../store/authSlice';
import { employeeHeaders } from '../../store/dashboardSlice';
import AddTicket from './AddTicket';

const TicketPage = () => {
	const [ticketData, setTicketData] = useState({});

	const getData = async () => {
		const resp = await axios.get(`${API}/tickets`, {
			headers: employeeHeaders,
		});
		console.log('Ticket REsp', resp);
		const newData = await resp.data.data;
		setTicketData(newData);
	};

	const getDate = (props) => {
		const newDate = props.created_at.split('T')[0].split('-');
		const finalDate = `${newDate[2]}/${newDate[1]}/${newDate[0]}`;
		return (
			<>
				<p>{finalDate}</p>
			</>
		);
	};

	useEffect(() => {
		getData();
	}, []);

	const checkFunc = (data) => {
		// e.preventDefault();
		// debugger;
		setTicketData([...ticketData, data]);
	};

	const newAry = Object.keys(ticketData);
	debugger;

	return (
		<>
			<div className="dashboard-card">
				<div>
					<h2>Tickets</h2>
				</div>
				<br />
				<AddTicket onChangeFun={checkFunc} />
				<br />
				<br />
				<div>
					<table className="table table-responsive-lg">
						<thead>
							<tr>
								<th>Date</th>
								<th>Description</th>
								<th>Ticket Type</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							{newAry.map((keys, value) => {
								debugger;
								return (
									<>
										<tr>
											<td>{getDate(ticketData[keys])}</td>
											<td>{ticketData[keys].description}</td>
											<td>{ticketData[keys].ticket_type}</td>
											<td>{ticketData[keys].status}</td>
										</tr>
									</>
								);
							})}
						</tbody>
					</table>
				</div>
			</div>
		</>
	);
};

export default TicketPage;
