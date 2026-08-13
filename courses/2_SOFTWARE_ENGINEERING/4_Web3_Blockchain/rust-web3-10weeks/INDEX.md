# Rust Web3 & Solana — 10 tuần

Khóa học dẫn từ SVM và account model đến Rust/Anchor, SPL Token, kiểm thử bảo mật và DApp client. Các ví dụ Rust chỉ dùng thư viện chuẩn để có thể chạy offline; bài học giải thích cách áp dụng vào Solana/Anchor.

## Cấu trúc

- [Lịch học](schedule.md)
- `lessons/week01.md` … `week10.md`: lý thuyết và lab.
- `code/week01.rs` … `week10.rs`: code mẫu chạy độc lập.
- `exercises/week01` … `week10`: đề bài và starter cho học viên.
- [Dự án cuối khóa](projects/final_project.md)

## Chạy code mẫu

Yêu cầu Rust stable:

```bash
rustc code/week01.rs -o /tmp/rust-web3-week01
/tmp/rust-web3-week01
```

## Nguyên tắc an toàn

Chỉ dùng local validator/devnet. Không commit keypair, seed phrase hay private key; mọi instruction phải xác thực owner, signer, writable account và số học an toàn.
