import './index.css';
import Header from "../../components/header"
import {Tab} from "../../components/tab"
import TitleBar from "../../components/titleBar"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useState } from 'react';
import API from '../../api';
import { Input } from '../../components/input';
import moment from 'moment'

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

  const markAttendance = (p)=>{
      new API().call("/attendance/mark",
        {
          level: p.level,
          phone: p.phone,
          date: document.getElementById("attendanceDate").value,
          attendance: true
        }).then((res)=>{
      
      })
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

          let label = p.level
          let parentList = p.parent?p.parent.split(","):[]
          let parentLevelAffinity = parentList.indexOf(p.level)!=-1
          let eventLevelAffinity = !!events.filter((e)=>{return e.id=p.level}).length

          switch(parentList.length){
            case 0: // absent
              if(!eventLevelAffinity){
                label=events.length==1?events[0].id:"list"
              }else{
                label=p.level
              }
              break;
            case 1: // attended one
              label=p.parent
              break;
            default: // attended more
              label = "list"

          }

          let backgroundColor = "grey"
          if(!!p.parent){
            backgroundColor = "green"
          }
          return (
            <div className='attendenceContact' key={p.phone}>
              <div className='attendenceContactNamePhone'>
                <div>{p.name}</div>
                <div>{p.phone}</div>
              </div>
              <div className='attendenceTick' style={{backgroundColor}} onClick={markAttendance.bind(self, p)}>{label}</div>
            </div>
          )
        })
      }
    </div>
  );
}

export default Attendance;
