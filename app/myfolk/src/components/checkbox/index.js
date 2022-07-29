import { useState, useEffect, useRef } from 'react';
import './index.css';

function CheckBox(props) {
  var self = this

  var [selIndex, setSelIndex] = useState(0)
  var {children} = props
  useEffect(()=>{
  },[])

  const onChangeInt = (i)=>{
    setSelIndex(i)
  }

  return (
    <div className='checkBox'>
      {
        children.map((c, i)=>{
          return (
            <div className={`checkItem ${i==selIndex?"selected":""}`} onClick={onChangeInt.bind(self, i)}>
              <div onClick={(e)=>{
                  e.preventDefault()
                  e.stopPropagation()
                }}>{c.checked?<i className="bi bi-app"></i>:<i className="bi bi-check2-square"></i>}</div>
              <div className='checkName unsel' >{c.name}</div>
            </div>
          )
        })
      }
    </div>

  );
}

export default CheckBox
