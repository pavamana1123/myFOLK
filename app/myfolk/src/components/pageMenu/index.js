import './index.css';
import {useEffect, useState} from 'react'

class PageMenuCtl {

  constructor(){
    this.show = ()=>{} 
    this.hide = ()=>{}
    this.position = ()=>{}
  }

  setShowFunc(f){
    this.show=f
  }
  setHideFunc(f){
    this.hide=f
  }
  setPositionFunc(f){
    this.position=f
  }
}


function PageMenu(props) {
  const {list, ctl} = props
  var [show, setShow]=useState(false)
  var [position, setPosition]=useState({right:'0px', top: '0px'})
  var self = this

  useEffect(()=>{
    ctl.setShowFunc(()=>{
      setShow.bind(self)(true)
    })
    ctl.setHideFunc(()=>{
      setShow.bind(self)(false)
    })
    ctl.setPositionFunc((right,top)=>{
      setPosition.bind(self)({right, top})
    })
  },[])

  return (
    <div>
      
      <div className='pageMenu' id={show?'show':'hide'} style={position||{}}>
          {
            list.map((l)=>{
              return <div className='pageMenuItem clickable'>{l}</div>
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
