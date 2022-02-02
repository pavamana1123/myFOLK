import './index.css';
import Header from "../../components/header"
import {Tab} from "../../components/tab"
import TitleBar from "../../components/titleBar"
import {SearchBox} from "../../components/searchBox"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useRef } from 'react';

var pageMenu = new PageMenuCtl()

function Attendence() {
  var search = useRef()

  const a = ()=>{
    return <div>{'a'}</div>
  }

  const b = ()=>{
    return <div>{'b'}</div>
  }

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/> 
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
      <TitleBar title='Attendence'>
        <SearchBox/>
        <i className='bi bi-plus' style={{transform:'scale(1.5)'}}></i>
      </TitleBar>
      <Tab tabs={[
        {
          title:'Not Attended',
          component: a 
        },{
          title:'Attended',
          component: b 
        }
      ]}/>


    </div>
  );
}

export default Attendence;
