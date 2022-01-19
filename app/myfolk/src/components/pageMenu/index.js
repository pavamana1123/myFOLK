import './index.css';

function PageMenu(props) {
  const { list } = props
  return (
    <div className="pageMenu">
       {
         list.map((l)=>{
           return <div className='pageMenuItem'>{l}</div>
         })
       }
    </div>
  );
}

export default PageMenu;
