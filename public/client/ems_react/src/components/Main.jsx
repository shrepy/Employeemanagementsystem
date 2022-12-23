import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import AttendancePage from './attendance/AttendancePage';
import Base from './dailytask/Base';
import DailyTask from './dailytask/DailyTask';
import Dashboard from './Dashboard';
import HomePage from './dashboardHome/HomePage';
import Navbar from './headers/Navbar';
import Holidays from './holidays/Holidays';
import LeavePage from './leaves/LeavePage';
import LoginPage from './login/LoginPage';
import TicketPage from './tickets/TicketPage';
const Main = () => {
	return (
		<div>
			<BrowserRouter>
				<Routes>
					<Route
						path=""
						element={<Dashboard />}
					/>
					{/* <Route
            path="/home"
            element={
              <>
                <Navbar /> <HomePage />{" "}
              </>
            }
          /> */}
					<Route
						path="/dailytask"
						element={
							<>
								<Navbar /> <Base />
							</>
						}
					/>
					<Route
						path="/holidays"
						element={
							<>
								<Navbar /> <Holidays />
							</>
						}
					/>
					<Route
						path="/leave"
						element={
							<>
								<Navbar /> <LeavePage />
							</>
						}
					/>
					<Route
						path="/attendance"
						element={
							<>
								<Navbar /> <AttendancePage />
							</>
						}
					/>

					<Route
						path="/ticket"
						element={
							<>
								<Navbar /> <TicketPage />
							</>
						}
					/>
				</Routes>
				<Routes>
					<Route
						path="login"
						element={<LoginPage />}
					/>
				</Routes>
			</BrowserRouter>
		</div>
	);
};

export default Main;
