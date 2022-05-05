import './index.css';
import Header from "../../components/header"
import {Form} from "../../components/form"
import {Input} from "../../components/input"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';

var pageMenu = new PageMenuCtl()

function NewContact() {

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>
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
