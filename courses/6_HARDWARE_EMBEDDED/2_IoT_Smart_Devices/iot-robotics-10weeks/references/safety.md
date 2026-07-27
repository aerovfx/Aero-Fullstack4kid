# Quy Định An Toàn Điện & Chống Ngắn Mạch / Hardware Safety & Electrical Rules

Khi thực hành làm việc với phần cứng, vi điều khiển ESP32 và động cơ điện, học viên phải tuân thủ nghiêm ngặt các quy tắc an toàn sau:

---

## 🛑 5 Quy Tắc An Toàn Phần Cứng Tuyệt Đối

1. **RÚT NGUỒN ĐIỆN TRƯỚC KHI THAY ĐỔI MẠCH (NEVER WIRE WHILE POWERED)**:
   - Luôn rút cáp USB và tháo Pin trước khi cắm dây mới trên Breadboard hoặc đấu nối mạch cầu H.

2. **CHỐNG ĐẢO NGHỊCH CỰC (NEVER REVERSE POLARITY)**:
   - Tuyệt đối không cắm ngược cực VCC ($+$) và GND ($-$). Ngược cực sẽ làm cháy chip ESP32 ngay lập tức!
   - Chân `VIN` của ESP32 chịu tối đa 5V-9V. Chân `3V3` chỉ chịu 3.3V. Cắm 5V vào chân `3V3` sẽ làm hỏng chip.

3. **CÁCH LY NGUỒN ĐỘNG CƠ VÀ NGUỒN VI ĐIỀU KHIỂN (SEPARATE MOTOR POWER)**:
   - Các động cơ DC tạo ra dòng nhiễu ngược (Back EMF). Phải cắm tụ điện cách ly và không lấy nguồn động cơ từ chân `3V3` của ESP32.

4. **CHỐNG NGẮN MẠCH PIN LI-ION 18650 (BATTERY SAFETY)**:
   - Pin 18650 có dòng xả rất lớn. Nếu để 2 cực chập vào nhau có thể gây cháy nổ. Không dùng pin bị rách vỏ nhựa cách điện.

5. **NỐI CHUNG ĐẮT (COMMON GROUND)**:
   - Khi dùng 2 nguồn riêng (USB 5V cho ESP32 và Pin 7.4V cho Động cơ), BẮT BUỘC phải nối chân `GND` của ESP32 chung với chân `GND` của nguồn Pin.
