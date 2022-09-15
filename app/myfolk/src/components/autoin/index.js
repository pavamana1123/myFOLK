import { useState, useEffect } from 'react';
import './index.css';
import {Spinner, SpinnerCtl} from "../spinner"

class AutoInCtl {
  constructor(){
  }
  setwFunc(f){
  }
}

function AutoIn(props) {

  return(
    <div className='autoInRoot'>
      <div className='autoInHolder'>
        <input className='autoIn'/>
        <Spinner size={3.2}/>
      </div>
    </div>
  )
}

export { AutoIn, AutoInCtl };
