import { createSlice} from "@reduxjs/toolkit";


export const checkSlice = createSlice({
    name:'checkInSlice',
    initialState:{checkedIn:false},
    reducers:{
        checkin(state){
            debugger
            state.checkedIn = true
        },
        checkout(state){
            state.checkedIn = false
        }
    }
})


export const checkInActions = checkSlice.actions

export default checkSlice;