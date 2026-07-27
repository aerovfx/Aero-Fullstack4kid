# Chương trình Raspberry Pi Pico STEM — ELECROW Advanced Kit

Phiên bản 1.0 · 18 buổi · 90–120 phút/buổi · học sinh lớp 8–12 và người mới học embedded

## Mục tiêu

Chương trình giúp học sinh đi từ lập trình MicroPython và điện tử cơ bản đến cảm biến, giao tiếp, robot và dự án tích hợp. Mỗi buổi tạo ra một sản phẩm quan sát được và một bộ dữ liệu kiểm thử; bốn buổi cuối áp dụng quy trình học qua dự án.

## Cấu trúc tài liệu

| Tệp/thư mục | Nội dung |
|---|---|
| `00_HUONG_DAN_GIAO_VIEN.md` | Tổ chức lớp, an toàn, đánh giá và phân hóa |
| `01_KHUNG_CHUONG_TRINH.md` | Ma trận 18 buổi và chuẩn đầu ra |
| `02_DANH_MUC_THIET_BI_VA_PIN.md` | Thiết bị, nguồn điện và quy ước chân |
| `03_RUBRIC_DANH_GIA.md` | Rubric thực hành và dự án cuối khóa |
| `lessons/lesson01.md` → `lesson18.md` | 18 bài học trực tiếp cho học sinh |

## Lộ trình

1. **Nền tảng (Buổi 1–4):** GPIO, PWM, ADC, I2C và hiển thị.
2. **Cảm biến–điều khiển (Buổi 5–9):** khoảng cách, khí hậu, cảnh báo, servo, RFID và IR.
3. **Robotics (Buổi 10–14):** motor, joystick, tránh vật cản, dò line và điều khiển từ xa.
4. **Dự án (Buổi 15–18):** nhà thông minh, bãi xe RFID, xe tự hành và đồ án cuối khóa.

## Nguyên tắc triển khai

- MicroPython là ngôn ngữ chính; Pico W dùng cho nhánh mở rộng IoT.
- Mọi kết nối phải được đối chiếu với **nhãn trên bo mạch và tài liệu đúng phiên bản kit**.
- Không nối tín hiệu 5 V trực tiếp vào GPIO 3,3 V của Pico.
- Motor, servo và bơm dùng nguồn/driver phù hợp; luôn nối chung GND khi thiết kế yêu cầu.
- Mỗi nhóm lưu mã, sơ đồ, bảng kiểm thử và phản tư trong một hồ sơ dự án.

## Chuẩn đầu ra

Học sinh có thể lập trình MicroPython; sử dụng GPIO, PWM, ADC, I2C, SPI và giao tiếp nối tiếp ở mức cơ bản; đọc và hiệu chuẩn cảm biến; điều khiển servo/motor; xây dựng robot; thiết kế, kiểm thử và bảo vệ một sản phẩm STEM tích hợp.
