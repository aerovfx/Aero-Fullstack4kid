import logo from './logo.svg';
import './App.css';
import { useDispatch, useSelector } from 'react-redux';
import { increaseCounter, decreaseCounter } from './redux/action/counterAction';
import MyComponent from './components/MyComponent';
// import MySecondComponent from './components/MySecondComponent';
//import VComponent from './components/VComponent';
import Input_ArrowFunction from './components/Input_ArrowFunction';
import React from 'react';

// Class function
// class App extends React.Component{

//   render(){
//     return (
//       <div>
//         <Input_ArrowFunction></Input_ArrowFunction>
//       </div>      
//     )
//   }
// }

const App = () => {
  const count = useSelector(state => state.counter.count);
  const dispatch = useDispatch();

  return (
    <div>
      <MyComponent />
      
    </div>
  )
}


    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //     <p>
    //       Edit <code>src/App.js</code> and save to reload.
    //     </p>
        
    //   </header>
    // </div>


export default App;
