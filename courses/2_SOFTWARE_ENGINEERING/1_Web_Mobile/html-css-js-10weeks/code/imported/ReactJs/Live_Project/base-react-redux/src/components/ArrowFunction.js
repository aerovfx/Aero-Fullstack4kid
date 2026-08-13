import React from 'react';

class ArrowFunction extends React.Component {
    render() {
        const a = 2;
        const b = 3;
        const sum = (a, b) => a + b; // Arrow function để tính toán a + b
            
        return (
            <div>
                {/* Arrow function */}
                <p>Tổng của {a} và {b} là {sum(a, b)}</p>
            </div>
        )
    }
}

export default ArrowFunction;
