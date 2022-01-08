import './index.css';
import {Spinner, SpinnerCtl} from '../../components/spinner';
import {useState, useRef, useEffect} from 'react'
import Toast from '../../components/toast';
// import API from '../../api';

function Login() {

  var [submitState, setSubmitState] = useState(false)
  var [toastText, setToastText] = useState()
  var [showToast, setShowToast] = useState(false)
  var spinner = new SpinnerCtl()
  const loginPhone = useRef(null)
  const loginPass = useRef(null)

  const onLogin = (e)=>{
    e.preventDefault()
    setSubmitState(true)
    spinner.show()
  }


  return (
    <div id="login-root">
          <Toast text={toastText} show={showToast}/>
          <img id='login-logo' src="logo.png"/>
          <form id='login-form'>
              <input ref={loginPhone} type="tel" placeholder='Phone' pattern="[0-9]{10}"></input>
              <input ref={loginPass} type='password' placeholder='Password'></input>
              <button disabled={submitState} onClick={onLogin}>Login</button>
              <div className='login-spinner'><Spinner show={submitState} size={25} ctl={spinner}/></div>
          </form>
    </div>
  );
}



export default Login;
