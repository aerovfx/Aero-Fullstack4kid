# Tuần 3: Struct, enum, trait và xử lý lỗi

## Nguồn

Chương 06: struct, trait/default method, enum, generic, `Option`, `Result`, `HashMap`.

## Mục tiêu

- Mô hình hóa domain bằng type thay vì string rời rạc.
- Dùng trait cho hành vi chung và generic có trait bound.
- Dùng `Option`/`Result` thay sentinel hoặc panic trong lỗi dự kiến.

```rust
#[derive(Debug, Clone, Copy, PartialEq)]
enum StockStatus { Available, OutOfStock }

#[derive(Debug)]
struct Product { name: String, quantity: u32 }

impl Product {
    fn status(&self) -> StockStatus {
        if self.quantity == 0 { StockStatus::OutOfStock } else { StockStatus::Available }
    }

    fn remove(&mut self, amount: u32) -> Result<(), String> {
        self.quantity = self.quantity.checked_sub(amount)
            .ok_or_else(|| "Không đủ tồn kho".to_string())?;
        Ok(())
    }
}
```

## Lab

Xây inventory lưu bằng `HashMap<String, Product>`, hỗ trợ add/remove/find. Test out-of-stock, missing product và quantity overflow/underflow.

