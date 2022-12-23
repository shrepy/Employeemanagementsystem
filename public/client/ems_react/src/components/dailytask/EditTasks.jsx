import * as React from 'react';
import Backdrop from '@mui/material/Backdrop';
import Box from '@mui/material/Box';
import Modal from '@mui/material/Modal';
import Fade from '@mui/material/Fade';
import Button from '@mui/material/Button';
import { TextField } from '@mui/material';
import axios from 'axios';
import { API, cookies } from '../../store/authSlice';
import { employeeHeaders } from '../../store/dashboardSlice';

const style = {
	position: 'absolute',
	top: '50%',
	left: '50%',
	transform: 'translate(-50%, -50%)',
	width: 400,
	bgcolor: 'background.paper',
	border: '2px solid #000',
	boxShadow: 24,
	p: 4,
};

export default function EditTask(props) {
	const [open, setOpen] = React.useState(false);
	const handleOpen = () => setOpen(true);
	const handleClose = () => setOpen(false);
	const [description, setDescription] = React.useState('');

	const handleChange = async (e) => {
		e.preventDefault();
		// const bodyData = {
		// 	'daily_task[employee_id]': cookies.get('employeeId'),
		// 	'daily_task[description]': description,
		// };
		const bodyData = {
			daily_task: {
				employee_id: cookies.get('employeeId'),
				description: description,
			},
		};

		const resp = await axios.patch(
			`${API}/daily_tasks/${props.data.id}`,
			bodyData,
			{
				headers: employeeHeaders,
			}
		);
		console.log('DailyTaskUpdatedSuccessFully', resp);
		handleClose();
		window.location.reload();
	};

	React.useEffect(() => {
		setDescription(props.data.description);
	}, []);

	return (
		<div>
			<Button
				style={{
					marginLeft: '90%',
					marginTop: '8px',
					backgroundColor: 'burlywood',
					fontSize: '11px',
				}}
				onClick={handleOpen}>
				Edit Today's Task
			</Button>
			<Modal
				aria-labelledby="transition-modal-title"
				aria-describedby="transition-modal-description"
				open={open}
				onClose={handleClose}
				closeAfterTransition
				BackdropComponent={Backdrop}
				BackdropProps={{
					timeout: 500,
				}}>
				<Fade in={open}>
					<Box sx={style}>
						{/* <Typography id="transition-modal-title" variant="h6" component="h2">
              Text in a modal
            </Typography>
            <Typography id="transition-modal-description" sx={{ mt: 2 }}>
              Duis mollis, est non commodo luctus, nisi erat porttitor ligula.
            </Typography> */}
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
					</Box>
				</Fade>
			</Modal>
		</div>
	);
}
