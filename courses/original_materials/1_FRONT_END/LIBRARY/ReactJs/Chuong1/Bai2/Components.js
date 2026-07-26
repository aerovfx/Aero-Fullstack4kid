
// Cú pháp hàm nhúng JS vào HTML còn gọi là JSX

function MyComponent1(){
    return <p>hey</p> //JSX
}

// Cú pháp hàm mũi tên (Hook)
const MyComponent2 = () => {  return <p>hi</p>  } //JSX

import { func } from 'prop-types';
// Cú pháp lớp Class
import React from 'react';

class MyComponent3 extends React.Component {
    render() {
        return <p>hola</p>; //JSX
    }
}

export default MyComponent3;

// Hàm với JSX viết tắt
function MyComponent() {
    return (
        <>
            <h1>Hi, Viet Chung</h1>
            <button>Show me</button>
        </>
    )
}

// Hàm với Dynamic Expressions
function MyComponent() {
    return (
        <>
            {1 + 5 + 9}
        </>
    )
}


// Hàm với 1 component
function App() {
    return (
        <div>
            <MyComponent />
        </div>
    )
}