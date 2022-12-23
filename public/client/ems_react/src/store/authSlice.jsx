import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';
import Cookies from 'universal-cookie';

export const API = 'http://localhost:3000/api/v1';

export const LogoutEmployee = createAsyncThunk('employeeLogout', async () => {
	const LogoutData = {
		'access-token': cookies.get('access'),
		client: cookies.get('client'),
		// expiry:cookies.get('expiry'),
		uid: cookies.get('uid'),
	};

	const resp = await axios.get(`${API}/auth/sign_out/`, {
		headers: LogoutData,
	});
	return resp;
});

export const LoginCheck2 = createAsyncThunk('userLogin', async (props) => {
	const data = { email: props.email, password: props.password };
	const resp = await axios.post(`${API}/auth/sign_in`, data);
	console.log('LoginData', resp);

	// const dashboardResp = await axios.get(`${API}/dashboard`,{headers:dashboardApi})
	return resp;
});

export const cookies = new Cookies();

const authSlice = createSlice({
	name: 'auth',
	initialState: { isLoggedIn: false },
	userData: [],
	reducers: {
		// login (state,props) {
		//     const loginArry = props.payload
		//     state.isLoggedIn = true
		//     LoginCheck2(loginArry)
		//  },
	},
	extraReducers: {
		[LoginCheck2.fulfilled]: (state, action) => {
			state.isLoggedIn = true;
			state.userData = action.payload;
			cookies.set('access', action.payload.headers['access-token']);
			cookies.set('client', action.payload.headers.client);
			cookies.set('uid', action.payload.headers.uid);
			cookies.set('expiry', action.payload.headers.expiry);
			const employeeData = action.payload.data;
			debugger;
			cookies.set('employeeId', employeeData.data.id);
			cookies.set('empData', employeeData);
			window.location.replace('/');
		},
		[LoginCheck2.rejected]: (state, action) => {
			state.isLoggedIn = false;
			alert('Wrong Credentials');
		},

		[LogoutEmployee.fulfilled]: (state) => {
			cookies.remove('access');
			cookies.remove('client');
			cookies.remove('uid');
			cookies.remove('expiry');
			cookies.remove('employeeId');
			cookies.remove('empData');
			localStorage.clear();
			debugger;
			window.location.replace('/login');
		},
	},
});

export const authActions = authSlice.actions;

export default authSlice;
