import './index.css';
import {Spinner, SpinnerCtl} from '../../components/spinner';
import {useState, useRef} from 'react'
import {Toast, ToastCtl} from '../../components/toast';
// import API from '../../api';

var k = 0

function Login() {

  var [submitState, setSubmitState] = useState(false)
  var spinner = new SpinnerCtl()
  var toast = new ToastCtl()
  const loginPhone = useRef(null)
  const loginPass = useRef(null)

  const onLogin = (e)=>{
    e.preventDefault()
    // setSubmitState(true)
    spinner.show()
    k++
    if(k%2==0){
      console.log("show:", k)
      toast.show(k)
    }else{
      console.log("hide:", k)
      toast.hide()
    }
  }


  return (
    <div id="login-root">
          <Toast ctl={toast}/>
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
