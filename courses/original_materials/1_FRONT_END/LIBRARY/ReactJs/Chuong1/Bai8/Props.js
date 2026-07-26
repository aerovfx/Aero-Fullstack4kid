// 1. Ví dụ về truyền dữ liệu từ thành phần cha xuống thành phần con:
// Thành phần cha
function ParentComponent() {
    return <ChildComponent name="John" age={25} />;
  }
  
  // Thành phần con
  function ChildComponent(props) {
    return (
      <div>
        My name is {props.name} and I am {props.age} years old.
      </div>
    );
  }
//   Kết quả: My name is John and I am 25 years old.

// 2. Ví dụ về truyền các thành phần con như là props:
// Thành phần cha
function ParentComponent() {
    return (
      <div>
        <GreetingComponent name="John" />
        <MessageComponent message="Welcome to my website!" />
      </div>
    );
  }
  
  // Thành phần con
  function GreetingComponent(props) {
    return <h1>Hello, {props.name}!</h1>;
  }
  
  function MessageComponent(props) {
    return <p>{props.message}</p>;
  }
// Output: Hello, John!
// Output: Welcome to my website!

// 3. Ví dụ về truyền các thành phần con trong một danh sách sử dụng props:
// Thành phần cha
function ParentComponent() {
    const users = ["John", "Jane", "Bob"];
  
    return (
      <div>
        {users.map((user) => (
          <UserComponent key={user} name={user} />
        ))}
      </div>
    );
  }
  
  // Thành phần con
  function UserComponent(props) {
    return <p>{props.name}</p>;
  }
//   Output: John
//   Jane
//   Bob

//   4. Ví dụ về truyền các hàm xử lý sự kiện thông qua props:
// Thành phần cha
function ParentComponent() {
    function handleClick() {
      console.log("Button clicked!");
    }
  
    return <ButtonComponent onClick={handleClick} />;
  }
  
  // Thành phần con
  function ButtonComponent(props) {
    return <button onClick={props.onClick}>Click me</button>;
  }
  
//   Khi nút được nhấp, "Button clicked!" sẽ được ghi ra trong console.

// 6. Ví dụ về truyền các đối tượng và mảng qua props:
// Thành phần cha
function ParentComponent() {
    const person = {
      name: "John",
      age: 30,
      hobbies: ["reading", "running", "cooking"],
    };
  
    return <PersonComponent person={person} />;
  }
  
  // Thành phần con
  function PersonComponent(props) {
    return (
      <div>
        <p>Name: {props.person.name}</p>
        <p>Age: {props.person.age}</p>
        <p>Hobbies: {props.person.hobbies.join(", ")}</p>
      </div>
    );
  }
// Name: John
// Age: 30
// Hobbies: reading, running, cooking


  