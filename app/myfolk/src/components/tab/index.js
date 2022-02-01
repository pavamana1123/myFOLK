import './index.css';

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
  const {tabs} = props

  return (
    <div className='tab'>
      <div className='tabHeader app_header'>
        {
          tabs.map((tab, i)=>{
            return (
              <div className='tabHeaderItem' key={i}>{tab.title}</div>
            )
          })
        }
      </div>
      <div className='underline' style={{width:`${100/tabs.length}vw`}}></div>
    </div>
  )
}

export {Tab, TabCtl};
