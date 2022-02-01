import './index.css';
import Header from "../../components/header"
import TitleBar from "../../components/titleBar"
import {SearchBox} from "../../components/searchBox"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useRef } from 'react';

var pageMenu = new PageMenuCtl()

function Attendence() {
  var search = useRef()


  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
      <TitleBar title='Attendence'>
        <SearchBox/>
        <i className='bi bi-plus'></i>
        <i className='bi bi-arrow-clockwise'></i>
      </TitleBar>


    </div>
  );
}

export default Attendence;
