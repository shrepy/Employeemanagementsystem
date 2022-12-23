import React from 'react';
import './styles.scss';
import { PopupMenu } from 'react-simple-widgets';
import Logout from '../../login/Logout';
import { useSelector } from 'react-redux';
import { cookies } from '../../../store/authSlice';
import logo from '../../../images/sassLogo.png';

const SideDropdown = () => {
	const userCookie = cookies.get('empData');
	return (
		<>
			{/* <h1 className='title' style={{fontFamily: "Caramel,cursive"}}>Simply Alliance Employee Management System</h1> */}
			<img
				className="title"
				src={logo}
			/>
			<div id="app">
				<div className="text-end">
					<PopupMenu>
						<div
							id="circle-avatar"
							className="btn text-center mb-4">
							<span>{userCookie.data.name[0]}</span>
						</div>
						{/* <button className="btn btn-primary">
            <small>Menu</small>
          </button> */}

						<div className="card text-start">
							<div className="card-body px-4 py-4">
								<div
									id="circle-avatar"
									className="text-center mx-auto mb-4">
									<span>{userCookie.data.name[0]}</span>
								</div>

								<h5 className="text-center mb-0">{userCookie.data.name}</h5>
								<p className="text-center mb-2">{userCookie.data.email}</p>

								<hr />

								<p
									className="mb-0"
									style={{
										color: '#bebebe',
										fontWeight: 'bold',
										fontSize: 12,
									}}>
									ROLES
								</p>
								<p style={{ fontSize: 12 }}>
									{userCookie.data.department}, {userCookie.data.primary_skill}
								</p>

								<hr
									className="mb-0"
									style={{ margin: '0 -24px 0' }}
								/>

								<div
									className="list-group list-group-flush"
									style={{ margin: '0 -24px 0' }}>
									<button className="list-group-item list-group-item-action px-4">
										<small>View Profile</small>
									</button>
									<button className="list-group-item list-group-item-action px-4">
										<small>Change Password</small>
									</button>
									{/* <button className="list-group-item list-group-item-action px-4">
                  <small>Other Requests</small>
                </button> */}
								</div>

								<hr style={{ margin: '0 -24px 24px' }} />

								<div className="d-grid">
									<Logout />
								</div>
							</div>
						</div>
					</PopupMenu>
				</div>
			</div>
		</>
	);
};

export default SideDropdown;
