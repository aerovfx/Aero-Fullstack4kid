# Hướng Dẫn Linh Kiện Phần Cứng & Thiết Bị Lab IoT / IoT & Robotics Hardware Guide

---

## 📦 Danh Mục Thiết Bị Phần Cứng / Hardware Shopping Guide

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specifications | Giá Ước Tính (VNĐ) | Nơi Mua Đề Xuất / Source |
|--------------------------|------------------------------------|---------------------|--------------------------|
| **ESP32 DevKit V1 30-Pin** | Wi-Fi 802.11 b/g/n, Bluetooth BLE 4.2, Dual Core 240MHz, 520KB SRAM, 4MB Flash. | 115,000 VNĐ | Makerlab / Shopee |
| **Mạch điều khiển L298N** | Dual H-Bridge, Điện áp động cơ 5V-35V, Dòng tối đa 2A/cầu. | 35,000 VNĐ | Nshop / Shopee |
| **Khung xe Robot 2 Bánh** | Mica trong suốt + 2 Động cơ DC Vàng + 2 Bánh xe cao su + Bánh xe hướng. | 95,000 VNĐ | Makerlab / Nshop |
| **Servo Motor SG90 9g** | Điện áp 4.8V-6V, Mô-men xoắn 1.8 kg/cm, Góc quay 0-180 độ. | 25,000 VNĐ | Shopee / Lazada |
| **Màn hình OLED 0.96 inch** | Chuẩn giao tiếp I2C, 128x64 Pixels, Màu Trắng/Xanh Dương. | 45,000 VNĐ | Makerlab / Nshop |
| **Cảm biến DHT22** | Đo Nhiệt độ (-40°C đến 80°C) & Độ ẩm (0-100% RH) chuẩn xác. | 65,000 VNĐ | Nshop / Shopee |
| **Cảm biến HC-SR04** | Đo khoảng cách bằng sóng siêu âm 2cm - 400cm, góc 15 độ. | 22,000 VNĐ | Shopee / Lazada |
| **Cảm biến MPU6050** | 3-Axis Gyroscope + 3-Axis Accelerometer, Giao tiếp I2C. | 38,000 VNĐ | Makerlab / Nshop |
| **Pin Li-ion 18650 & Đế pin** | 2 Pin 3.7V 2200mAh + Đế pin ra dây nguồn cho xe Robot. | 85,000 VNĐ | Nshop / Shopee |

---

## 💡 Gợi Ý Lựa Chọn Linh Kiện An Toàn:
- **Nguồn cấp cho ESP32**: Dùng cổng MicroUSB/USB-C 5V từ máy tính hoặc sạc dự phòng.
- **Nguồn cấp cho Động cơ DC**: Dùng đế 2 Pin 18650 (7.4V) cấp trực tiếp vào cổng `VMS` của L298N để tránh làm sụp nguồn vi điều khiển ESP32.
