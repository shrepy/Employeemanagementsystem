import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import Cookies from "universal-cookie";
import { API } from "./authSlice";
import { employeeHeaders } from "./dashboardSlice";

export const getLeavesData = createAsyncThunk("leavesData", async () => {
  debugger;
  const resp = await axios.get(`${API}/leafs`, { headers: employeeHeaders });
  debugger;
  return resp;
});

const leaveSlice = createSlice({
  name: "leaveSlice",
  initialState: { leaveData: false },
  leavesData: [],
  extraReducers: {
    [getLeavesData.fulfilled]: (state, action) => {
      debugger;
      state.leaveData = true;
      state.leavesData = action.payload;
      debugger;
    },
    [getLeavesData.rejected]: (state) => {
      alert("something went wrong....");
    },
  },
});

export const leaveActions = leaveSlice.actions;

export default leaveSlice;
