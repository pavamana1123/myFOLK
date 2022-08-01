import API from '../../../api';
import './index.css';
import Modal from '../../../components/modal';
import {CheckBox, CheckBoxCtl} from '../../../components/checkbox';
import { useState, useCallback } from 'react';
import { useLongPress, LongPressDetectEvents } from "use-long-press";

function ListItem(props) {

    var self = this
    let {name, phone, level, parent, events} = props
    var [showOptions, setShowOptions] = useState(false)

    var checkBoxCtl = new CheckBoxCtl()

    const markAttendance = ()=>{
        new API().call("/attendance/mark",
          {
            phone: phone,
            attendance: true
          }).then((res)=>{
        })
    }

    const bind = useLongPress(() => {
      window.navigator.vibrate(100)
      setShowOptions(true)
    });


    let list = <i className="bi bi-list"></i>
    let label, clickFunc, longPressFunc
    let parentList = parent?parent.split(","):[]
    let parentLevelAffinity = parentList.indexOf(level)!=-1
    let eventLevelAffinity = !!events.filter((e)=>{return e.id=level}).length

    switch(parentList.length){
      case 0: // absent
        if(events.length==1){
          label = events[0].parent
        }else{
          if(eventLevelAffinity){
            label = level
          }else{
            label = list
          }
        }
        break;
      case 1: // attended one
        label = parent
        break;
      default: // attended more
        if(parentLevelAffinity){
          label = `${level}+${parentList.length-1}`
        }else{
          label = `${parentList[0]}+${parentList.length-1}`
        }

    }

    let backgroundColor = "grey"
    if(!!parent){
      backgroundColor = "#005c4b"
    }

    return <div className='atcContact unsel' key={phone}>
    <div className='atcNamePhone'>
      <div className='atcName'>{name}</div>
      <div className='atcPhone'>{phone  }</div>
    </div>
    <div className='atcTick' style={{backgroundColor}} onClick={markAttendance} {...bind()}>{label}</div>

    {showOptions?
      <Modal onClose={()=>setShowOptions(false)} title="Details">
        <CheckBox ctl={checkBoxCtl}>
          {
            events.map((e)=>{
              return {
                key: e.parent,
                name: e.parent,
                checked: parentList.indexOf(e.parent)!=-1
              }
            })
          }
        </CheckBox>
      </Modal>:null}
  </div>
}

export default ListItem