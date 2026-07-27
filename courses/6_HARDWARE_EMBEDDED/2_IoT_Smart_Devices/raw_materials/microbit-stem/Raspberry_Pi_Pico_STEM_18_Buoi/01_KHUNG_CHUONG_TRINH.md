# Khung chương trình 18 buổi

## Ma trận giảng dạy

| Buổi | Chủ đề | Sản phẩm | Kiến thức/giao thức | Minh chứng đạt chuẩn |
|---:|---|---|---|---|
| 1 | Pico, GPIO, LED, button | Đèn SOS điều khiển nút | MicroPython, Pin IN/OUT, pull-up | LED SOS đúng nhịp; nút đổi trạng thái ổn định |
| 2 | PWM, RGB, buzzer | Đèn giao thông + piano mini | PWM, duty, frequency | Trộn ≥4 màu; phát ≥4 nốt |
| 3 | ADC, ánh sáng, âm thanh | Đèn tự động/vỗ tay bật đèn | ADC 16-bit, ngưỡng, lọc nhiễu | Ngưỡng có dữ liệu hiệu chuẩn; giảm kích hoạt sai |
| 4 | LCD1602 I2C | Màn hình menu/thông số | I2C, địa chỉ, driver, UI | Quét/đúng địa chỉ; hiển thị hai dòng và menu |
| 5 | HC-SR04 | Máy đo khoảng cách | pulse, time-of-flight, chia áp Echo | Đo 3 mốc; tính sai số và xử lý timeout |
| 6 | DHT11 | Trạm thời tiết mini | one-wire timing qua driver, sampling | Hiển thị nhiệt–ẩm; không đọc quá nhanh |
| 7 | Rain + flame | Cảnh báo môi trường | digital/analog, sensor fusion, alarm state | Test khô/ướt × an toàn/cảnh báo |
| 8 | Joystick + servo | Đế camera pan | ADC x/y, dead zone, PWM servo, mapping | Điều khiển góc mượt, không rung vùng giữa |
| 9 | RC522 + IR | Khóa cửa thông minh | SPI, UID, IR code, access control | Thẻ hợp lệ/không hợp lệ; có trạng thái khóa |
| 10 | Motor + driver | Xe tiến/lùi/dừng | H-bridge, PWM speed, motor safety | Hai motor đúng chiều, dừng an toàn |
| 11 | Joystick điều khiển xe | Xe có dây/không dây tùy kit | mapping, state, dead zone | 5 lệnh ổn định: tiến/lùi/trái/phải/dừng |
| 12 | Robot tránh vật cản | Xe tự tránh | feedback, ultrasonic, state machine | Hoàn thành đường thử 3 lần |
| 13 | Robot dò line | Xe bám vạch | IR reflectance, calibration, control | Bám đường chuẩn ≥2 vòng/lượt |
| 14 | Remote điều khiển xe | Xe IR remote | command mapping, failsafe | Nhận lệnh ổn định; tự dừng khi mất lệnh |
| 15 | Nhà thông minh | Mô hình phòng | sensor integration, UI, automation | ≥2 input, ≥2 output, manual/auto mode |
| 16 | Bãi xe RFID | Barrier và bộ đếm | RFID, servo, display, capacity state | Đúng thẻ, đúng sức chứa, không âm/vượt max |
| 17 | Xe tự hành tích hợp | Robot nhiệm vụ | ultrasonic, line, servo, LCD, mode | Hoàn thành nhiệm vụ với dữ liệu kiểm thử |
| 18 | Đồ án cuối khóa | Sản phẩm theo nhóm | design thinking, test, iteration | Hồ sơ, ≥5 test case, demo và bảo vệ |

## Chuẩn kiến thức theo giai đoạn

- **Buổi 1–4:** hiểu điện áp logic, GPIO, PWM, ADC, I2C và cấu trúc chương trình MicroPython.
- **Buổi 5–9:** đọc cảm biến, hiệu chuẩn, lọc, giao tiếp SPI và xây logic hệ thống.
- **Buổi 10–14:** dùng driver motor, state machine, phản hồi cảm biến và an toàn robot.
- **Buổi 15–18:** phân tích yêu cầu, tích hợp hệ thống, kiểm thử, quản lý dự án và truyền thông khoa học.

## Sản phẩm đánh giá theo mốc

| Sau buổi | Bài đánh giá |
|---:|---|
| 4 | Thiết bị đo/điều khiển có LCD và ít nhất một input |
| 9 | Hệ thống truy cập/cảnh báo đa module |
| 14 | Robot vượt bài thử có state machine và failsafe |
| 18 | Đồ án cuối khóa theo rubric 100 điểm |
