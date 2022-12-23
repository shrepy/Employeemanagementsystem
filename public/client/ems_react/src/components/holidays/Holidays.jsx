import React, { useEffect, useState } from "react";
import axios from "axios";
import { API } from "../../store/authSlice";
import { employeeHeaders } from "../../store/dashboardSlice";

const Holidays = () => {
  const [holidayData, setholidayData] = useState([]);

  const HolidayApi = async () => {
    const resp = await axios.get(`${API}/holidays`, {
      headers: employeeHeaders,
    });

    const newData = await resp.data;
    setholidayData(newData);
    debugger;
    return resp;
  };

  useEffect(() => {
    HolidayApi();
  }, []);

  const data = Object.keys(holidayData);

  return (
    <>
      <br />
      <h3 className=" text-primary">Holidays</h3>
      <br />
      <br />
      <table className="table table-bordered table-active">
        <thead className=" text-white table-dark bg-black">
          <th>Sr. no</th>
          <th>Holiday Name</th>
          <th>Holiday Date</th>
        </thead>
        <tbody className=" table-hover table-striped-columns">
          {data.map((key, value) => {
            return (
              <>
                <tr>
                  <td>{holidayData[key].id}</td>
                  <td>{holidayData[key].holiday_name}</td>
                  <td>{holidayData[key].holiday_date}</td>
                </tr>
              </>
            );
          })}
        </tbody>
      </table>
    </>
  );
};

export default Holidays;
