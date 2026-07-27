# Lịch Trình Chi Tiết 10 Tuần Rust Back-End / 10-Week Rust Back-End Schedule

---

## 🗓️ Lịch Trình Chi Tiết / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks |
|-------------|----------------|-----------------------|-----------------------------------|
| **Tuần 1** | Buổi 1 | Tổng quan ngôn ngữ Rust, Cargo & Cú pháp cơ bản | Cài đặt Rustup, khởi tạo project Cargo đầu tiên |
| | Buổi 2 | Biến số, Khả biến (Mutability) & Kiểu dữ liệu tĩnh | Viết chương trình tính toán số học & định dạng in dữ liệu |
| **Tuần 2** | Buổi 3 | Cơ chế Ownership (Quyền sở hữu bộ nhớ) trong Rust | Thực hành debug các lỗi Compile liên quan đến Move semantics |
| | Buổi 4 | Cơ chế Borrowing (Vay mượn) & References | Viết các hàm mượn dữ liệu (immutable & mutable references) |
| **Tuần 3** | Buổi 5 | Cấu trúc dữ liệu Structs & Implementations (methods) | Tạo Struct quản lý thông tin khách hàng và viết các hàm xử lý |
| | Buổi 6 | Enums, Pattern Matching & Luồng xử lý \`match\` | Viết bộ phân tích cú pháp chuỗi sử dụng Enum & match pattern |
| **Tuần 4** | Buổi 7 | Quản lý lỗi an toàn: Result & Option Enums | Thay thế các lệnh hoảng loạn (panic) bằng Result handling |
| | Buổi 8 | Generics & Trait (Định nghĩa hành vi trong Rust) | Viết trait Serialize đơn giản chuyển đối tượng thành string |
| **Tuần 5** | Buổi 9 | Con trỏ thông minh (Smart Pointers): Box, Rc, Arc | Khởi tạo dữ liệu trên Heap sử dụng Box và chia sẻ con trỏ |
| | Buổi 10 | Lập trình bất đồng bộ: Async/Await & Tokio Runtime | Chạy các nhiệm vụ tính toán song song với Tokio task spawn |
| **Tuần 6** | Buổi 11 | Giới thiệu Axum Web Framework | Khởi tạo server Axum cơ bản lắng nghe cổng localhost |
| | Buổi 12 | Thiết lập Router & Routing trong Axum | Viết các route GET, POST tĩnh phản hồi chuỗi text |
| **Tuần 7** | Buổi 13 | Lấy dữ liệu: Path parameters, Query & JSON body | Viết API nhận JSON sử dụng Serde deserialization |
| | Buổi 14 | Tower Service & Viết Middleware cho Axum Server | Viết Middleware in log thời gian xử lý request |
| **Tuần 8** | Buổi 15 | Kết nối cơ sở dữ liệu: SQLx & PostgreSQL | Cấu hình file .env và kết nối pool database |
| | Buổi 16 | Tạo bảng và migrations bằng SQLx CLI | Viết các migration tạo bảng User và chạy sqlx-cli migrate |
| **Tuần 9** | Buổi 17 | Truy vấn dữ liệu bất đồng bộ với SQLx macros | Viết API CRUD hoàn chỉnh đọc ghi dữ liệu từ PostgreSQL |
| | Buổi 18 | Xác thực người dùng: JWT Authentication | Viết middleware kiểm tra JWT token hợp lệ trong header |
| **Tuần 10**| Buổi 19 | Kiểm thử tích hợp (Integration Testing) trong Rust | Viết file test tích hợp gọi API giả lập qua hyper client |
| | Buổi 20 | Đóng gói ứng dụng container Docker & Deploy | Viết Dockerfile tối ưu kích thước build Rust chỉ 15MB và deploy |

---

## 🎯 Checklist Sản Phẩm Đầu Raw / Weekly Deliverables

- [ ] **Tuần 1**: Cargo project chạy thành công in ra kết quả tính toán cơ bản.
- [ ] **Tuần 2**: Đoạn code xử lý chuỗi không bị lỗi compile borrow checker.
- [ ] **Tuần 3**: Struct User hoạt động tốt cùng phương thức in thông tin.
- [ ] **Tuần 4**: Hàm đọc file an toàn trả về `Result<String, std::io::Error>`.
- [ ] **Tuần 5**: Chạy thành công 3 task bất đồng bộ song song dùng Tokio.
- [ ] **Tuần 6**: Server Axum hello-world chạy trên cổng 8080.
- [ ] **Tuần 7**: API nhận payload JSON đăng ký người dùng hợp lệ.
- [ ] **Tuần 8**: Kết nối thành công tới database Postgres local thông qua SQLx.
- [ ] **Tuần 9**: Bộ API CRUD hoàn chỉnh kết nối database chạy trong 2ms.
- [ ] **Tuần 10**: Docker image chứa binary Rust chạy độc lập trên máy chủ.
