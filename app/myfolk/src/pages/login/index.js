import './index.css';
import Spinner from '../../components/spinner';
import {useState, useRef} from 'react'
import Toast from '../../components/toast';
import API from '../../api';

function Login() {

  var [submitState, setSubmitState] = useState(false)
  var [toastText, setToastText] = useState()
  var [showToast, setShowToast] = useState(false)
  const loginPhone = useRef(null)
  const loginPass = useRef(null)

  const onLogin = (e)=>{
    e.preventDefault()
    setSubmitState(true)

    new API().call("/login", {})
  }

  return (
    <div id="login-root">
          <Toast text={toastText} show={showToast}/>
          <img id='login-logo' src="logo.png"/>
          <form id='login-form'>
              <input ref={loginPhone} type="tel" placeholder='Phone' pattern="[0-9]{10}"></input>
              <input ref={loginPass} type='password' placeholder='Password'></input>
              <button disabled={submitState} onClick={onLogin}>Login</button>
              <div className='login-spinner'><Spinner show={submitState} size={25}/></div>
          </form>
    </div>
  );
}



export default Login;
