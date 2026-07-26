// import logo from './logo.svg';
import './App.css';
import Header from './components/Header/HeaderComp';
// import MyComponent from './components/MyComponent';
import { Outlet, NavLink } from 'react-router-dom';

function App() {
  return (
    <div className='app-container'>
      <div className='header-container'>
        <Header />

      </div>

      <div className='sidenav-container'>

      </div>

      <div className='main-container'>


      </div>
      <div className='app-container'>
        <Outlet />
       
      </div>
    
      
    
    </div>
  );
}

export default App;
