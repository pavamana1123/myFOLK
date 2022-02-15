import './index.css';
import Header from "../../components/header"
import {Tab} from "../../components/tab"
import TitleBar from "../../components/titleBar"
import {SearchBox} from "../../components/searchBox"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useRef, useState } from 'react';
import API from '../../api';

var pageMenu = new PageMenuCtl()

function People() {
  var search = useRef()
  var [people, setPeople] = useState([])

  useEffect(()=>{
    new API().call("/people").then((res)=>{
        setPeople(res.body)
    })
  },[])

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/> 
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
      <TitleBar title='People'>
        <SearchBox/>
        <i className='bi bi-plus' style={{transform:'scale(1.5)'}}></i>
      </TitleBar>
      {
        people.map((p)=>{
          return (
            <div>{p.name}</div>
          )
        })
      }
    </div>
  );
}

export default People;
