import './index.css';
import Header from "../../components/header"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect } from 'react';

var pageMenu = new PageMenuCtl()

function BMW() {

  const readRawData = ()=>{
    navigator.clipboard.readText().then(rawData=>console.log(rawData.split("\t")[1].split("\"")[1]))
  }

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>
      <button className='clickable import' onClick={readRawData}>Import from clipboard</button>
    </div>
  );
}

export default BMW;
