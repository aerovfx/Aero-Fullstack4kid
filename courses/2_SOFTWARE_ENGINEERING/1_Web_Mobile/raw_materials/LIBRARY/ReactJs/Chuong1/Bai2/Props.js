// Hàm với 1 component
import React from 'react';
import ReactDOM from 'react-dom/client';

function App() {
    return (
        <div>
            <MyComponent 
                name = "VIet Chung"
                bio = {{ age: 45 }}
                icon = {<Logo />}
            />
        </div>
    )
}
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);