import './index.css';
import Header from "../../components/header"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect } from 'react';

var pageMenu = new PageMenuCtl()

function BMW() {

  const readRawData = ()=>{
    
    var a = document.createElement("a")
    a.href="https://wa.me/917483567366"
    a.click()

    alert(navigator.clipboard)

    navigator.clipboard.readText().then(rawData=>console.log(rawData.split("\t")))

  }

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>
      <button className='clickable import' onClick={readRawData}>Import from clipboard</button>
      <a href='https://wa.me/917483567366'>Click</a>
    </div>
  );
}

export default BMW;
