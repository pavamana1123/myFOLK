import { useState, useEffect, useRef } from 'react';
import './index.css';

function Modal(props) {
  var self = this

  var {title, children, onClose} = props
  useEffect(()=>{
  },[])
   
  return (
    <div>
      <div className="glass dark-glass"/>
      <div className='modalBox'>
        <div className='modalTitle'>
          <div className='modalTitleItems'>
            <span>{title}</span>
            <i class="bi bi-x-square-fill" onClick={onClose}></i>
          </div>
        </div>
        <div className='modalBody'>{children}</div>
      </div>
    </div>

  );
}

export default Modal
