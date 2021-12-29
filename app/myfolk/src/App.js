import './App.css';
import Login from './pages/login';
import {Route, BrowserRouter as Router, Routes} from "react-router-dom"

function App() {
  return (
    <div className="App">
    <Router>
        <Routes>
          <Route path="/login" element={<Login />}></Route>
        </Routes>
    </Router>
    </div>
  );
}

export default App;
