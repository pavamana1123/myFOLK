import { useState, useEffect, useRef } from 'react';
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

  var [show, setShow] = useState(false)
  var searchField = useRef()
  const self = this

  useEffect(()=>{
    if(show){
      searchField.current.focus()
    }
  },[show])

  const onSearch = ()=>{
    setShow(true)
  }

  const onClose = ()=>{
    setShow(false)
    searchField.current.blur()
    searchField.current.value = ''
  }

  return (
    <div>
      <input className='searchField'/>
      {show?<i className='bi bi-x'/>:<i className='bi bi-search' style={{fontSize:'4.5vw'}}/>}
    </div>
  );
}

export { SearchBox, SearchBoxCtl };
