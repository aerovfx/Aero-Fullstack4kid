# Lịch Trình Chi Tiết 10 Tuần Rust Web3 / 10-Week Rust Web3 Schedule

---

## 🗓️ Lịch Trình Chi Tiết / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks |
|-------------|----------------|-----------------------|-----------------------------------|
| **Tuần 1** | Buổi 1 | Kiến trúc Solana Blockchain: SVM, Pipelining | Cấu hình Solana CLI sang Devnet và lấy thử SOL từ faucet |
| | Buổi 2 | So sánh EVM vs SVM (Solana Virtual Machine) | Chạy lệnh \`solana balance\` và kiểm tra giao dịch trên Solana Explorer |
| **Tuần 2** | Buổi 3 | Mô hình Tài khoản Solana (Solana Account Model)| Tìm hiểu sự khác biệt giữa Data Account và Executable Account |
| | Buổi 4 | Cơ chế Rent & Lưu trữ dữ liệu trên Solana | Tính toán chi phí Rent miễn trừ (Rent-exempt) cho tài khoản dữ liệu |
| **Tuần 3** | Buổi 5 | Thiết lập môi trường Anchor Framework | Cài đặt Anchor CLI, avm, yarn và khởi tạo dự án Anchor mới |
| | Buổi 6 | Cấu trúc một dự án Anchor: Cargo.toml, Anchor.toml| Tìm hiểu cấu hình các chương trình và khóa Deploy |
| **Tuần 4** | Buổi 7 | Viết Solana Program thô đầu tiên (Native Rust Program)| Khai báo entrypoint, Instruction data và AccountInfo |
| | Buổi 8 | Đóng gói và Deploy Local Program | Chạy \`solana-test-validator\` cục bộ và deploy program thô |
| **Tuần 5** | Buổi 9 | Khai báo chương trình với Anchor Framework | Viết hàm HelloWorld sử dụng macro \`#[program]\` |
| | Buổi 10 | Context & Accounts Struct trong Anchor | Định nghĩa cấu trúc tài liệu đầu vào với macro \`#[derive(Accounts)]\`|
| **Tuần 6** | Buổi 11 | Lập trình lưu trữ trạng thái (State Management) | Viết chương trình tăng giảm bộ đếm Counter lưu trên chain |
| | Buổi 12 | Khởi tạo tài khoản dữ liệu dùng macro \`#[account(init)]\` | Định nghĩa \`payer\`, \`space\`, và \`system_program\` khởi tạo tài khoản |
| **Tuần 7** | Buổi 13 | Giới thiệu SPL Token Standard (Tương đương ERC-20)| Tạo Token Mint và Token Account sử dụng Solana CLI |
| | Buổi 14 | Viết Program tương tác với Token Program bằng Rust | Lập trình đúc (mint) Token và chuyển Token qua Anchor Program |
| **Tuần 8** | Buổi 15 | Bảo mật chương trình Solana: Account Validation | Sử dụng macro \`#[account(mut, has_one = owner)]\` để phân quyền |
| | Buổi 16 | Phòng chống lỗi số học & Tràn bộ nhớ (Overflows) | Sử dụng thư viện \`checked_add\`, \`checked_sub\` khi tính toán |
| **Tuần 9** | Buổi 17 | Kiểm thử hợp đồng bằng Mocha/Chai (TypeScript) | Viết file test Anchor gọi hàm tăng Counter và kiểm tra kết quả |
| | Buổi 18 | Kiểm thử Token transfer và bắt lỗi bảo mật | Viết test case giả lập ví lạ gọi rút tiền để xác nhận lỗi bị chặn |
| **Tuần 10**| Buổi 19 | Tích hợp Solana Web3.js với ứng dụng React | Sử dụng Solana Wallet Adapter tạo nút bấm kết nối ví |
| | Buổi 20 | Đọc và ghi dữ liệu từ Solana Program lên giao diện DApp | Gọi instruction chuyển tiền từ giao diện DApp React |

---

## 🎯 Checklist Sản Phẩm Đầu Ra / Weekly Deliverables

- [ ] **Tuần 1**: Địa chỉ ví Solana cá nhân có số dư Testnet SOL.
- [ ] **Tuần 2**: Báo cáo so sánh mô hình tài khoản EVM vs Solana Account.
- [ ] **Tuần 3**: Dự án Anchor mới khởi tạo biên dịch thành công.
- [ ] **Tuần 4**: Native Solana Program được deploy thành công trên local validator.
- [ ] **Tuần 5**: Hợp đồng Anchor xuất ra tệp định nghĩa giao diện IDL JSON.
- [ ] **Tuần 6**: Hợp đồng bộ đếm Counter chạy thử trên localnet.
- [ ] **Tuần 7**: SPL Token được tạo và lưu trữ trên ví Phantom cá nhân.
- [ ] **Tuần 8**: Contract được bảo vệ tránh lỗi tràn số và bypass quyền truy cập.
- [ ] **Tuần 9**: Các ca kiểm thử Anchor test chạy thành công 100%.
- [ ] **Tuần 10**: Website React kết nối ví Phantom và tương tác được contract.
