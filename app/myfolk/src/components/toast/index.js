import { useState, useEffect, useRef } from 'react';
import './index.css';

class ToastCtl {
  constructor(){
    this.show=()=>{}
    this.hide=()=>{}
  }
  setShowFunc(f){
    this.show=f
  }
  setHideFunc(f){
    this.hide=f
  }
}

function Toast(props) {

  var [show, setShow] = useState(!!props.show)
  var [text, setText] = useState(props.text||"")
  var timerId = useRef(null)

  const clearTimer = ()=>{
    if(timerId.current){
      clearTimeout(timerId.current)
    }
  }

  const autoHide = ()=>{
    timerId.current = setTimeout(()=>{
      setShow(false)
    }, 5000)
  }

  var self = this
  useEffect(()=>{
    props.ctl.setShowFunc((t)=>{
      clearTimer()
      setText.bind(self)(t)
      setShow.bind(self)(true)
      autoHide()
    })
    props.ctl.setHideFunc(()=>{setShow.bind(self)(false)})
  },[])
   
  return (
    <div className={`toast toast-${show?"show":"hide"}`}>
      {text}
    </div>
  );
}

export { Toast, ToastCtl };
