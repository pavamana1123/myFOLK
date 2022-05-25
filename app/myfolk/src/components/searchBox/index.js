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

  var {onSearch, style} = props

  useEffect(()=>{
    if(show){
      searchField.current.focus()
    }
  },[show])

  const onSearchClick = ()=>{
    setShow(true)
  }

  const onClose = ()=>{
    setShow(false)
    searchField.current.blur()
    searchField.current.value = ''
    onSearch('')
  }

  const onSearchChange = ()=>{
    onSearch(searchField.current.value)
  }

  return (
    <div style={style}>
      <input className='searchField' ref={searchField} id={show?'show':'hide'} onChange={onSearchChange}/>
      {show?<i className='searchIcon bi bi-x' onClick={onClose}/>:<i className='searchIcon bi bi-search' onClick={onSearchClick}/>}
    </div>
  );
}

export { SearchBox, SearchBoxCtl };
