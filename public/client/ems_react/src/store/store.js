import { configureStore } from '@reduxjs/toolkit';
import authSlice from './authSlice';
import checkSlice from './checkSlice';
import dailyTaskSlice from './dailyTaskSlice';
import dashboardSlice from './dashboardSlice';
import leaveSlice from './leavesSlice';

const store = configureStore({
	reducer: {
		auth: authSlice.reducer,
		checkInSlice: checkSlice.reducer,
		dashboard: dashboardSlice.reducer,
		leaveSlice: leaveSlice.reducer,
		dailyTasks: dailyTaskSlice.reducer,
	},
});

export default store;
