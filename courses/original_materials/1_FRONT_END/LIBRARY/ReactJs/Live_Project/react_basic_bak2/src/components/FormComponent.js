// class component

// function component
import React from 'react';

class FormComponent extends React.Component {
    state = {
        name: 'Viet Chung',
        adddress: 'Vung Tau',
        age: 45,

    };

    handleChangeInputName =(event) =>{
        // alert(">> Hi");
        // console.log(event, event.target.value)
        this.setState({
            name: event.target.value
            
        })
    }
    handleChangeInputAdd =(event) =>{
        // alert(">> Hi");
        // console.log(event, event.target.value)
        this.setState({
            
            adddress: event.target.value
            
        })
    }
    handleChangeInputAge =(event) =>{
        // alert(">> Hi");
        // console.log(event, event.target.value)
        this.setState({
           
            age: event.target.value
        })
    }
    
    handleOnSubmit = (event) => {
        // Ngan chan viec tai lai trang khi an nut Submmit
        event.preventDefault();
        console.log(this.state)
    }

    render (){
        // Props

        return (
            <div>
                
                Form<br/>
                My name is {this.state.name} and i'm living in {this.state.adddress}<br/>
                I'm {this.state.age} years old.<br/>
               <form onSubmit={(event) => this.handleOnSubmit(event)}>
                    Name:
                    <input
                        value = {this.state.name}
                        type ="name"
                        onChange={(event) => this.handleChangeInputName(event)}
                    
                    />
                    <br/>
                    Address:
                    <input
                        value = {this.state.adddress}
                        type ="Address"
                        onChange={(event) => this.handleChangeInputAdd(event)}
                    
                    />
                    <br/>
                    Age:
                    <input
                        value = {this.state.age}
                        type ="Age"
                        onChange={(event) => this.handleChangeInputAge(event)}
                    
                    />
                    <button>Submit</button>
               </form>
            </div>
        );

    };
}
export default FormComponent;
