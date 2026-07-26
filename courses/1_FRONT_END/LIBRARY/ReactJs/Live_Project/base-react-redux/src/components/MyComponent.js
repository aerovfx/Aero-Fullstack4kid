// class component

// function component
import React from "react";
import UserInfor from './UserInfor';
import Displayinfo from "./Displayinfor";
import ArrowFunction from "./ArrowFunction";
import HandleClick from "./HandleClick";
import MySecondComponent from "./MySecondComponent";
class MyComponent  extends React.Component {
 
    render() {
        const myInfo = ['ab', 'ds']
    
        //console.log(this.props)
        return (
            <div>
                <div>Thanh phan thu 2</div>
                <MySecondComponent />
                <div>Thong tin nguoi dung 1</div>
                <UserInfor />
                <hr/>
                <div>Thong tin nguoi dung 2</div>
                <Displayinfo name = "VietChung" yo="20"/>
                <hr/>
                <Displayinfo name={"Nhanma"} yo ={36} myInfo={myInfo}/>
                <hr/>
                <HandleClick />
                {/* <Input_ArrowFunction></Input_ArrowFunction> */}
                <hr/>
                <div>Test Arrow function</div>
                <ArrowFunction />


            </div>
        );
    }


}
export default MyComponent;