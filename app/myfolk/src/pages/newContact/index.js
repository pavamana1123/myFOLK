import './index.css';
import Header from "../../components/header"
import {Form} from "../../components/form"
import {Input} from "../../components/input"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';
import TitleBar from "../../components/titleBar"
import { useParams } from 'react-router';

var pageMenu = new PageMenuCtl()

function NewContact() {

  var openWhatsApp = ()=>{
    var phone = document.getElementById('phone').value
    window.open(`https://wa.me/91${phone}`)
  }

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>

      <TitleBar title='Contact'>
        <i className='bi bi-whatsapp' onClick={openWhatsApp}></i>
        <i className='bi bi-download'></i>
      </TitleBar>

      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>

      <Form>
        <Input label="Name" onBlur={(e)=>{
          e.target.value=e.target.value.standardizeName()
        }}/>
        <Input label="Phone" type="tel" maxLength={10}/>
        <button type="submit" maxLength={10} onClick={(e)=>{
          e.preventDefault()}}>Save</button>
      </Form>

    </div>
  );
}




export default NewContact;
