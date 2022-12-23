import React from 'react'
import axios from 'axios'
const LoginCheck = async(props) => {

    const loginData = {"email":props[0], "password":props[1]}

    const resp = await axios.post('http://localhost:3000/api/v1/auth/sign_in',loginData)
    console.log(resp)
    debugger
    // try {
    //     let response = await fetch('http://localhost:3000/api/v1/auth/sign_in', {
    //       method: 'POST',
    //       headers: {
    //         'Accept': 'application/json',
    //         'Content-Type': 'application/json',
    //       },
    //       body: JSON.stringify({'email' : "payal123@gmail.com",'password' : "password"}),
    //     });
    //     }    
    //     catch (error) {
    //         console.log(error)
    //     }

  return (
    <div>LoginCheck</div>
  )
}

export default LoginCheck