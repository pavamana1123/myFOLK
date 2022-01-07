import { useState, useEffect } from 'react';
import './index.css';

function Toast(props) {
   
  return (
    <div className={`toast toast-${props.show?"show":"hide"}`}>
      {props.text}
    </div>
  );
}

export default Toast;
