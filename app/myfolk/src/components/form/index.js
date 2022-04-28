import { useState, useEffect } from 'react';
import './index.css';

class FormCtl {
  constructor(){
  }
  setwFunc(f){
  }
}

function Form(props) {

  var {children} = props

  return(
    <form>
      {children}
    </form>
  )
}

export { Form, FormCtl };
