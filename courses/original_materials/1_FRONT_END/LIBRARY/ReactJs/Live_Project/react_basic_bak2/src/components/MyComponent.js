// class component

// function component
import React from 'react';
import FormComponent from './FormComponent';
import MySecondComponent from './MySecondComponent';
import DisplayInfoComponent from './DisplayInfoComponent';
class MyComponent extends React.Component {
    state = {
        ArrayUser: [
            {id: 1, name: "Nguyen Van A", address: "Ha Noi", age:"30"},
            {id: 2, name: "Nguyen Van B", address: "Binh Duong", age:"35"},
            {id: 3, name: "Nguyen Van C", address: "Phu Yen",  age:"40"},
            {id: 4, name: "Nguyen Van D", address: "Quang Ninh", age:"45"},
            {id: 5, name: "Nguyen Van E", address: "Quang Binh", age:"50"},

        ]

    }
    render (){
        // truyen doi tuong, bien
        // const myAge = 50;
        // let person = {
        //     name: "Noname",
        //     address: "Nowhere",
        //     age: 100
        // }

       
        return (
            <div>
                My first component
                <hr/>
                <MySecondComponent />
                <hr/>
                <FormComponent />
                <hr/>
                {/* <DisplayInfoComponent name = {person.name} age = {person.age} address = {person.address}/> */}
                <DisplayInfoComponent 
                    ArrayUser = {this.state.ArrayUser}
                
                />
            </div>
        );

    }
}
export default MyComponent;