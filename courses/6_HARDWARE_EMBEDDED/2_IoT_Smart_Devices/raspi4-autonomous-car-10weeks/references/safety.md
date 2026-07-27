# Quy Định An Toàn Nguồn Điện & Mạch Xe Tự Hành Raspberry Pi 4 / Electrical Safety Rules

Khi làm việc với Raspberry Pi 4, pin LiPo / Li-ion dòng xả lớn và động cơ xe tự hành, học viên phải tuân thủ nghiêm ngặt các quy tắc an toàn sau:

---

## 🛑 5 Quy Tắc An Toàn Nguồn Điện & Mạch Xe Tự Hành

1. **CÁCH LY NGUỒN VI ĐIỀU KHIỂN VÀ ĐỘNG CƠ (POWER ISOLATION)**:
   - Tuyệt đối không cấp nguồn động cơ DC ($7.4\text{V} - 11.1\text{V}$) trực tiếp vào chân `5V` hoặc `3V3` của Raspberry Pi 4.
   - Nguồn Pin 11.1V qua mạch **UBEC 5V/3A** để hạ áp xuống $5.0\text{V}$ cấp riêng cho Pi 4 qua cổng USB-C hoặc chân `GPIO 2 (5V)` + `GPIO 6 (GND)`.

2. **AN TOÀN PIN LI-ION / LIPO DÒNG XẢ LỚN**:
   - Pin 18650 3S (11.1V) có thể phát sinh dòng xả tức thời $> 10\text{A}$. Ngắn mạch (chập cực $+$ và $-$) sẽ làm cháy dây dẫn hoặc gây cháy nổ pin.
   - Luôn sử dụng đế pin có cầu chì bảo vệ và mạch sạc cân bằng BMS. Rút phích cắm pin ngay khi không sử dụng.

3. **CẢNH BÁO SỤT NGUỒN (UNDER-VOLTAGE WARNING)**:
   - Nếu biểu tượng tia sét màu vàng xuất hiện trên màn hình Raspberry Pi 4, lập tức tắt máy và sạc Pin. Sụt nguồn liên tục có thể làm hỏng thẻ nhớ MicroSD.

4. **NỐI CHUNG ĐẮT (COMMON GROUND)**:
   - Chân `GND` của Raspberry Pi 4 BẮT BUỘC phải nối chung với chân `GND` của mạch cầu H L298N/TB6612 và mạch PCA9685 PWM để đảm bảo mức điện áp tham chiếu đồng bộ.

5. **AN TOÀN BẢO VỆ CAMERA CSI**:
   - Rút cáp nguồn Pi 4 trước khi cắm hoặc tháo cáp ribbon Camera CSI. Cắm cáp nghiêng hoặc sai chiều có thể làm cháy chip cảm biến ảnh Sony IMX219.
