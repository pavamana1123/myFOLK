import { useState, useEffect, useRef } from 'react';
import './index.css';

function Modal(props) {
  var self = this

  var {title} = props
  useEffect(()=>{
  },[])
   
  return (
    <div>
      <div className="glass dark-glass"/>
      <div className='modalBox'>
        <div className='modalTitle'>{title || "Modal"}</div>
        <div className='modalBody'>"asdajs dkajsdk"</div>
      </div>
    </div>

  );
}

export default Modal
