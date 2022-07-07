import { useState, useEffect } from 'react';
import './index.css';

class InputCtl {
  constructor(){
  }
  setwFunc(f){
  }
}

function Input(props) {

  var {id, type, label, placeholder, onBlur, maxLength, onChange, defaultValue, children} = props

  return(
    <div>
      <div>{label}</div>
      <div>
        <input
          id={id||label.toCamelCase()}
          type={type||"text"}
          defaultValue={defaultValue}
          maxlength={maxLength}
          placeholder={placeholder}
          onBlur={onBlur}
          onChange={onChange}/>
          <div className='inputAuto'>
    	      {children}
          </div>
      </div>


    </div>
  )
}

export { Input, InputCtl };
