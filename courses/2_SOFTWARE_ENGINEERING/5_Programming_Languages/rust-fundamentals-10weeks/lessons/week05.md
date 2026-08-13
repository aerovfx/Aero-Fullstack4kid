# Tuần 5: Module, crate, macro và testing

## Nguồn

Chương 08, 10: module, external crate, publishing, macro, partial move, `as_ref`, `take`, `swap`, toán tử `?` và testing.

## Mục tiêu

- Tách public API khỏi implementation bằng module.
- Propagate error bằng `?` và giữ context.
- Viết unit/integration test; hiểu macro khai báo ở mức cơ bản.

```rust
pub fn parse_positive(input: &str) -> Result<u32, String> {
    let value: u32 = input.trim().parse()
        .map_err(|error| format!("'{input}' không phải số nguyên: {error}"))?;
    if value == 0 { return Err("Giá trị phải lớn hơn 0".into()); }
    Ok(value)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn rejects_zero() { assert!(parse_positive("0").is_err()); }
    #[test]
    fn parses_value() { assert_eq!(parse_positive(" 42 "), Ok(42)); }
}
```

## Lab

Tạo crate `validation` gồm module number/text, public API tối thiểu, rustdoc example và integration tests. Không publish crate thật nếu chưa review license, metadata và secret.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
