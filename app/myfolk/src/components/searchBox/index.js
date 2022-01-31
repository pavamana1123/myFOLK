import { useState, useEffect } from 'react';
import './index.css';

class SearchBoxCtl {
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

function SearchBox(props) {

  var [show, setShow] = useState(props.show)
  const self = this
  useEffect(()=>{
  },[])

  return (
    <div>
      <div className='searchBox'>
        <input className='searchField'></input>
        <i className="bi bi-search searchIcons" id="searchButton"></i>
        <i className="bi bi-x searchIcons" id="closeButton"></i>
      </div>
    </div>
  );
}

export { SearchBox, SearchBoxCtl };
