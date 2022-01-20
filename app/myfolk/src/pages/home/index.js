import './index.css';
import Header from "../../components/header"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect } from 'react';

var pageMenu = new PageMenuCtl()

function Home() {

  return (
    <div>
      <Header onPageMenuClick={()=>{pageMenu.show(true)}}/>
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
    </div>
  );
}

export default Home;
