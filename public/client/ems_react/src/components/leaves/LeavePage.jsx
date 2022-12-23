import React, { useCallback, useEffect, useState } from "react";
import "./LeavePage.css";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import { API } from "../../store/authSlice";
import { employeeHeaders } from "../../store/dashboardSlice";
import axios from "axios";
import LeavesRender from "./LeavesRender";

const LeavePage = () => {
  const [Data, setData] = useState([]);
  const leaveAPI = async () => {
    const resp = await axios.get(`${API}/leafs`, { headers: employeeHeaders });
    const newData = await resp.data.data;
    setData(newData);
  };

  const finalData = Object.keys(Data);

  useEffect(() => {
    leaveAPI();
    console.log("data", Data);
  }, []);

  const testFucntion = useCallback(() => {
    return <LeavesRender />;
  });

  const [open, setOpen] = React.useState(false);
  const [leaveFrom, setleaveFrom] = useState("");
  const [leaveTill, setleaveTill] = useState("");
  const [leaveType, setleaveType] = useState("");

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = async () => {
    try {
      const headersData = {
        "access-token": employeeHeaders["access-token"],
        client: employeeHeaders.client,
        uid: employeeHeaders.uid,
        employee_id: 1,
      };
      const data = {
        leave_type: leaveType,
        from_date: leaveFrom,
        till_date: leaveTill,
      };
      setOpen(false);
      const resp = await axios.post(`${API}/leafs`, data, {
        headers: headersData,
      });
      const newData = resp.data.data;
      setData([newData, ...Data]);
      debugger;
      alert("Success.");
    } catch (error) {
      alert("Anything Wrong Please try again letter.");
    }
  };

  return (
    <>
      <h4>Leave Page</h4>
      <div>
        <button className="btn btn-success btn-sm " onClick={handleClickOpen}>
          Apply Leave
        </button>
        <Dialog open={open} onClose={handleClose}>
          <DialogTitle>Subscribe</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Please fill the following Fields.
            </DialogContentText>
            <label>Leave Type</label>
            <TextField
              autoFocus
              // margin="dense"
              id="name"
              rows={4}
              onChange={(e) => {
                setleaveType(e.target.value);
              }}
              label="Please mention reason."
              type="text"
              fullWidth
              variant="standard"
            />
            <br />
            <hr />
            <label>Leave From</label>
            <TextField
              rows={4}
              // margin="dense"
              id="name"
              onChange={(e) => {
                setleaveFrom(e.target.value);
              }}
              type="date"
              fullWidth
              variant="standard"
            />
            <br />
            <hr />
            <label>Leave Till</label>
            <TextField
              autoFocus
              margin="dense"
              id="name"
              type="date"
              onChange={(e) => setleaveTill(e.target.value)}
              fullWidth
              variant="standard"
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button onClick={handleClose}>Submit</Button>
          </DialogActions>
        </Dialog>
      </div>

      <div class="card-body">
        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"></a>
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Employee</th>
              <th scope="col">Leave type</th>
              <th scope="col">From date</th>
              <th scope="col">Till date</th>
              <th scope="col">Leave starts</th>
              <th scope="col">Leave end</th>
              <th scope="col">Total days</th>
              <th scope="col">Reason</th>
              <th scope="col">Leave status</th>
            </tr>
          </thead>
          <tbody>
            {finalData.map((keys) => {
              return (
                <>
                  <tr>
                    <th scope="row"></th>
                    <td>Shreyansh</td>
                    <td>{Data[keys].leave_type}</td>
                    <td>{Data[keys].from_date}</td>
                    <td>{Data[keys].till_date}</td>
                    <td>{Data[keys].leave_type}</td>
                    <td>{Data[keys].leave_type}</td>
                    <td>{Data[keys].total_days}</td>
                    <td>{Data[keys].reason}</td>
                    <td>
                      <button type="button" class="btn btn-success disabled">
                        {Data[keys].leave_status}
                      </button>
                    </td>
                  </tr>
                </>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
};

export default LeavePage;
