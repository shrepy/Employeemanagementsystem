import * as React from 'react';
import Popover from '@mui/material/Popover';
import Typography from '@mui/material/Typography';

export default function BasicPopover(props) {
	const [anchorEl, setAnchorEl] = React.useState(null);

	const handlePopoverOpen = (event) => {
		setAnchorEl(event.currentTarget);
	};

	const handlePopoverClose = () => {
		setAnchorEl(null);
	};

	const open = Boolean(anchorEl);

	// const buttonText = '';

	const textSplit = props.props.split(' ');
	const buttonText = textSplit[0];
	// if (textSplit.length() >= 3) {
	// } else {
	// 	buttonText = textSplit[0];
	// }

	return (
		<div>
			<Typography
				aria-owns={open ? 'mouse-over-popover' : undefined}
				aria-haspopup="true"
				onMouseEnter={handlePopoverOpen}
				style={{ boxSizing: 'border-box' }}
				onMouseLeave={handlePopoverClose}>
				{buttonText}
			</Typography>
			<Popover
				id="mouse-over-popover"
				sx={{
					pointerEvents: 'none',
				}}
				open={open}
				anchorEl={anchorEl}
				anchorOrigin={{
					vertical: 'bottom',
					horizontal: 'left',
				}}
				transformOrigin={{
					vertical: 'top',
					horizontal: 'left',
				}}
				onClose={handlePopoverClose}
				disableRestoreFocus>
				<Typography sx={{ p: 1 }}>{props.props}</Typography>
			</Popover>
		</div>
	);
}
