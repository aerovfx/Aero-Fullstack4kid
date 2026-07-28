# Tuần 4: Stack, iterator, closure và lifetime

## Nguồn

Chương 05, 07: triển khai stack, đảo chuỗi, infix/postfix, lifetime, closure, function type và iterator.

## Mục tiêu

- Xây `Stack<T>` generic trên `Vec<T>`.
- Tạo pipeline iterator không cấp phát trung gian không cần thiết.
- Đọc lifetime annotation và hiểu quan hệ giữa input/output reference.

```rust
#[derive(Debug, Default)]
struct Stack<T> { items: Vec<T> }

impl<T> Stack<T> {
    fn push(&mut self, value: T) { self.items.push(value); }
    fn pop(&mut self) -> Option<T> { self.items.pop() }
    fn peek(&self) -> Option<&T> { self.items.last() }
}

fn top_even(values: &[i32]) -> Option<i32> {
    values.iter().copied().filter(|value| value % 2 == 0).max()
}
```

## Lab

Viết postfix evaluator hỗ trợ `+ - * /`, trả `Result`, phát hiện thiếu operand, token sai và chia cho zero. Không dùng `unwrap()` trong implementation.

