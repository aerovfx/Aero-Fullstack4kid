# Hướng dẫn triển khai dành cho giáo viên

## 1. Mô hình tổ chức

- **Nhóm:** 3–4 học sinh/bộ kit.
- **Vai trò luân phiên:** trưởng nhóm, lập trình viên, kỹ sư phần cứng, kiểm thử viên/thư ký.
- **Thời lượng chuẩn:** 90 phút. Với tiết 45 phút, tách phần khám phá và chế tạo thành hai buổi.
- **Nền tảng chính:** MakeCode Blocks; MicroPython là nhánh nâng cao.
- **Minh chứng bắt buộc:** sơ đồ kết nối, mã chương trình, dữ liệu kiểm thử, ảnh/video sản phẩm và phản tư ngắn.

## 2. Cấu trúc một buổi 90 phút

| Giai đoạn | Thời lượng | Hoạt động | Sản phẩm quan sát được |
|---|---:|---|---|
| Gắn kết | 8 phút | Tình huống thực tế, câu hỏi dẫn nhập | Dự đoán hoặc tiêu chí thành công |
| Khám phá | 12 phút | Thử nhanh phần cứng/mô phỏng | Ghi nhận hiện tượng |
| Giải thích | 15 phút | Khái niệm và mẫu lệnh cốt lõi | Sơ đồ khối/pseudocode |
| Chế tạo | 35 phút | Lắp, lập trình, kiểm thử | Nguyên mẫu hoạt động |
| Cải tiến | 12 phút | Thử thách phân hóa | Phiên bản cải tiến |
| Đánh giá | 8 phút | Demo, exit ticket, phản tư | Minh chứng và tự đánh giá |

## 3. Chu trình thiết kế kỹ thuật

Mỗi dự án đi qua sáu bước: **Xác định vấn đề → Đặt tiêu chí/ràng buộc → Đề xuất giải pháp → Tạo mẫu → Kiểm thử bằng dữ liệu → Cải tiến và truyền thông**. Không đánh giá sản phẩm chỉ bằng việc “chạy được”; học sinh phải giải thích lựa chọn và dùng kết quả thử nghiệm làm bằng chứng.

## 4. Đánh giá

### Đánh giá thường xuyên

- Câu hỏi chẩn đoán đầu giờ.
- Quan sát thao tác kết nối và làm việc nhóm.
- Kiểm tra mã theo cặp.
- Exit ticket 3 câu: *Em tạo được gì? Dữ liệu nào chứng minh? Em sẽ sửa gì?*

### Trọng số gợi ý

| Thành phần | Tỷ trọng |
|---|---:|
| Quiz và kiến thức nền | 20% |
| Thực hành cá nhân/nhóm | 30% |
| Nhật ký kỹ thuật | 15% |
| Dự án cuối khóa | 35% |

## 5. Phân hóa

- **Hỗ trợ:** cung cấp sơ đồ nối dây, chương trình khung, thẻ lệnh và checklist từng bước.
- **Đạt chuẩn:** học sinh tự xây chương trình theo yêu cầu chức năng và giải thích luồng dữ liệu.
- **Mở rộng:** thêm hiệu chuẩn, bộ lọc dữ liệu, trạng thái lỗi, truyền radio hoặc giao diện người dùng.
- Ghép cặp có chủ đích nhưng luân phiên vai trò để mọi học sinh đều trực tiếp lập trình và kết nối.

## 6. An toàn và quản lý rủi ro

- Ngắt nguồn trước khi thay dây; kiểm tra đúng chân tín hiệu, VCC và GND.
- Không cấp nguồn motor/bơm trực tiếp từ chân I/O; sử dụng driver/module phù hợp.
- Không để bo mạch, pin và đầu nối tiếp xúc nước hoặc đất ướt.
- Không chập 3V với GND; không dùng nguồn sai điện áp.
- Dây và chi tiết chuyển động phải gọn, tránh vướng tay hoặc kẹt servo.
- Giáo viên chạy thử mã và phần cứng trước giờ học; chuẩn bị một bộ dự phòng.
- Chỉ bật radio trong nhóm/kênh đã quy định; không truyền thông tin cá nhân.

## 7. Checklist trước giờ học

- [ ] Xác định mục tiêu và tiêu chí thành công.
- [ ] Nạp và chạy thử chương trình mẫu.
- [ ] Kiểm tra pin, cáp USB, firmware và module.
- [ ] Dán nhãn bộ kit, chia khay linh kiện theo nhóm.
- [ ] Chuẩn bị mã QR/link MakeCode và phương án mô phỏng ngoại tuyến.
- [ ] In phiếu dữ liệu hoặc tạo bản điện tử.
- [ ] Chuẩn bị câu hỏi mở rộng và phương án hỗ trợ.

## 8. Quy ước hồ sơ học tập

Mỗi nhóm dùng tên `Lop_Nhom_BaiXX` và lưu bốn mục: `code`, `wiring`, `evidence`, `reflection`. Tệp mã cần ghi phiên bản, người sửa và mô tả thay đổi. Ảnh minh chứng phải thấy được cả kết nối và trạng thái đầu ra.
