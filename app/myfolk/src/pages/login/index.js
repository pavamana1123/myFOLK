import './index.css';
import {useState} from 'react'

function Login() {

  var [submitState, setSubmitState] = useState(false)

  return (
    <div id="login-root">
          <img id='login-logo' src="logo.png"/>
          <form id='login-form'>
              <input ref='login-phone' type="tel" placeholder='Phone' pattern="[0-9]{10}"></input>
              <input ref='login-pass' type='password' placeholder='Password'></input>
              <button disabled={submitState} onClick={onLogin}>Login</button>
          </form>
    </div>
  );
}

function onLogin(e) {
  
}

export default Login;
