import './index.css';
import { useState, useEffect, useRef } from 'react';


class TabCtl {
  constructor(){
    this.show=()=>{}
    this.hide=()=>{}
  }
  setShowFunc(f){
    this.show=f
  }
  setHideFunc(f){
    this.hide=f
  }
}

function Tab(props) {
  var [activeTab, setActiveTab] = useState(props.activeTab)
  var self=this
  const {tabs} = props

  return (
    <div className='tab'>
      <div className='tabHeader'>
        <div className='tabHeaderItems'>
          {
            tabs.map((tab, i)=>{
              return (
                <div className='tabHeaderItem clickable' key={i} onClick={()=>{
                  setActiveTab.bind(self)(i)
                }}>{tab.title}</div>
              )
            })
          }
        </div>
        <div className='tabUnderline' style={{
          width:`${100/tabs.length}vw`,
          left: `${activeTab*(100/tabs.length)}%`
          }}></div>
      </div>

    </div>
  )
}

export {Tab, TabCtl};
