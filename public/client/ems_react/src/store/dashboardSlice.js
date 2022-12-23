import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import Cookies from "universal-cookie";
import { cookies } from "./authSlice";

import { API } from "./authSlice";

export const employeeHeaders = {
  "access-token": cookies.get("access"),
  client: cookies.get("client"),
  uid: cookies.get("uid"),
  expiry: cookies.get("expiry"),
};
export const DashboardApi = createAsyncThunk("dashboardApi", async () => {
  const dashboardResp = await axios.get(`${API}/dashboard`, {
    headers: employeeHeaders,
  });
  debugger;
  console.log("DashboardApi", dashboardResp);
  return dashboardResp;
});

export const DashboardCookies = new Cookies();

const dashboardSlice = createSlice({
  name: "dashboard",
  initialState: { dashboardData: false },
  dataDashboard: [],
  reducers: {},
  extraReducers: {
    [DashboardApi.rejected]: (state) => {
      alert("Unable to fetch Dashboard Data");
    },
    [DashboardApi.fulfilled]: (state, action) => {
      debugger;
      state.initialState = true;
      // localStorage.setItem('dash',action.payload.data.data)
      DashboardCookies.set("dashboardData", action.payload.data.data);
      state.dataDashboard = action.payload;
      debugger;
    },
  },
});

export const dashboardActions = dashboardSlice.dashboardActions;

export default dashboardSlice;
