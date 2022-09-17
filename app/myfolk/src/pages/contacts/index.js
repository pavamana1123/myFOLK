import './index.css';
import Header from "../../components/header"
import TitleBar from "../../components/titleBar"
import Paper from "../../components/paper"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import { useEffect, useState } from 'react';
import API from "../../api"
import SearchBox from './searchBox';
import searchKeys from './searchKeys';

var pageMenu = new PageMenuCtl()

function Contacts() {

  var [contacts, setContacts] = useState([])
  var [dispContacts, setDispContacts] = useState(contacts)
  var [searchKey, setSearchKey] = useState("name")

  useEffect(()=>{
    new API().call("/contacts").then((res)=>{
      var {contacts} = res.body
      setContacts(contacts)
      setDispContacts(contacts)
  })
  },[])

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/> 
      <PageMenu list={[1,1,2,4]} ctl={pageMenu}/>
      <TitleBar title='Contacts'>
      </TitleBar>

      <div id="contactsRoot" className='pageRoot'>

        <SearchBox 
          searchKeys={searchKeys}
          defaultSearchKey="name"
          onSearchKeyChange={setSearchKey}
          list={contacts.map((c)=>{
            return c[searchKey]
          })} onChange={(inputText)=>{
            setDispContacts(contacts.filter((c)=>{
              return `${c[searchKey]}`.toLowerCase().includes(inputText)
          }))
        }} disableAuto/>

        <div id="contactList">
          {
            dispContacts.map(c=>{
              return <Paper key={c.phone} className='contactItem'>
                <div className='contactItemHolder'>
                  <div>
                    <div><b>{c.name}</b></div>
                    <div>{c.phone}</div>
                  </div>
                  <div className='actionButton'>
                    {!isNaN(c.phone)?<a href={`tel:+91${c.phone}`}><i className="bi bi-telephone-fill actionButton"></i></a>:null}
                    {!isNaN(c.phone)?<a href={`https://wa.me/91${c.phone}`} target="_blank"><i className="bi bi-whatsapp actionButton"></i></a>:null}
                  </div>
                </div>
              </Paper>
            })
          }
        </div>
      </div>
    </div>
  );
}

export default Contacts;
