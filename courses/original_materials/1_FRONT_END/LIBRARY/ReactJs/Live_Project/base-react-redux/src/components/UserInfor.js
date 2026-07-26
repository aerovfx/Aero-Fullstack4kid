import React from 'react';

class UserInfor extends React.Component {
    state = {
        name: 'Viet Chung',
        yo: '36',
        lop: '11A1'
    }

    render() {
        //prop
        console.log(this.props)
        const { yo, name, lop } = this.state;
        return (
            <div>
                <div>Ten toi la {name}, <br/></div>
                <div> Tuoi toi la {yo}, <br/></div>
                <div>toi hoc lop: {lop}<br/></div>              
            </div>
        );
    }
}

export default UserInfor;