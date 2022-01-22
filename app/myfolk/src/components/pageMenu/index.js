import './index.css';
import {useEffect, useState} from 'react'

class PageMenuCtl {

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


function PageMenu(props) {
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
      
      <div className='pageMenu' id={show?'show':'hide'}>
          {
            list.map((l)=>{
              return <div className='pageMenuItem'>{l}</div>
            })
          }
      </div>

      {show?<div className='glass' onClick={()=>{
        setShow.bind(self)(false)}}/>:null
      }

    </div>
  );
}

export  {PageMenu, PageMenuCtl};
