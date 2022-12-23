import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { GetDailyTasks } from '../../store/dailyTaskSlice';
import DailyTask from './DailyTask';

const Base = () => {
	const [page, setPage] = useState(false);
	// const dispatch = useDispatch();
	// dispatch(GetDailyTasks());
	// const selector = useSelector((state) => state.dailyTask.taskData);
	// debugger;

	return (
		<>
			<DailyTask />
		</>
	);
};

export default Base;
