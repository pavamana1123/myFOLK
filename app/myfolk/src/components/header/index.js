import './index.css';

function Header() {
  return (
    <div className="app_header">
        <i class="bi bi-list" id="slideMenuButton"></i>
        <img src="logo.png" className="header_logo"/>
        <i class="bi bi-three-dots-vertical" id="menuButton"></i>
    </div>
  );
}

export default Header;
