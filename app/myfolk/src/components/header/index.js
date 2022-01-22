import './index.css';

function Header(props) {
  var {onPageMenuClick} = props
  return (
    <div className="app_header">
        <i className="bi bi-list clickable" id="slideMenuButton"></i>
        <img src="logo.png" className="header_logo"/>
        <i className="bi bi-three-dots-vertical clickable" id="menuButton" onClick={onPageMenuClick}></i>
    </div>
  );
}

export default Header;
