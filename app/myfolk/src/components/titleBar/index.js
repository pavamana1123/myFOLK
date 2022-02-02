import './index.css';

function TitleBar(props) {
  const {title, children} = props
  return (
    <div className="titlebar">
      <div className='titlebar_title'>{title}</div>
      <div className='titlebarChildren'>
        {children}
      </div>
    </div>
  );
}

export default TitleBar;
