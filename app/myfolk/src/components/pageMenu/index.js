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
              return <div className='pageMenuItem clickable' onClick={
                (event)=>{
                  const clickable = event.currentTarget
                  const circle = document.createElement("span")
                  const diameter = Math.max(clickable.clientWidth, clickable.clientHeight)
                  const radius = diameter / 2

                  circle.style.width = circle.style.height = `${diameter}px`

                  circle.style.left = `${(event.clientX-clickable.getBoundingClientRect().x-radius)}px`
                  circle.style.top = `${(event.clientY-clickable.getBoundingClientRect().y-radius)}px`

                  circle.classList.add("ripple")
                  clickable.appendChild(circle);
                }
              }>{l}</div>
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
