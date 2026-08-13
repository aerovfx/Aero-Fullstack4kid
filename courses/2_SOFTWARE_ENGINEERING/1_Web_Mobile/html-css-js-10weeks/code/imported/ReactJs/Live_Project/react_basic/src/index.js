import React from 'react';
import ReactDOM from 'react-dom/client';
// import './index.css';
import App from './App';
import {
  BrowserRouter,
  Routes,
  Route
} from "react-router-dom";


/* The following line can be included in your src/index.js or App.js file */

import 'bootstrap/dist/css/bootstrap.min.css';
import User from './components/Users/UsersComp';
import Admin from './components/Admins/AdminComp';
import HomePage from './components/Home/HomePage';


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<App />}>
      <Route index element={<HomePage />} />

        <Route path="/users" element={<User />} />
        

      </Route>
      <Route path="/admins" element={<Admin />} />
        
     
    </Routes>
  
  </BrowserRouter>

    
 
);
