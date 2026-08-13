# Rust Fundamentals — 10 tuần

Khóa học xây nền ownership, borrowing, kiểu dữ liệu, trait, xử lý lỗi, testing và concurrency trước khi hoàn thiện Task CLI.

## Cấu trúc

- [Lịch học](schedule.md)
- `lessons/week01.md` … `week10.md`: bài học.
- `code/week01.rs` … `week10.rs`: ví dụ chạy độc lập.
- `exercises/week01` … `week10`: starter cho học viên.
- [Dự án cuối khóa](projects/final_project.md)

## Chạy

```bash
rustc code/week01.rs -o /tmp/rust-week01
/tmp/rust-week01
```

Không dùng `unwrap()` trên dữ liệu người dùng; biểu diễn đường lỗi dự kiến bằng `Result` hoặc `Option`.
