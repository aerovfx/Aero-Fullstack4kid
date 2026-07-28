# Rust từ nền tảng đến ứng dụng — 10 tuần

Khóa Rust độc lập với framework cụ thể. Học viên xây tư duy ownership trước, sau đó đi tới data structure, trait, smart pointer, concurrency, file/text processing, web, blockchain minh họa và đo hiệu năng.

## Nguồn chuyên đề

- [Thư mục giáo trình Rust gồm 18 chương](https://drive.google.com/drive/folders/1MN5tcDQDwEY3KVa3r9FZiDIV_r3-lfGy?usp=share_link)
- Nguồn có video, phụ đề và code/data đi kèm. Nội dung được tái cấu trúc thành 10 tuần; không sao chép nguyên video vào repository.

## Chuẩn bị

```bash
rustup update stable
cargo new task_cli
cd task_cli
cargo run
```

Kiểm tra chất lượng thường xuyên bằng `cargo fmt --check`, `cargo clippy -- -D warnings` và `cargo test`.

## Lộ trình

| Tuần | Chủ đề | Code trọng tâm | Sản phẩm |
|---|---|---|---|
| 1 | Cargo, biến, kiểu dữ liệu, hàm | `let`, `mut`, `match` | Máy tính tiền |
| 2 | Ownership và move semantics | `String`, scope, clone | Trình xử lý văn bản |
| 3 | Borrowing, slice, lifetime cơ bản | `&T`, `&mut T`, `&str` | Bộ thống kê từ |
| 4 | Struct, enum, pattern matching | `impl`, `Option`, `match` | Mô hình task |
| 5 | Collection và iterator | `Vec`, `HashMap`, iterator | Báo cáo điểm |
| 6 | Error handling | `Result`, `?`, custom error | Đọc/ghi tệp an toàn |
| 7 | Generic, trait và module | trait bound, `mod`, crate | Thư viện validation |
| 8 | Testing và quality tooling | unit/integration test, Clippy | Test suite |
| 9 | Thread và channel | `thread`, `Arc`, `Mutex`, channel | Xử lý job song song |
| 10 | CLI hoàn chỉnh | argument, persistence, release | Task CLI |

Lộ trình mở rộng và ánh xạ đủ 18 chương nguồn nằm tại [schedule.md](schedule.md). Bài giảng chi tiết nằm trong `lessons/`.

## Ví dụ cốt lõi: ownership và borrowing

```rust
fn word_count(text: &str) -> usize {
    text.split_whitespace().count()
}

fn normalize(text: &mut String) {
    *text = text.trim().to_lowercase();
}

fn main() {
    let mut title = String::from("  Learn Rust Safely  ");
    normalize(&mut title);
    println!("{title}: {} words", word_count(&title));
}
```

`word_count` chỉ mượn dữ liệu; `normalize` mượn có quyền thay đổi. Biến `title` vẫn hợp lệ sau hai lần gọi vì quyền sở hữu không bị chuyển đi.

## Đồ án cuối khóa

Xây Task CLI có lệnh thêm, liệt kê, hoàn thành và xóa task; lưu dữ liệu xuống tệp; đầu vào sai trả về lỗi có ý nghĩa. Tối thiểu 8 test, không dùng `unwrap()` trong luồng xử lý chính và vượt qua Clippy với `-D warnings`.

Code khởi đầu: [`code/task_cli.rs`](code/task_cli.rs).
