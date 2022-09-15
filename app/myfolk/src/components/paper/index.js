import { useState, useEffect } from 'react';
import './index.css';


function Paper(props) {

  var {children, style, className} = props

  return(
    <div className={`paper ${className}`} style={style}>
      {children}
    </div>
  )
}

 export default Paper;
