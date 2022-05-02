import { useState, useEffect } from 'react';
import './index.css';

class InputCtl {
  constructor(){
  }
  setwFunc(f){
  }
}

function Input(props) {

  var {type, label, placeholder} = props

  return(
    <div>
      <div>{label}</div>
      <input type={type} placeholder={placeholder}/>
    </div>
  )
}

export { Input, InputCtl };
