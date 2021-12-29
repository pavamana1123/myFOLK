import './index.css';

function Login() {
  return (
    <div id="login-root">
        <div id="login-container">
            <img id='login-logo' src="logo.png"/>
            <form id='login-form'>
                <input  type="tel" placeholder='Phone' pattern="[0-9]{10}"></input>
                <input type='password' placeholder='Password'></input>
                <button>sdfs</button>
            </form>
        </div>
    </div>
  );
}

export default Login;
