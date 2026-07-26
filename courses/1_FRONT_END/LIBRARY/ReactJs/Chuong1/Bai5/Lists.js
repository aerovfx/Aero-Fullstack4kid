// 1. Hiển thị danh sách các mục:
function MyListComponent() {
    const items = ["Item 1", "Item 2", "Item 3"];
  
    return (
      <ul>
        {items.map((item) => (
          <li key={item}>{item}</li>
        ))}
      </ul>
    );
  }

//   2. Xử lý dữ liệu động từ nguồn dữ liệu bên ngoài:
class DataListComponent extends React.Component {
    state = {
      items: []
    };
  
    componentDidMount() {
      // Lấy dữ liệu từ API và cập nhật vào state
      fetch("https://api.example.com/items")
        .then((response) => response.json())
        .then((data) => this.setState({ items: data }));
    }
  
    render() {
      return (
        <ul>
          {this.state.items.map((item) => (
            <li key={item.id}>{item.name}</li>
          ))}
        </ul>
      );
    }
  }

//   3. Tạo danh sách các thành phần con:
function ParentComponent() {
    const users = [
      { id: 1, name: "John" },
      { id: 2, name: "Jane" },
      { id: 3, name: "Bob" }
    ];
  
    return (
      <div>
        {users.map((user) => (
          <ChildComponent key={user.id} name={user.name} />
        ))}
      </div>
    );
  }
  
  function ChildComponent({ name }) {
    return <p>{name}</p>;
  }

//   4. Điều hướng trong ứng dụng đa trang:
function NavigationComponent() {
    const links = [
      { id: 1, title: "Home", url: "/" },
      { id: 2, title: "About", url: "/about" },
      { id: 3, title: "Contact", url: "/contact" }
    ];
  
    return (
      <ul>
        {links.map((link) => (
          <li key={link.id}>
            <a href={link.url}>{link.title}</a>
          </li>
        ))}
      </ul>
    );
  }

//   5. Xử lý sự kiện và tương tác người dùng:
class InteractiveListComponent extends React.Component {
    state = {
      items: ["Apple", "Banana", "Orange"]
    };
  
    handleItemClick = (index) => {
      const updatedItems = [...this.state.items];
      updatedItems.splice(index, 1);
      this.setState({ items: updatedItems });
    };
  
    render() {
      return (
        <ul>
          {this.state.items.map((item, index) => (
            <li key={item} onClick={() => this.handleItemClick(index)}>
              {item}
            </li>
          ))}
        </ul>
      );
    }
  }

  
  