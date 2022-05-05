import { MainMenu, MainMenuCtl } from '../mainMenu';
import './index.css';

var mainMenu = new MainMenuCtl()

function Header(props) {
  var {onPageMenuClick} = props
  return (
    <div>
        <MainMenu ctl={mainMenu} list={[1,2,3,4]}/>
        <div className="appHeader">
          <i className="bi bi-list clickable clickableIcon" id="slideMenuButton" onClick={()=>{mainMenu.show()}}></i>
          <img src="/logo.png" className="header_logo"/>
          <i className="bi bi-three-dots-vertical clickable clickableIcon" id="menuButton" onClick={onPageMenuClick}></i>
        </div>
    </div>

  );
}

export default Header;
