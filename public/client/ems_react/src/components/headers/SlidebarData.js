import React from 'react';

import * as FaIcons from 'react-icons/fa';
import * as AiIcons from 'react-icons/ai';
import * as IoIcons from 'react-icons/io';

export const SidebarData = [
	{
		title: 'Dashboard',
		path: '/',
		func: '() => {dispatch(DashboardApi())}',
		icon: <AiIcons.AiFillHome />,
		cName: 'nav-text',
	},
	{
		title: 'Performance',
		path: '/performance',
		icon: <IoIcons.IoIosPaper />,
		cName: 'nav-text',
	},
	{
		title: 'Salary',
		path: '/salary',
		icon: <FaIcons.FaMoneyBill />,
		cName: 'nav-text',
	},
	{
		title: 'Leave',
		path: '/leave',
		icon: <FaIcons.FaSignOutAlt />,
		cName: 'nav-text',
	},
	{
		title: 'Attendance',
		path: '/attendance',
		icon: <FaIcons.FaChartArea />,
		cName: 'nav-text',
	},
	{
		title: 'Holidays',
		path: '/holidays',
		icon: <FaIcons.FaBed />,
		cName: 'nav-text',
	},
	{
		title: 'Daily Task',
		path: '/dailyTask',
		func: '() => {dispatch(getDailyTasks)}',
		icon: <FaIcons.FaEnvelopeOpenText />,
		cName: 'nav-text',
	},
	{
		title: 'Ticket',
		path: '/ticket',
		icon: <FaIcons.FaTicketAlt />,
		cName: 'nav-text',
	},
];
