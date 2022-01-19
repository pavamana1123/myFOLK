import './index.css';
import Header from "../../components/header"
import PageMenu from '../../components/pageMenu';

function Home() {

  return (
    <div>
      <Header/>
      <PageMenu list={[1,2,3,4]}/>
    </div>
  );
}

export default Home;
