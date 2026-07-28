# Tuần 1: Rust toolchain và lập trình cơ bản

## Nguồn

Chương 01, 02, 04: cài Rust, Cargo, output/comment, biến, scalar/compound type, string, vector, hàm, `if`, `match`, vòng lặp.

## Mục tiêu

- Tạo, build, run và test project bằng Cargo.
- Chọn kiểu dữ liệu phù hợp, phân biệt array/tuple/vector/string.
- Viết hàm nhỏ và control flow không lạm dụng biến mutable.

```rust
fn total_with_tax(prices: &[f64], tax_rate: f64) -> f64 {
    let subtotal: f64 = prices.iter().sum();
    subtotal * (1.0 + tax_rate)
}

fn main() {
    let prices = vec![25_000.0, 40_000.0, 15_000.0];
    let total = total_with_tax(&prices, 0.08);
    println!("Tổng thanh toán: {total:.0} VND");
}
```

## Lab

Xây Expense CLI nhận danh sách khoản chi, phân loại bằng `match`, tính tổng/trung bình và từ chối số âm. Thêm test cho danh sách rỗng và dữ liệu hợp lệ.

## Hoàn thành khi

Code không warning, hàm tính toán tách khỏi input/output và có ít nhất ba test.

