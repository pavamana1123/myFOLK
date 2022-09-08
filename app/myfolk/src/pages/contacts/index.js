import './index.css';
import Header from "../../components/header"
import TitleBar from "../../components/titleBar"
import {SearchBox} from "../../components/searchBox"
import {PageMenu, PageMenuCtl} from '../../components/pageMenu';

var pageMenu = new PageMenuCtl()

function Contacts() {

  return (
    <div>
      <Header onPageMenuClick={()=>{
        pageMenu.position('.5vw','6.5vh')
        pageMenu.show()
      }}/> 
      <PageMenu list={[1,2,3,4]} ctl={pageMenu}/>
      <TitleBar title='Contacts'>
        <SearchBox onSearch={()=>{}}/>
        <i className='bi bi-plus' style={{transform:'scale(1.5)'}}></i>
      </TitleBar>
    </div>
  );
}

export default Contacts;
