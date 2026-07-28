# Tuần 10: File, regex, web và blockchain minh họa

## Nguồn

Chương 15, 17, 16: file/directory, regex, web server nhiều request và blockchain cơ bản/validation.

## Mục tiêu

- Đọc file/path an toàn và xử lý lỗi có context.
- Xây web server học tập, hiểu giới hạn trước khi dùng production.
- Dùng blockchain toy model để học hash/chain validation, không xem là hệ thống tài chính thật.

```rust
use std::{fs, io, path::Path};

fn count_nonempty_lines(path: &Path) -> io::Result<usize> {
    let content = fs::read_to_string(path)?;
    Ok(content.lines().filter(|line| !line.trim().is_empty()).count())
}
```

## Capstone — chọn một

1. **Log analyzer CLI:** duyệt thư mục, regex có giới hạn, thống kê và xuất báo cáo; chống path lỗi/file quá lớn.
2. **Mini web service:** router đơn giản hoặc framework phù hợp, thread/async có giới hạn, timeout và test request.
3. **Toy blockchain:** block/hash/previous hash, validate chain và phát hiện sửa dữ liệu; README phải ghi rõ không dùng cho production/crypto asset.

## Rubric

Correctness/tests 30; ownership/API 20; error handling 15; concurrency/performance 15; documentation 10; security/limitations 10. Chạy fmt, Clippy và test trước khi demo.

