import * as React from 'react';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import { FormControl, InputLabel, MenuItem, Select } from '@mui/material';

//Headers and API imports.
import { API } from '../../store/authSlice';
import { employeeHeaders } from '../../store/dashboardSlice';
import axios from 'axios';
import TicketPage from './TicketPage';

export default function AddTicket({ onChangeFun }) {
	const [open, setOpen] = React.useState(false);

	const [type, setType] = React.useState('');
	const [description, setDescription] = React.useState('');

	const handleChange = async (e) => {
		e.preventDefault();
		const data = {
			ticket: {
				ticket_type: type,
				description: description,
			},
		};
		debugger;
		const resp = await axios.post(`${API}/tickets`, data, {
			headers: employeeHeaders,
		});
		onChangeFun(resp.data.data);
		setOpen(false);
		// return <TicketPage props />;
	};

	const handleClickOpen = () => {
		setOpen(true);
	};

	const handleClose = () => {
		setOpen(false);
	};

	return (
		<div>
			<button onClick={handleClickOpen}>Add Ticket</button>
			<Dialog
				open={open}
				onClose={handleClose}>
				<DialogTitle>Add Ticket</DialogTitle>
				<DialogContent>
					<FormControl fullWidth>
						<InputLabel id="demo-simple-select-label">Select Type</InputLabel>
						<Select
							labelId="demo-simple-select-label"
							value={type}
							label="Employee"
							onChange={(e) => {
								setType(e.target.value);
							}}>
							<MenuItem value={'employee'}>Employee</MenuItem>
							<MenuItem value={'management'}>Management</MenuItem>
						</Select>
					</FormControl>
					<TextField
						autoFocus
						multiline={true}
						fullWidth
						rows={6}
						onChange={(e) => setDescription(e.target.value)}
						label="Enter some text here."
						type="text"
						variant="standard"
					/>
				</DialogContent>
				<DialogActions>
					<Button onClick={handleClose}>Cancel</Button>
					<Button onClick={handleChange}>Submit</Button>
				</DialogActions>
			</Dialog>
		</div>
	);
}
