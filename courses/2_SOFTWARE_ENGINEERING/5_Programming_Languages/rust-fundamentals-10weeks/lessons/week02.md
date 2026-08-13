# Tuần 2: Ownership, borrowing và memory model

## Nguồn

Chương 03: primitive/non-primitive, stack/heap, move, reference bất biến và mutable.

## Mục tiêu

- Dự đoán khi nào giá trị bị move, copy hoặc borrow.
- Chọn `&str`, `&T`, `&mut T` thay vì clone không cần thiết.
- Giải thích quy tắc một mutable reference hoặc nhiều immutable reference.

```rust
fn normalize(text: &mut String) {
    *text = text.trim().to_lowercase();
}

fn longest_word(text: &str) -> Option<&str> {
    text.split_whitespace().max_by_key(|word| word.len())
}

fn main() {
    let mut text = String::from("  Learn Rust Ownership  ");
    normalize(&mut text);
    println!("{:?}", longest_word(&text));
}
```

## Lab

Viết text analyzer trả word count, longest word và frequency map. Không được clone toàn bộ input; ghi chú rõ owner của mỗi allocation.

## Lỗi cần giải thích

Use-after-move, hai mutable borrow cùng lúc, reference sống lâu hơn owner và giữ borrow qua thời điểm cần mutate.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.
