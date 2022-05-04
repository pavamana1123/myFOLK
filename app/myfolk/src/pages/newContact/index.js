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
          var v = e.target.value
          v = v.replace(/  +/g, ' ')
          v = v.replaceAll('.', ' ')
          var parts = v.split(" ")
          if(parts.length!=v.replaceAll(" ","").length){
            while(parts[0].length==1){
              console.log(1,parts)
              parts.push(parts.shift())
              console.log(2,parts)
            }
          }
          v=parts.join(" ")
          v = v.toTitleCase()
          e.target.value=v
        }}/>
      </Form>

    </div>
  );
}




export default NewContact;
