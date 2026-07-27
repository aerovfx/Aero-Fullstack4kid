# Danh mục thiết bị và quy ước chân

## Thành phần chính

| Nhóm | Module | Bài sử dụng |
|---|---|---|
| Vi điều khiển | Raspberry Pi Pico/Pico W | 1–18 |
| Hiển thị | LCD1602 I2C, LED 7 đoạn, OLED tùy phiên bản | 4, 6, 15–17 |
| Cảm biến | HC-SR04, DHT11, mưa, âm thanh, ánh sáng, lửa, nghiêng, reed, IR obstacle, line tracking | 3, 5–7, 12–17 |
| Điều khiển | SG90, DC motor, motor driver | 8, 10–14, 17 |
| Giao tiếp | IR remote, keypad 4×4, joystick, RC522 | 8–9, 11, 14, 16 |
| Đầu ra | buzzer, RGB LED, traffic light, LED module | 1–3, 7, 15–16 |
| Cơ khí | smart car chassis, bánh và động cơ | 10–14, 17 |

## Bảng chân cấu hình của nhóm

Do kit/bo mở rộng có thể thay đổi giữa các phiên bản, học sinh phải điền bảng này từ nhãn thực tế trước khi lắp.

| Tín hiệu | GPIO dự kiến | Điện áp module | Kiểm tra bởi | Ghi chú |
|---|---:|---:|---|---|
| LED/Button | | | | |
| I2C SDA/SCL | | | | |
| HC-SR04 Trig/Echo | | | | Chú ý Echo |
| DHT11 Data | | | | |
| Servo PWM | | | | Nguồn servo |
| Motor IN/EN | | | | Qua driver |
| SPI RC522 | | | | 3,3 V |

## Mẫu tệp cấu hình chân

```python
# pins.py — thay số GPIO theo bo mạch thực tế
PIN_LED = 15
PIN_BUTTON = 14
PIN_BUZZER = 13
PIN_SERVO = 12
I2C_ID = 0
PIN_SDA = 8
PIN_SCL = 9
```

Các số trên chỉ là ví dụ minh họa, không phải sơ đồ chân mặc định của mọi ELECROW kit.

## Phần mềm

- Thonny với MicroPython firmware cho Pico/Pico W.
- Trình điều khiển USB nếu hệ điều hành yêu cầu.
- Thư viện module đúng phiên bản được giáo viên kiểm duyệt.
- Công cụ serial plotter hoặc bảng tính cho bài dữ liệu.
