import './index.css';
import Header from "../../components/header"
import {Tab} from "../../components/tab"
import TitleBar from "../../components/titleBar"
import {SearchBox} from "../../components/searchBox"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useState } from 'react';
import API from '../../api';

var pageMenu = new PageMenuCtl()

function People() {
  var [people, setPeople] = useState([])
  var [peopleList, setPeopleList] = useState([])
  
  useEffect(()=>{
    new API().call("/people").then((res)=>{
        setPeople(res.body)
        setPeopleList(res.body)
    })
  },[])

  var [searchKey, setSearchKey] = useState('')
  useEffect(()=>{
    console.log("search changed", searchKey, people)
    setPeopleList(searchKey?people.filter((p)=>{
      return p.name.toLowerCase().includes(searchKey.toLowerCase())
    }):people)
  },[searchKey])

  const onSearch = (k)=>{
    setSearchKey(k)
  }

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/> 
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
      <TitleBar title='People'>
        <SearchBox onSearch={onSearch}/>
        <i className='bi bi-plus' style={{transform:'scale(1.5)'}}></i>
      </TitleBar>
      {
        peopleList.map((p)=>{
          return (
            <div className='contact'>{p.name}</div>
          )
        })
      }
    </div>
  );
}

export default People;
