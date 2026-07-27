# TÀI LIỆU HỌC TẬP & NHIỆM VỤ (HỌC SINH)
> **Dự án:** Thiết kế chế tạo Budget Mini UAV  
> **Nguyên tắc học tập:** "Học thông qua làm" - Mỗi bước đi đều có sản phẩm thực tế.

---

## 🎯 5 Không Gian Thiết Kế Dự Án (Blueprint Experience)

Học sinh sẽ làm việc qua 5 tab không gian trên công cụ DIY STEM Workspace:

```text
 ┌───────────────┐   ┌───────────────┐   ┌───────────────┐   ┌───────────────┐   ┌───────────────┐
 │ 1. INFO       │ → │ 2. PARTS      │ → │ 3. WIRING     │ → │ 4. MECH       │ → │ 5. GUIDE      │
 ├───────────────┤   ├───────────────┤   ├───────────────┤   ├───────────────┤   ├───────────────┤
 │ Đọc Spec dự án│   │ Chọn linh kiện│   │ Nối dây điện  │   │ Thiết kế 3D   │   │ Hướng dẫn     │
 │ & Yêu cầu     │   │ & Tính BOM    │   │ & Tín hiệu    │   │ & Lắp ráp     │   │ Lắp ráp       │
 └───────────────┘   └───────────────┘   └───────────────┘   └───────────────┘   └───────────────┘
```

---

## 📖 Chi tiết các nhiệm vụ học tập

### 📝 Nhiệm vụ 1 (Tuần 1-2): Xác định thông số & Lập danh sách linh kiện (BOM)
*   **Đề bài:** Hãy thiết kế một UAV siêu nhẹ có giá thành dưới 120 USD.
*   **Yêu cầu sản phẩm:**
    *   Tạo file `CONFIG` xác định kích thước sải cánh, khối lượng cất cánh tối đa (MTOW).
    *   Tạo bảng Excel hoặc file JSON danh sách linh kiện (`PARTS`) gồm ít nhất: Frame, Motor, ESC, FC, Battery, Propeller.

### 📝 Nhiệm vụ 2 (Tuần 3): Lập sơ đồ nối dây điện (Wiring Diagram)
*   **Đề bài:** Vẽ sơ đồ mạch điện kết nối pin, nguồn điều khiển tốc độ (ESC), Flight Controller và mạch thu sóng RC.
*   **Yêu cầu kỹ thuật:**
    *   Xác định rõ các cực âm (-) và dương (+), tránh chập điện.
    *   Phân biệt các loại tín hiệu điều khiển (PWM, SBUS, I2C) để cắm đúng chân trên Flight Controller.

### 📝 Nhiệm vụ 3 (Tuần 4-6): Dựng hình 3D cho UAV (CAD & Mech)
*   **Đề bài:** Thiết kế các tấm đế (plates) cho khung và lắp ráp động cơ, cánh quạt bằng phần mềm CAD.
*   **Yêu cầu kỹ thuật:**
    *   Kích thước lỗ lắp động cơ phải khớp với loại động cơ đã chọn.
    *   Đặt tấm pin LiPo sao cho trọng tâm (CG) nằm đúng giữa UAV.

### 📝 Nhiệm vụ 4 (Tuần 7-9): Kiểm định thiết kế & Biên soạn cẩm nang lắp ráp
*   **Đề bài:** Thực thi kiểm tra va chạm cơ khí và viết tài liệu lắp ráp hoàn chỉnh.
*   **Yêu cầu sản phẩm:**
    *   Chạy code kiểm tra xem sải cánh quạt có chạm vào linh kiện nào khác không.
    *   Biên soạn file `GUIDE.md` hướng dẫn từng bước từ lắp ráp khung cơ khí đến đấu nối dây điện.

---

## 📝 Phiếu Học Tập Tuần 5: Kiểm Tra Trọng Tâm (Center of Gravity)

*   **Họ và tên nhóm:** ............................................................
*   **Câu hỏi 1:** Tại sao trọng tâm (CG) của UAV cần nằm ở tâm hình học của 4 động cơ?
    *   *Trả lời:* ........................................................................................................
*   **Câu hỏi 2:** Nếu bạn đặt pin LiPo lệch về phía đuôi UAV, điều gì sẽ xảy ra với lực nâng của các động cơ phía trước và phía sau khi UAV cất cánh thẳng đứng?
    *   *Trả lời:* ........................................................................................................
*   **Nhiệm vụ thực hành:** Hãy điều chỉnh tọa độ Z và Y của khối `Battery` trên phần mềm CAD để đưa trọng tâm về vị trí lý tưởng (0, 0, 0). Ghi lại tọa độ mới của bạn:
    *   *Tọa độ Battery:* X = .........., Y = .........., Z = ..........
