# Hướng Dẫn Mua Sắm Thiết Bị Phòng Lab / Hardware Shopping & Lab Setup Guide

Để phục vụ tốt nhất cho các nội dung thực hành mạng cấp thấp và kiểm thử mạng không dây (Wi-Fi Pentesting), dưới đây là chi tiết các thiết bị và linh kiện bạn cần chuẩn bị.

---

## 🛒 Danh Sách Linh Kiện & Dụng Cụ / Hardware Shopping List

### 1. USB Wi-Fi Monitor Card (Bắt buộc cho Tuần 7)
Card Wi-Fi tích hợp trong laptop (nhất là dòng MacBook hoặc các dòng laptop Windows đời mới) thường không hỗ trợ chế độ Giám sát (Monitor Mode) và Tiêm gói tin (Packet Injection). Bạn cần mua một USB Wi-Fi gắn ngoài chạy chipset tương thích tốt với Kali Linux.

- **Option A (Giá rẻ)**: **RT3070 USB Wi-Fi Card**
  - **Thông số**: Hỗ trợ băng tần 2.4GHz, tương thích Kali cắm-là-chạy không cần cài driver thủ công.
  - **Giá ước tính**: 180,000 - 250,000 VNĐ.
  - **Nơi mua**: Shopee / Lazada (Tìm kiếm từ khóa "USB Wifi RT3070 Kali Linux").

- **Option B (Cao cấp hơn)**: **Alfa AWUS036ACS**
  - **Thông số**: Hỗ trợ 2 băng tần (2.4GHz & 5GHz), anten bắt sóng cực mạnh, cần cài driver bổ sung trên Kali.
  - **Giá ước tính**: 750,000 - 900,000 VNĐ.
  - **Nơi mua**: Các cửa hàng thiết bị mạng chuyên dụng hoặc order AliExpress.

### 2. Thiết bị giả lập máy Victim (Khuyên dùng)
Học viên cần một hệ điều hành mục tiêu để quét lỗ hổng và tấn công thử nghiệm.

- **Giải pháp phần cứng**: **Raspberry Pi 4 Model B (RAM 4GB)**
  - **Mô tả**: Máy tính nhúng mini. Bạn có thể cài đặt hệ điều hành dễ bị tổn thương (như Metasploitable hoặc Ubuntu Server cấu hình lỗi) lên thẻ nhớ MicroSD để làm mục tiêu tĩnh trong mạng.
  - **Giá ước tính**: 1,500,000 VNĐ.
  - **Nơi mua**: Các đại lý Raspberry Pi Việt Nam hoặc Shopee.
  
- **Giải pháp phần mềm (Thay thế miễn phí)**: **Máy ảo (Virtual Machines)**
  - Nếu không muốn mua Raspberry Pi, bạn hoàn toàn có thể cài đặt máy ảo chạy hệ điều hành Metasploitable 2 hoặc VulnHub VMs ngay trong VirtualBox/VMware của máy tính cá nhân.

---

## 🔌 Hướng Dẫn Thiết Lập Kết Nối / Network Setup Guide

Khi sử dụng USB Wi-Fi với Kali Linux chạy trên máy ảo:
1. Cắm USB Wi-Fi vào cổng USB của máy tính Host.
2. Trên menu máy ảo (VMware: `VM -> Removable Devices` / VirtualBox: `Devices -> USB`), chọn USB Wi-Fi để chuyển quyền điều khiển từ máy Host sang máy ảo Kali.
3. Mở terminal trên Kali Linux và gõ lệnh để xác nhận card mạng đã nhận diện:
   ```bash
   iwconfig
   ```
   Nếu màn hình hiển thị interface `wlan0`, thiết bị đã sẵn sàng để chuyển sang Monitor Mode.
4. Chuyển sang Monitor Mode:
   ```bash
   sudo airmon-ng start wlan0
   ```
