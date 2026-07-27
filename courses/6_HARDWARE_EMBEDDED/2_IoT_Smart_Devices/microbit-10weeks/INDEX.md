# Khoá Học: BBC micro:bit & Lập Trình STEM Toàn Diện (10 Tuần) / Course: BBC micro:bit Applied STEM & Robotics (10 Weeks)

Chào mừng bạn đến với khoá học **BBC micro:bit & Lập Trình STEM Toàn Diện (10 Tuần)**. Chương trình đào tạo chuẩn STEM tích hợp toán học, vật lý và khoa học máy tính, được thiết kế bám sát bộ linh kiện **BBC micro:bit v2** và **Elecrow Crowtail STEAM Edu Kit**, giúp học viên từ lớp 6–12 làm quen với tư duy thuật toán, lập trình kéo thả MakeCode Blocks và lập trình mã nguồn MicroPython thực chiến.

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 1: NỀN TẢNG MICRO:BIT, CẢM BIẾN & ÂM THANH (W1-W4)│
                                    │  PART 1: MICRO:BIT BASICS, SENSORS & ACTUATORS         │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Kiến trúc BBC micro:bit v2, Ma trận LED & Nút nhấn
                                         Tuần 2: Cảm biến gia tốc 3 trục, La bàn & Thí nghiệm Vật lý
                                         Tuần 3: Cảm biến môi trường (Nhiệt độ, Ánh sáng, Siêu âm)
                                         Tuần 4: Thiết bị chấp hành (Loa kẹo, Servo SG90, LED RGB)
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 2: RADIO KHÔNG DÂY, DATA LOGGING & ROBOT (W5-W8) │
                                    │  PART 2: WIRELESS RADIO, DATA LOGGING & ROBOTICS       │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 5: Truyền thông không dây Radio P2P & RSSI
                                         Tuần 6: Ghi nhật ký dữ liệu (Data Logging) & Serial Plotter
                                         Tuần 7: Hệ thống Nông nghiệp thông minh & Smart Home
                                         Tuần 8: Xe Robot micro:bit tự hành (Né vật cản & Dò đường)
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 3: MICROPYTHON & DỰ ÁN CAPSTONE (W9-W10)         │
                                    │  PART 3: ADVANCED MICROPYTHON & CAPSTONE DEMO DAY      │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 9: Lập trình MicroPython nâng cao & Máy trạng thái (FSM)
                                         Tuần 10: Tích hợp Hệ sinh thái micro:bit & Bảo vệ Capstone
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │             BẢO VỆ DỰ ÁN CUỐI KHOÁ / DEMO DAY          │
                                    └──────────────────────────┬─────────────────────────────┘
```

---

## 🗂️ Danh Mục Tài Liệu / Document Index

| Tài liệu / Document | Mô tả / Description |
|---------------------|---------------------|
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/microbit-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết và checklist sản phẩm đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/microbit-10weeks/references/components.md) | Danh sách thiết bị BBC micro:bit v2 & Crowtail STEAM Kit với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/microbit-10weeks/references/software.md) | Setup MakeCode Web Editor, MicroPython Mu Editor & WebUSB Driver |
| [An Toàn & Bảo Vệ Linh Kiện / Safety Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/microbit-10weeks/references/safety.md) | Quy tắc an toàn điện áp, bảo vệ chân Edge Connector và chống tĩnh điện |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/microbit-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric 100 điểm |
| [Google Colab & MakeCode Simulator](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/microbit-10weeks/notebooks/microbit_colab.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/) Notebook thực hành giả lập MicroPython trực tiếp trên trình duyệt |

---

## 📦 Danh Mục Thiết Bị & Linh Kiện Phần Cứng (BOM) / Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| Board BBC micro:bit v2   | ARM Cortex-M4F 64MHz, 5x5 LED Matrix, Speaker, Mic, Touch, Radio/BLE | 1 | 550,000 VNĐ | Makerlab / Shopee |
| Mạch mở rộng Crowtail Shield | Shield cắm micro:bit ra 12 cổng Crowtail cắm jack tiện lợi | 1 | 120,000 VNĐ | Elecrow / Makerlab |
| Cảm biến độ ẩm đất Crowtail | Cảm biến đo độ ẩm đất dung kháng (Capacitive Moisture Sensor) | 1 | 45,000 VNĐ | Elecrow / Shopee |
| Cảm biến siêu âm Crowtail | Đo khoảng cách bằng sóng siêu âm (3cm - 350cm) | 1 | 55,000 VNĐ | Elecrow / Shopee |
| Động cơ Servo SG90 Crowtail | Servo 9g góc quay 180 độ chân cắm Crowtail | 1 | 35,000 VNĐ | Elecrow / Makerlab |
| Động cơ bơm nước 5V Mini | Bơm chìm 5V mini kèm ống nước dẻo 1m | 1 | 35,000 VNĐ | Nshop / Shopee |
| Mạch cầu H động cơ micro:bit | Shield điều khiển 2 động cơ DC cho xe Robot micro:bit | 1 | 95,000 VNĐ | Makerlab / Shopee |
| Khung xe Robot micro:bit | Khung xe 2 bánh + 2 Động cơ DC + Bánh dẫn hướng | 1 bộ | 110,000 VNĐ | Makerlab / Shopee |

**Tổng chi phí phần cứng ước tính:** ~ 1,045,000 VNĐ / Bộ thực hành toàn diện.

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Nền tảng lập trình chính**:
  - **Microsoft MakeCode for micro:bit**: https://makecode.microbit.org/ (Lập trình khối kéo thả & chuyển đổi JavaScript/Python).
  - **MicroPython Online / Mu Editor**: https://python.microbit.org/ (Lập trình Python văn bản chuyên nghiệp).
- **Ngôn ngữ**: MakeCode Blocks, JavaScript & Python 3 (MicroPython).

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết STEM & Tư duy Thuật toán**: 30%
- **Thực hành Chế tạo & Lập trình micro:bit**: 40%
- **Dự án Robot & Nông nghiệp thông minh**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Bài tập tuần & Nhật ký kỹ thuật**: 40%
- **Mã nguồn MakeCode / MicroPython & Wokwi Lab**: 20%
- **Dự án cuối khoá (Capstone Project)**: 40% (Mô hình kỹ thuật hoàn chỉnh, Code Python, Báo cáo và Demo Day).
