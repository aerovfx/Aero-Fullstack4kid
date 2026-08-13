import React from "react";

class HandleClick extends React.Component {
  state = {
    name: "Viet Chung",
    tuoi: "36" // Thêm thuộc tính tuoi vào state
  };

  handleOnChangeInput = (event) => {
    this.setState({
      name: event.target.value
    });
    console.log(">>click my button");
  };

  handleClick = (event) => {
    const randomAge = Math.floor(Math.random() * 100 + 1); // Tạo giá trị tuổi ngẫu nhiên
    console.log(" random ", randomAge);
    this.setState({
      tuoi: randomAge // Cập nhật giá trị tuoi trong state
    });
  };

  render() {
    return (
      <div>
        Hello, My name is {this.state.name}, {this.state.tuoi} years old.
        <br />
        <input type="text" onChange={this.handleOnChangeInput} />
        <button onClick={this.handleClick}>Click me</button>
      </div>
    );
  }
}

export default HandleClick;
