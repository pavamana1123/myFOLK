import './index.css';

function TitleBar(props) {
  const {title, children} = props
  return (
    <div className="titlebar">
      <div className='titlebar_title'>{title}</div>
      <div className='titlebar_children'>
        {children}
      </div>
    </div>
  );
}

export default TitleBar;
