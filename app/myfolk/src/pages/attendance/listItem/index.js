import API from '../../../api';
import './index.css';

function ListItem(props) {

    var self = this
    let {name, phone, level, parent, events} = props

    const markAttendance = ()=>{
        new API().call("/attendance/mark",
          {
            phone: phone,
            attendance: true
          }).then((res)=>{
        })
    }


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

    return <div className='atcContact' key={phone}>
    <div className='atcNamePhone'>
      <div className='atcName'>{name}</div>
      <div className='atcPhone'>{phone}</div>
    </div>
    <div className='atcTick' style={{backgroundColor}} onClick={markAttendance}>{label}</div>
    <Modal>
        <CheckBox>
          {
            events.map((e)=>{
              return {
                key: e.parent,
                name: e.parent,
                checked: 1
              }
            })
          }
        </CheckBox>
      </Modal>
  </div>
}

export default ListItem