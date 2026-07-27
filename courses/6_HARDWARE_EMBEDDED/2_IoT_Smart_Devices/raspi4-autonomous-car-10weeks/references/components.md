# Hướng Dẫn Linh Kiện Phần Cứng Xe Tự Hành Raspberry Pi 4 / Hardware Guide

---

## 📦 Danh Mục Thiết Bị Phần Cứng / Hardware Shopping Guide

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specifications | Giá Ước Tính (VNĐ) | Nơi Mua Đề Xuất / Source |
|--------------------------|------------------------------------|---------------------|--------------------------|
| **Raspberry Pi 4 Model B (4GB RAM)** | Broadcom BCM2711, Quad-Core Cortex-A72 1.5GHz, 4GB LPDDR4, Dual micro-HDMI 4K, Dual-Band Wi-Fi. | 1,850,000 VNĐ | Raspberry Pi VN / Makerlab |
| **Camera CSI Raspberry Pi V2 8MP** | Cảm biến Sony IMX219, Độ phân giải 8 Megapixel, Cáp ribbon 15cm cắm trực tiếp cổng CSI. | 380,000 VNĐ | Nshop / Shopee |
| **Khung xe Robot Ackermann / 4 Bánh** | Khung hợp kim nhôm/Mica + 4 Động cơ DC + Cụm Servo bẻ lái bánh trước. | 450,000 VNĐ | Makerlab / Shopee |
| **Mạch điều khiển PWM PCA9685** | Giao tiếp I2C, 16 kênh PWM 12-bit độ phân giải cao điều khiển Servo & Tốc độ motor. | 65,000 VNĐ | Nshop / Shopee |
| **Mạch cầu H L298N / TB6612FNG** | Mạch điều khiển động cơ DC đôi (TB6612FNG tiết kiệm pin, 1.2A/cầu). | 45,000 VNĐ | Nshop / Shopee |
| **Mạch ổn áp UBEC DC-DC 5V/3A** | Chuyển đổi điện áp đầu vào 7V-26V xuống 5.0V/3A điện áp sạch cấp cho Raspberry Pi 4. | 65,000 VNĐ | Makerlab / Shopee |
| **Bộ Pin Li-ion 18650 3 Cell (11.1V)** | 3 Pin 18650 3.7V 2600mAh + Đế pin ra dây nguồn jack DC + Mạch sạc cân bằng BMS. | 135,000 VNĐ | Shopee / Lazada |
| **Thẻ nhớ SanDisk Ultra 32GB Class 10** | Tốc độ đọc 100MB/s nạp Raspberry Pi OS 64-bit hoặc Ubuntu 22.04 LTS. | 120,000 VNĐ | Shopee / MemoryZone |

---

## 💡 Hướng Dẫn Nguồn Điện An Toàn Cho Raspberry Pi 4:
- Bo mạch Raspberry Pi 4 tiêu thụ dòng điện rất lớn ($3\text{A}$ ở điện áp $5.0\text{V}$). Không cắm nguồn Pi 4 chung với nguồn Động cơ DC mà không qua mạch ổn áp **UBEC 5V/3A** cách ly để tránh sụt nguồn làm sập hệ thống (Under-voltage Warning).
