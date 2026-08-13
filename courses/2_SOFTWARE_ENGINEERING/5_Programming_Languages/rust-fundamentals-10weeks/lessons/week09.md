# Tuần 9: Concurrency và async/await

## Nguồn

Chương 14: thread, ownership, channel, multiple producer, shared state, mutex, barrier, scoped thread, parking/yielding, async task và `select`.

## Mục tiêu

- Chọn message passing hoặc shared state có chủ đích.
- Dùng `Arc<Mutex<T>>` mà không giữ lock qua công việc chậm.
- Phân biệt OS thread, async task và CPU-bound/I/O-bound.

```rust
use std::{sync::mpsc, thread};

fn main() {
    let (sender, receiver) = mpsc::channel();
    for value in 1..=4 {
        let sender = sender.clone();
        thread::spawn(move || sender.send(value * value).expect("receiver alive"));
    }
    drop(sender);
    let sum: i32 = receiver.iter().sum();
    println!("sum={sum}");
}
```

## Lab

Xây job runner có worker, channel, graceful shutdown và thu lỗi từng job. Nâng cao: viết phiên bản async có timeout/cancellation rồi so sánh, không gọi blocking I/O trực tiếp trong async executor.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.
