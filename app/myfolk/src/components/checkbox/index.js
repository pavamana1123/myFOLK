import { useState, useEffect, useRef } from 'react';
import './index.css';

function CheckBox(props) {
  var self = this

  var {children} = props
  useEffect(()=>{
  },[])
   
  return (
    <div className='checkBox'>
      {
        children.map((c)=>{
          return (
            <div className='checkItem'>
              {false?<i className="bi bi-app"></i>:<i className="bi bi-check2-square"></i>}
              <div className='checkName unsel'>{c.name}</div>
            </div>
          )
        })
      }
    </div>

  );
}

export default CheckBox
