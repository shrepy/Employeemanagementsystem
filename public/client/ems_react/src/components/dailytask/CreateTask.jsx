import * as React from 'react';
import Box from '@mui/material/Box';
import Modal from '@mui/material/Modal';
import Button from '@mui/material/Button';
import { TextField } from '@mui/material';
import axios from 'axios';
import { API, cookies } from '../../store/authSlice';
import { employeeHeaders } from '../../store/dashboardSlice';
import { render } from 'react-dom';
import DailyTask from './DailyTask';

const style = {
	position: 'absolute',
	top: '50%',
	left: '50%',
	transform: 'translate(-50%, -50%)',
	width: 400,
	bgcolor: 'background.paper',
	border: '2px solid #000',
	boxShadow: 24,
	pt: 2,
	px: 4,
	pb: 3,
};

export default function CreateTask(props) {
	const [open, setOpen] = React.useState(false);
	const [description, setDescription] = React.useState('');
	console.log(description);
	const handleOpen = () => {
		setOpen(true);
	};
	const handleClose = () => {
		setOpen(false);
	};

	const handleChange = async (e) => {
		e.preventDefault();
		const bodyData = {
			daily_task: {
				employee_id: cookies.get('employeeId'),
				description: description,
			},
		};
		const resp = await axios.post(`${API}/daily_tasks`, bodyData, {
			headers: employeeHeaders,
		});
		console.log('Daily Task Sent', resp);
		// alert("Updated SuccessFully");
		setOpen(false);
		window.location.reload();
	};

	return (
		<div>
			<Button
				style={{
					backgroundColor: 'lightblue',
					fontSize: '11px',
					color: 'black',
					marginLeft: '90%',
				}}
				// className="btn btn-primary"
				onClick={handleOpen}>
				Create Task
			</Button>
			<Modal
				open={open}
				onClose={handleClose}
				aria-labelledby="parent-modal-title"
				aria-describedby="parent-modal-description">
				<Box sx={{ ...style, width: 800, height: 600 }}>
					<h2 id="parent-modal-title">Today Task</h2>
					<p id="parent-modal-description">Description.</p>
					<TextField
						onChange={(e) => setDescription(e.target.value)}
						value={description}
						multiline={true}
						fullWidth
						rows={15}
					/>
					<Button onClick={handleChange}>Submit</Button>
				</Box>
			</Modal>
		</div>
	);
}
