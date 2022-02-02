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
      <div className='searchBox' id={show?"show":"hide"}>
        <input className='searchField' ref={searchField} id={show?"show":"hide"}></input>
        <div className='searchIcons'>
          <i className="bi bi-search searchButton" id={show?"hide":"show"} onClick={onSearch}></i>
          <i className="bi bi-x closeButton" id={show?"show":"hide"} onClick={onClose}></i>
        </div>
      </div>
    </div>
  );
}

export { SearchBox, SearchBoxCtl };
