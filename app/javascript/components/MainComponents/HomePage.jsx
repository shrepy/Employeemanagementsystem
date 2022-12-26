import React, { useEffect } from 'react'

const HomePage = () => {

    useEffect(async()=>{
        const resp = await fetch('http://127.0.0.1:3000/api/v1/dashboard')
        debugger
        const data = await resp.json()
        debugger
    })

  return (
    <div>HomePage</div>
  )
}

export default HomePage