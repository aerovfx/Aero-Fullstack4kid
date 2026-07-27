import React from "react";


class Tong extends React.Component {
    state = {
        name: 'Viet Chung',
        yo: '36',
        lop: '11A1'
    }
    handleClick = (event) =>{
        console.log("Ten toi la: ",this.state.name)
    }
    handleOnMouseOver(event){
        console.log(event)
    }
    render(){
        return (
            <div>
            Thong tin ve {this.state.name}, <br/>
            Tuoi toi la {this.state.yo}, <br/>
            toi hoc lop: {this.state.lop}<br/>
            <button onClick = {(event) =>{this.handleClick(event)}}>Click me</button><br/>
            <button onMouseOver={this.handleOnMouseOver}>Hover me</button><br/>
            </div>
            
        )
    }
}
export default SetState;