import { useState, useEffect, useRef } from 'react';
import './index.css';


class CheckBoxCtl {
  constructor(){
    this.setGetChecks=()=>{}
  }
  setShowFunc(f){
    this.setGetChecks=f
  }
}

function CheckBox(props) {

  console.log("running")

  var self = this

  var [selIndex, setSelIndex] = useState(0)
  var {children} = props

  var [checked, setChecked] = useState(children)

  const onChangeInt = (i)=>{
    setSelIndex(i)
  }

  useEffect(()=>{
    props.ctl.setGetChecks(()=>{
      return checked
    })
  },[])

  return (
    <div className='checkBox'>
      {
        checked.map((c, i)=>{
          return (
            <div className={`checkItem ${i==selIndex?"selected":""}`} onClick={onChangeInt.bind(self, i)}>
              <div onClick={()=>{
                  children[i].checked = !c.checked
                  setChecked(children)
                }}>{c.checked?<i className="bi bi-check2-square"></i>:<i className="bi bi-app"></i>}</div>
              <div className='checkName unsel' >{c.name}</div>
            </div>
          )
        })
      }
    </div>

  );
}

export { CheckBox, CheckBoxCtl };
