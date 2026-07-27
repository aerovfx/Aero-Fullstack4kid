# Quy Định An Toàn & Bảo Vệ Thiết Bị micro:bit / Hardware Safety Guide

Khi thực hành với BBC micro:bit v2 và các module cảm biến, học viên phải tuân thủ nghiêm ngặt các quy tắc an toàn sau:

---

## 🛑 5 Quy Tắc An Toàn Thiết Bị micro:bit Tuyệt Đối

1. **CHỐNG TĨNH ĐIỆN VÀ VA ĐẬP (ESD & IMPACT SAFETY)**:
   - Vi điều khiển BBC micro:bit không có vỏ nhựa bảo vệ. Luôn cầm board ở cạnh viền nhựa, tránh sờ trực tiếp vào các chân linh kiện bán dẫn hoặc chip ARM để tránh hỏng do tĩnh điện (ESD).

2. **ĐIỆN ÁP HOẠT ĐỘNG 3.3V (3.3V LOGIC LEVEL)**:
   - Các chân Edge Connector của micro:bit chỉ chịu điện áp tối đa **3.3V**. Tuyệt đối không cắm nguồn 5V hoặc nguồn pin lớn trực tiếp vào các chân GPIO `P0`, `P1`, `P2`.

3. **GIỚI HẠN DÒNG ĐIỆN GPIO (CURRENT LIMITATION)**:
   - Mỗi chân GPIO chỉ cấp được dòng tối đa khoảng **5mA - 15mA**. Tuyệt đối không nối trực tiếp Động cơ DC hoặc Loa công suất lớn vào chân GPIO mà không qua mạch đệm Transistor / Relay / Cầu H.

4. **AN TOÀN KHI DÙNG NGUỒN PIN DỰ PHÒNG**:
   - Khi dùng hộp pin AAA ($2 \times 1.5\text{V} = 3\text{V}$), cắm đúng vào giắc cắm Pin màu trắng JST trên board. Không cắm pin vuông 9V vào giắc JST.

5. **AN TOÀN KHI THỰC HÀNH VỚI NƯỚC (WATER SAFETY)**:
   - Khi làm bài lab Trạm tưới cây tự động, giữ board micro:bit và hộp pin khô ráo tuyệt đối. Chỉ cắm đầu cảm biến độ ẩm đất xuống đất ướt.
