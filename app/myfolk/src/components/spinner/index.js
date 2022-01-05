import { useState } from 'react';
import './index.css';

function Spinner(props) {

  return (
    <div className={`spinner-bg-circle ${props.show?"spinner-show":"spinner-hide"}`}  style={{width:`${props.size||20}px`, height:`${props.size||20}px`}} >
    </div>
  );
}

export default Spinner;
