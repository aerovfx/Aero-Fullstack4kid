# Hướng dẫn giáo viên

## Đối tượng và tổ chức

- Phù hợp lớp 8–12; có thể dùng cho sinh viên nhập môn embedded.
- Nhóm 3–4 học sinh: lập trình, phần cứng, kiểm thử/dữ liệu và quản lý dự án.
- Luân phiên vai trò sau mỗi hai buổi.
- Một bộ kit và một máy tính cho mỗi nhóm; chuẩn bị 10–15% linh kiện dự phòng.

## Cấu trúc buổi 105 phút

| Pha | Phút | Kết quả |
|---|---:|---|
| Gắn kết và an toàn | 10 | Vấn đề thực tế, dự đoán input–output |
| Kiến thức ngắn | 15 | Khái niệm, sơ đồ và lệnh cốt lõi |
| Thực hành có hướng dẫn | 25 | Mạch/chương trình tối thiểu hoạt động |
| Thử thách chế tạo | 35 | Sản phẩm của nhóm |
| Kiểm thử và cải tiến | 15 | Bảng dữ liệu, sửa một vấn đề |
| Demo và exit ticket | 5 | Minh chứng và phản tư |

## Quy trình bắt buộc trước khi cấp nguồn

1. Đối chiếu tên module và điện áp hoạt động.
2. Xác định VCC, GND và chân tín hiệu; không suy đoán theo màu dây.
3. Kiểm tra GPIO có chịu được tín hiệu đầu vào hay không.
4. Giáo viên kiểm tra nguồn cho motor/servo và chiều diode/driver nếu có.
5. Cấp nguồn khi mạch đứng yên trên bề mặt cách điện.
6. Nếu linh kiện nóng, có mùi hoặc hoạt động bất thường: ngắt nguồn ngay.

## Lưu ý kỹ thuật quan trọng

- Pico dùng logic **3,3 V**; GPIO không chịu 5 V.
- HC-SR04 thường phát Echo mức 5 V nếu cấp 5 V; cần mạch chia áp/level shifter hoặc module tương thích 3,3 V.
- Không chạy DC motor trực tiếp từ GPIO; dùng motor driver và nguồn phù hợp.
- Servo có thể gây sụt áp/reset Pico; ưu tiên nguồn servo riêng, nối chung GND theo sơ đồ.
- RC522 thường dùng 3,3 V và SPI; kiểm tra đúng phiên bản module.
- DHT11 có tốc độ lấy mẫu thấp; không đọc liên tục trong vòng lặp nhanh.
- Khi xe đặt trên bàn để thử motor, kê bánh khỏi mặt bàn trước.

## Đánh giá

| Thành phần | Tỷ trọng |
|---|---:|
| Quiz/exit ticket | 15% |
| Thực hành và bảng kiểm thử | 35% |
| Nhật ký kỹ thuật | 15% |
| Dự án cuối khóa | 35% |

Không chấm sản phẩm chỉ bằng “chạy được”. Học sinh phải giải thích sơ đồ, thuật toán, dữ liệu kiểm thử, giới hạn và quyết định cải tiến.

## Phân hóa

- **Hỗ trợ:** mã khung, sơ đồ chân đã kiểm duyệt, checklist từng bước.
- **Đạt chuẩn:** tự hoàn thiện thuật toán và xử lý ít nhất một trường hợp lỗi.
- **Mở rộng:** lọc dữ liệu, state machine, OOP, lưu dữ liệu, Pico W/MQTT hoặc web dashboard.

## Hồ sơ mỗi nhóm

Tên thư mục `Lop_Nhom_Pico`: mã nguồn theo phiên bản, sơ đồ chân, ảnh mạch, bảng dữ liệu, nhật ký lỗi, phản tư và slide dự án. Không đưa mật khẩu Wi-Fi hoặc khóa dịch vụ đám mây vào mã nộp chung.
