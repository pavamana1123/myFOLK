import './App.css';
import Login from './pages/login';
import Home from './pages/home';
import {Route, BrowserRouter as Router, Routes} from "react-router-dom"
import { useEffect } from 'react';

function App() {

  useEffect(()=>{
    const addRipple = (event)=>{
      const clickable = event.currentTarget
      const circle = document.createElement("span")
      const diameter = Math.max(clickable.clientWidth, clickable.clientHeight)
      const radius = diameter / 2

      circle.style.width = circle.style.height = `${diameter}px`

      circle.style.left = `${(event.clientX-clickable.getBoundingClientRect().x-radius)}px`
      circle.style.top = `${(event.clientY-clickable.getBoundingClientRect().y-radius)}px`

      circle.classList.add("ripple")
      clickable.appendChild(circle);
      setTimeout(()=>{circle.remove()},600)
    }

    const clickables = document.getElementsByClassName('clickable')
    for (let i = 0; i < clickables.length; i++) {
      clickables[i].addEventListener('click', addRipple)
    }

    // make squares
    const squares = document.getElementsByClassName('square')
    for (let i = 0; i < squares.length; i++) {
      const side = Math.max(squares[i].getBoundingClientRect().width, squares[i].getBoundingClientRect().height)
      squares[i].style.width = `${side}px`
      squares[i].style.height = `${side}px`
      // squares[i].style.display = "grid"
    }
  })

  return (
    <div className="App">
    <Router>
        <Routes>
          <Route path="/login" element={<Login />}></Route>
          <Route path="/home" element={<Home />}></Route>
        </Routes>
    </Router>
    </div>
  );
}

export default App;
