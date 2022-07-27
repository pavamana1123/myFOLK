import { useState, useEffect, useRef } from 'react';
import './index.css';

function CheckBox(props) {
  var self = this

  var {children} = props
  useEffect(()=>{
  },[])
   
  return (
    <div>
      {
        children.map((c)=>{
          return (
            <div>
              {false?<i className="bi bi-app"></i>:<i className="bi bi-check2-square"></i>}
              <div>{c}</div>
            </div>
          )
        })
      }
    </div>

  );
}

export default CheckBox
