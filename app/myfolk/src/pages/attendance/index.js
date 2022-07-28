import './index.css';
import Header from "../../components/header"
import {Tab} from "../../components/tab"
import TitleBar from "../../components/titleBar"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useState } from 'react';
import API from '../../api';
import { Input } from '../../components/input';
import moment from 'moment'
import ListItem from './listItem';

var pageMenu = new PageMenuCtl()

function Attendance() {
  var [people, setPeople] = useState([])
  var [peopleList, setPeopleList] = useState([])

  const getEventsOnDate = (date)=>{
    new API().call("/events",{date}).then((res)=>{
        console.log(res.body)
        setEvents(res.body)
        document.getElementById("attendanceDate").value = moment(res.body[0].date,"yyyy-MM-DDTHH:mm:ss.000Z").format('yyyy-MM-DD')
    })
  }
  
  useEffect(()=>{
    // var date = moment().format('yyyy-MM-DD')
    var date = "2022-01-30"
    document.getElementById("attendanceDate").value = date
    getEventsOnDate(date)
    new API().call("/attendance/people", {date}).then((res)=>{
        console.log(res)
        setPeople(res.body)
        setPeopleList(res.body)
    })
  },[])

  var [searchKey, setSearchKey] = useState('')
  var [events, setEvents] = useState([])

  useEffect(()=>{
    setPeopleList(searchKey?people.filter((p)=>{
      return p.name.toLowerCase().includes(searchKey.toLowerCase())
    }):people)
  },[searchKey])

  const onContactSearch = (e)=>{
    setSearchKey(e.target.value)
  }

  const onDateChange=(e)=>{
    // document.getElementById("attendanceDate").value = moment().format('DD-MM-yyyy')
  }

  var self = this

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/> 
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
      <TitleBar title='Attendance'>
        <Input type="date" id="attendanceDate"/>
      </TitleBar>

      <Input id="attendanceSearch" placeholder="search participant name or phone" onChange={onContactSearch}/>
      {
        peopleList.map((p)=>{
          return (
            <ListItem name={p.name} phone={p.phone} level={p.level} parent={p.parent} events={events}></ListItem>
          )
        })
      }
    </div>
  );
}

export default Attendance;
