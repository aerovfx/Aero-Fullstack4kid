# Khoá Học: Lập Trình Rust Back-End Chuyên Sâu / Course: Rust Back-End Development

Chào mừng bạn đến với khoá học **Lập trình Rust Back-End chuyên sâu (10 Tuần)**. Khoá học này được thiết kế để đào tạo học viên các kiến thức từ cơ bản về ngôn ngữ Rust, cơ chế quản lý bộ nhớ an toàn (Ownership/Borrowing) cho tới việc phát triển các ứng dụng Web APIs hiệu năng cao sử dụng Axum, kết nối PostgreSQL qua SQLx và đóng gói sản phẩm.

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │      PHẦN 1: NGÔN NGỮ RUST & TOKIO RUNTIME (CORE RUST) │
                                    │      PART 1: RUST LANGUAGE & ASYNC TOKIO               │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1 - 2: Cú pháp cơ bản, Ownership & Borrowing
                                         Tuần 3 - 4: Structs, Enums, Traits & Generics
                                         Tuần 5: Lập trình bất đồng bộ (Tokio runtime)
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │      PHẦN 2: AXUM WEB WEB & DATABASES (AXUM & SQLX)    │
                                    │      PART 2: RUST WEB APIs & DATABASES                 │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 6 - 7: Web server với Axum, Router, Middleware
                                         Tuần 8: Tích hợp CSDL PostgreSQL sử dụng SQLx
                                         Tuần 9 - 10: JWT Auth, Testing & Dockerize Deploy
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │             BẢO VỆ DỰ ÁN CUỐI KHOÁ / DEMO DAY          │
                                    └────────────────────────────────────────────────────────┘
```

---

## 🗂️ Danh Mục Tài Liệu / Document Index

| Tài liệu / Document | Mô tả / Description |
|---------------------|---------------------|
| [Lịch Trình Học / Schedule](schedule.md) | Phân bổ 20 buổi học chi tiết và yêu cầu đầu ra / Detail schedule for 20 sessions |
| [Dự Án Cuối Khoá / Final Projects](projects/final_project.md) | Danh sách 3 hướng dự án tốt nghiệp Back-End Rust / 3 tracks of final projects |

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Ngôn ngữ**: Rust (Edition 2021).
- **Môi trường / Thư viện**: Cargo, rustc.
- **Web framework**: Axum, Tower-HTTP, Serde (JSON serialization).
- **Async Runtime**: Tokio.
- **Cơ sở dữ liệu**: PostgreSQL, SQLx (Async SQL toolkit).
