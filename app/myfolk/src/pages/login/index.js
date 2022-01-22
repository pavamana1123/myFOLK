import './index.css';
import {Spinner, SpinnerCtl} from '../../components/spinner';
import {useState, useRef, useEffect} from 'react'
import {Toast, ToastCtl} from '../../components/toast';
import API from '../../api';
import cookie from '../../cookie';
import auth from '../../auth';
const md5 = require("md5")

var spinner = new SpinnerCtl()
var toast = new ToastCtl()

function Login() {

  useEffect(()=>{auth.redirect("/home")},[])
  var [submitState, setSubmitState] = useState(false)
  const loginPhone = useRef(null)
  const loginPass = useRef(null)

  const onLogin = (e)=>{
    e.preventDefault()
    setSubmitState(true)
    spinner.show()

    new API().call("/login",{
      phone: loginPhone.current.value,
      password: md5(loginPass.current.value)
    }).then((res)=>{
      spinner.hide()
      setSubmitState(false)
      if(res.status==200){
        for(var key in res.body){
          cookie.set(key, res.body[key])
        }
        window.open("/home","_self")
      }else{
        toast.show(res.error)
      }
    })
  }


  return (
    <div id="login-root">
          <Toast ctl={toast}/>
          <img id='login-logo' src="logo.png"/>
          <form id='login-form'>
              <input ref={loginPhone} type="tel" placeholder='Phone' pattern="[0-9]{10}"></input>
              <input ref={loginPass} type='password' placeholder='Password'></input>
              <button className='clickable' disabled={submitState} onClick={onLogin}>Login</button>
              <div className='login-spinner'><Spinner show={submitState} size={25} ctl={spinner}/></div>
          </form>
    </div>
  );
}



export default Login;
