import './index.css';
import {useEffect, useState} from 'react'
import cookie from '../../cookie';

class MainMenuCtl {

  constructor(){
    this.show = ()=>{} 
    this.hide = ()=>{}
  }

  setShowFunc(f){
    this.show=f
  }
  setHideFunc(f){
    this.hide=f
  }
}


function MainMenu(props) {
  const {list, ctl} = props
  var [show, setShow]=useState(false)
  var self = this

  useEffect(()=>{
    ctl.setShowFunc(()=>{
      setShow.bind(self)(true)
    })
    ctl.setHideFunc(()=>{
      setShow.bind(self)(false)
    })
  },[])

  return (
    <div>
      
      <div className='mainMenu' id={show?'show':'hide'}>
          <div className='mainMenuProfile'>
            <div className='mainMenuProfileAvatar'>{cookie.get('name').charAt(0).toUpperCase()}</div>
            <div className='mainMenuProfileName'>{cookie.get('name')}</div>
          </div>
          {
            list.map((l)=>{
              return <div className='mainMenuItem clickable'>{l}</div>
            })
          }
      </div>

      {show?<div className='glass' onClick={()=>{
        setShow.bind(self)(false)}}/>:null
      }

    </div>
  );
}

export  {MainMenu, MainMenuCtl};
