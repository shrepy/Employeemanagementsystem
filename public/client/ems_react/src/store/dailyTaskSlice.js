import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';
import Cookies from 'universal-cookie';
import { API } from './authSlice';
import { employeeHeaders } from './dashboardSlice';

export const GetDailyTasks = createAsyncThunk('tasksData', async () => {
	const resp = await axios.get(`${API}/daily_tasks`, {
		headers: employeeHeaders,
	});
	debugger;
	const newData = await resp.data.data;
	return newData;
});

const dailyTaskSlice = createSlice({
	name: 'dailyTaskSlice',
	initialState: { isFetched: false },
	tasksData: [],
	reducers: {
		dataStore(state, props) {
			debugger;
			state.tasksData = props.payload;
		},
	},
	extraReducers: {
		[GetDailyTasks.fulfilled]: (state, action) => {
			state.isFetched = true;
			state.tasksData = action.payload;
			debugger;
		},
	},
});

export const dailyTaskActions = dailyTaskSlice.actions;

export default dailyTaskSlice;
