import React from 'react';

class Displayinfo extends React.Component {


    render() {
        //prop
        console.log(this.props)
        const { yo, name } = this.props;//object
        return (
            <div>
                <div>Ten toi la {name} <br/></div>
                <div> Tuoi toi la {yo} <br/></div>
                 
            </div>
        );
    }
}

export default Displayinfo;