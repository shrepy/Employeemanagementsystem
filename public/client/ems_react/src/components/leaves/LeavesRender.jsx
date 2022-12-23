import React, { useEffect } from 'react'
import { useSelector } from 'react-redux'

const LeavesRender = async() => {
    const selector = useSelector((state)=>state.leaveSlice.leavesData)
debugger
    const data = Object.keys(selector.data.data)
debugger
  return (
    <>
         <tr>
                  {data.map((keys,values)=>{
                      debugger
                      return(
                        <>
                      <th scope="row"></th>
                      <td>Shreyansh</td>
                      <td>{selector.data.data[keys].leave_type}</td>
                      <td>{selector.data.data[keys].from_date}</td>
                      <td>{selector.data.data[keys].till_date}</td>
                      <td>{selector.data.data[keys].leave_type}</td>
                      <td>{selector.data.data[keys].leave_type}</td>
                      <td>{selector.data.data[keys].total_days}</td>
                      <td>{selector.data.data[keys].reason}</td>
                      <td>
                        <button type="button" class="btn btn-success disabled">{selector.data.data[keys].leave_status}</button>
                      </td>
                        </>
                      )
                  })}
                  </tr>
    </>
  )
}

export default LeavesRender