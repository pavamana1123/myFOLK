import './index.css';
import { useEffect, useRef, useState } from 'react';


function SearchBox(props) {

    var self = this
    const { list, onChange, disableAuto, searchKeys, defaultSearchKey } = props
    var [inputFoucesd, setInputFocused] = useState(false)
    var [displayList, setDisplayList] = useState(list)
    var [searchKey, setSearchKey] = useState(defaultSearchKey || searchKeys[0].key)
    var inputRef = useRef(null)

    return (
      <div id='searchRoot'>
        <div id="searchBoxHolder">
          <div id="fieldFilter"><i className="bi bi-person-fill"></i></div>
          <input type="text" ref={inputRef} id={`searchInput`} onFocus={()=>{
            setInputFocused(true)
          }} onBlur={()=>{
            setInputFocused(false)
          }} onChange={(e)=>{
            if(disableAuto){
                onChange(inputRef.current.value)
            }else{
                setDisplayList(list.filter((le)=>{
                    le=`${le}`
                    return le.includes(inputRef.current.value)
                }))
            }
          }}/>
        </div>
       {inputFoucesd && !disableAuto?<div id="autoHolder">
            {
                displayList.map((li)=>{
                    return (
                        <div className='autoElements' key={li} onClick={()=>{
                            inputRef.current.value=li
                            onChange(li)
                        }}>{li}</div>
                    )
                })
            }
        </div>:null}
      </div>
    )
}

export default SearchBox;