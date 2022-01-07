import { useState, useEffect } from 'react';
import './index.css';

function Spinner(props) {
   
  var [show, setShow] = useState(props.show)

  useEffect(()=>{
    props.ctl |= {}
    props.ctl.show = ()=>{setShow(true)}
    props.ctl.hide = ()=>{setShow(false)}
  },[])


  return (
    <div className={`spinner-bg-circle ${show?"spinner-show":"spinner-hide"}`}  style={{width:`${props.size||20}px`, height:`${props.size||20}px`}} >
    </div>
  );
}

export default Spinner;
