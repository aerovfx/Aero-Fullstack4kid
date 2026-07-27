# Quy Định An Toàn & Bảo Vệ Thiết Bị Raspberry Pi Pico / Hardware Safety Guide

Khi thực hành với Raspberry Pi Pico RP2040 và các cảm biến, học viên phải tuân thủ nghiêm ngặt các quy tắc an toàn sau:

---

## 🛑 5 Quy Tắc An Toàn Thiết Bị Pico RP2040 Tuyệt Đối

1. **ĐIỆN ÁP 3.3V LOGIC LEVEL (3.3V SAFETY)**:
   - Tất cả các chân GPIO của Pico RP2040 chỉ chịu được điện áp tối đa **3.3V**. Tuyệt đối không cắm nguồn 5V trực tiếp vào các chân GPIO (Chỉ cắm 5V vào chân `VBUS` Pin 40).

2. **GIỚI HẠN DÒNG ĐIỆN GPIO (CURRENT LIMITATION)**:
   - Dòng điện tối đa trên mỗi chân GPIO của RP2040 là **12mA** (mặc định 4mA). Tuyệt đối không nối trực tiếp Động cơ DC hoặc Rơ-le công suất lớn vào chân GPIO mà không qua Transistor / Cầu H.

3. **CÁCH LY NGUỒN ĐỘNG CƠ VÀ VI ĐIỀU KHIỂN**:
   - Khi chạy xe robot hoặc bơm nước 5V, cấp nguồn riêng từ Pin 7.4V vào cầu H L298N và nhớ NỐI CHUNG ĐẤT (`GND`) với chân `GND` của Pico.

4. **AN TOÀN NẠP FIRMWARE UF2**:
   - Khi nạp firmware MicroPython UF2, nhấn giữ nút `BOOTSEL` trước khi cắm cáp USB vào máy tính. Không rút cáp USB khi đang sao chép file `.uf2`.

5. **CHỐNG TĨNH ĐIỆN VÀ NGẮN MẠCH BREADBOARD**:
   - Rút nguồn MicroUSB trước khi cắm dây hoặc linh kiện mới trên Breadboard để tránh chập cực VCC và GND.
