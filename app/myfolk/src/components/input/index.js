import { useState, useEffect } from 'react';
import './index.css';

class InputCtl {
  constructor(){
  }
  setwFunc(f){
  }
}

function Input(props) {

  var {id, type, label, placeholder, onBlur, maxLength} = props

  return(
    <div>
      <div>{label}</div>
      <input
        id={id||label.toCamelCase()}
        type={type||"text"}
        maxlength={maxLength}
        placeholder={placeholder}
        onBlur={onBlur}/>
    </div>
  )
}

export { Input, InputCtl };
