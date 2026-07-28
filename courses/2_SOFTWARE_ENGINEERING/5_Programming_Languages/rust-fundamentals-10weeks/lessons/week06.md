# Tuần 6: Smart pointer và cấu trúc liên kết

## Nguồn

Chương 09: `Box`, `Deref`, `Rc`, `RefCell`, singly/doubly linked list và reference cycle.

## Mục tiêu

- Chọn `Box<T>`, `Rc<T>`, `Arc<T>` theo ownership thực tế.
- Giải thích interior mutability và runtime borrow checking.
- Phát hiện cycle; dùng `Weak<T>` cho liên kết không sở hữu.

```rust
use std::rc::{Rc, Weak};

#[derive(Debug)]
struct Node {
    value: i32,
    parent: Weak<Node>,
}

fn main() {
    let root = Rc::new(Node { value: 1, parent: Weak::new() });
    let child = Node { value: 2, parent: Rc::downgrade(&root) };
    println!("{} -> {:?}", child.value, child.parent.upgrade().map(|n| n.value));
}
```

## Lab

Triển khai singly linked list tối thiểu với `push`, `pop`, `peek`, iterator và test drop. Viết phần giải thích vì sao `VecDeque` thường phù hợp production hơn list tự viết.

