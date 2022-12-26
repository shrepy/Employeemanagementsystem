import React from 'react'
import { useNavigate } from 'react-router-dom'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
const Dashboard = () => {
    debugger
    const navigate = useNavigate()

    const handleChange = () => {
        navigate('/home/login')
    }

  return (
    <>
    <div>Dashboard Page</div>
    <button className='btn btn-danger' onClick={handleChange}>Go To Home Page</button>
    </>

  )
}

export default Dashboard