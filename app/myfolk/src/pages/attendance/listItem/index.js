import API from '../../../api';
import './index.css';

function ListItem(props) {

    var self = this

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

    let {name, phone, level, parent, events} = props

    let label = level
    let parentList = parent?parent.split(","):[]
    // let parentLevelAffinity = parentList.indexOf(level)!=-1
    let eventLevelAffinity = !!events.filter((e)=>{return e.id=level}).length

    switch(parentList.length){
      case 0: // absent
        if(!eventLevelAffinity){
          label=events.length==1?events[0].id:"list"
        }else{
          label=level
        }
        break;
      case 1: // attended one
        label=parent
        break;
      default: // attended more
        label = "list"

    }

    let backgroundColor = "grey"
    if(!!parent){
      backgroundColor = "green"
    }


    return <div className='atcContact' key={phone}>
    <div className='atcNamePhone'>
      <div className='atcName'>{name}</div>
      <div className='atcPhone'>{phone}</div>
    </div>
    <div className='atcTick' style={{backgroundColor}} onClick={markAttendance.bind(self)}>{label}</div>
  </div>
}

export default ListItem