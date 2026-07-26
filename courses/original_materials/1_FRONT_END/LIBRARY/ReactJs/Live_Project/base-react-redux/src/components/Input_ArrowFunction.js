import React from 'react';

class Input_ArrowFunction extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            a: '',
            b: '',
        };
    }

    handleInputChange = (event) => {
        const { name, value } = event.target;
        this.setState({ [name]: value });
    };

    calculateSum = () => {
        const { a, b } = this.state;
        return Number(a) + Number(b);
    };

    render() {
        return (
            <div>
                {/* Input fields */}
                <label>
                    Nhập a:
                    <input type="number" name="a" value={this.state.a} onChange={this.handleInputChange} />
                </label>
                <br />
                <label>
                    Nhập b:
                    <input type="number" name="b" value={this.state.b} onChange={this.handleInputChange} />
                </label>
                <br />

                {/* Arrow function */}
                <p>Tổng của {this.state.a} và {this.state.b} là {this.calculateSum()}</p>
            </div>
        );
    }
}

export default Input_ArrowFunction;