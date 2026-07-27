// class component

// function component
import React from 'react';
class MySecondComponent extends React.Component {
    state = {
        name: 'Viet Chung',
        adddress: 'Vung Tau',
        age: 45,

    };

    clickChuot = (event) => {
        // console.log(event);
        console.log(this.state.adddress)
        console.log(this.state.name)
        console.log(this.state.age)
        //  Hien thi tuoi khi click chuot
        this.setState({
            name: 'Mr Nobody',
            adddress: 'unknow',
            age: 100,
        })
}
        
        
    

    onMouse = (event) => {
        // console.log(event.pageX);
        console.log(this.state.adddress)
        console.log(this.state.name)
        console.log(this.state.age)
        this.setState({
            name: 'Gia Huy',
            adddress: 'Quang Tri',
            age: 25
        })

    }
    render (){
        return (
            <div>
                My second component<br/>
                My name is {this.state.name} and i'm living in {this.state.adddress}<br/>
                I'm {this.state.age} years old.<br/>
                <button onClick = {(event) => {this.clickChuot(event)}}>Click me</button>
                <button onMouseOver ={(event) => {this.onMouse(event)}}>Hover me</button>

            </div>
        );

    };
}
export default MySecondComponent;