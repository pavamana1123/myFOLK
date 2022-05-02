import './index.css';
import Header from "../../components/header"
import {Form} from "../../components/form"
import {Input} from "../../components/input"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';

var pageMenu = new PageMenuCtl()

function Test() {

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/>
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>

      <Form>
        <Input label="Name"/>
      </Form>

    </div>
  );
}

export default Test;
