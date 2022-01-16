import './App.css';
import Login from './pages/login';
import Home from './pages/home';
import {Route, BrowserRouter as Router, Routes} from "react-router-dom"

function App() {
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
