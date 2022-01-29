import './index.css';
import Header from "../../components/header"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useRef } from 'react';

var pageMenu = new PageMenuCtl()

function Attendence() {
  var search = useRef()

  useEffect(()=>{
    search.current.focus()
  },[])

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>

      <div className='attendenceSearchHolder'>
        <input className='attendenceSearchInput' ref={search} placeholder='Enter name or phone to search'/>
      </div>

    </div>
  );
}

export default Attendence;
