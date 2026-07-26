// class component

// function component
import React from 'react';

class DisplayInfoComponent extends React.Component {
    render (){
        console.log(this.props)
        const { ArrayUser } = this.props;
        // const { age, name } = this.props; //Object
        //Props truyen data 
        // tu Component cha la MyComponent 
        // xuong component con la DisplayInfoComponent
        return (
            <div>
                { ArrayUser.map((user, index) => {
                    // console.log(user)
                    return (
                        <div key ={user.id}>
                            <div>My name's {user.name}</div>
                            <div>My address's {user.address}</div>
                            <div>My age's {user.age}</div>
                            <hr/>
                        </div>

                    )
                    
                })}        
            </div>
        );

    }
}
export default DisplayInfoComponent;