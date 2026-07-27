# TIÊU CHÍ ĐÁNH GIÁ DỰ ÁN (RUBRIC)
> **Dự án:** Thiết kế chế tạo Budget Mini UAV  
> **Nguyên tắc đánh giá:** Đánh giá đa chiều dựa trên quy trình kỹ thuật, thiết kế CAD, tính an toàn điện và tính hợp tác của nhóm.

---

## 📊 Rubric Đánh Giá Đồ Án Cuối Khóa (Tổng điểm: 100)

| Tiêu chí | Mức Xuất Sắc (85 - 100 điểm) | Mức Đạt (65 - 84 điểm) | Mức Cần Cố Gắng (dưới 65 điểm) | Trọng số |
| :--- | :--- | :--- | :--- | :---: |
| **Quản lý Ngân sách & BOM (Parts)** | Danh sách linh kiện đầy đủ 30 thành phần, đơn giá chi tiết rõ ràng, tổng ngân sách không vượt quá 120 USD. | Danh sách đầy đủ linh kiện chính, tổng ngân sách hơi vượt nhẹ hoặc thiếu một số ốc vít phụ. | Danh sách sơ sài, thiếu linh kiện quan trọng, vượt quá ngân sách quy định. | **20%** |
| **Sơ đồ mạch điện (Wiring)** | Sơ đồ nối dây hoàn chỉnh, phân biệt cực rõ ràng, có kí hiệu chân tín hiệu (PWM, SBUS), có kiểm định an toàn điện. | Có sơ đồ nối dây nhưng thiếu chi tiết ký hiệu chân, hoặc các dây nguồn chính chưa được ghi chú kích thước dòng điện. | Sơ đồ sai sót nghiêm trọng, có nguy cơ gây chập cháy khi đấu nguồn thật. | **25%** |
| **Thiết kế Cơ khí 3D (CAD/Mech)** | Thiết kế 3D hoàn chỉnh (đầy đủ khung, motor, cánh, pin). Trọng tâm (CG) cân bằng tốt, sải cánh đạt chuẩn khoảng cách. | Có đầy đủ các khối linh kiện chính nhưng các mối ghép bị lệch nhẹ, hoặc khoảng cách an toàn cánh quạt sát mức tối thiểu. | Thiếu nhiều bộ phận, các chi tiết chồng chéo lên nhau (va chạm cơ khí), mô hình không cân đối. | **25%** |
| **Tài liệu Hướng dẫn (Guide)** | Biên soạn file hướng dẫn lắp ráp trực quan, chi tiết từng bước, dễ hiểu cho người mới bắt đầu. | Hướng dẫn đầy đủ các bước chính nhưng thiếu hình ảnh minh họa hoặc một số khuyến cáo an toàn. | Tài liệu sơ sài, viết tắt khó hiểu, thiếu các bước quan trọng. | **15%** |
| **Thuyết trình & Làm việc nhóm** | Trình bày mạch lạc, trả lời tốt câu hỏi phản biện, phân chia công việc nhóm đều và hiệu quả. | Trình bày đủ nội dung nhưng chưa tự tin khi phản biện, một vài thành viên gánh vác phần lớn công việc. | Thuyết trình lan man, không hiểu rõ sản phẩm của nhóm mình, thiếu tính liên kết nhóm. | **15%** |

---

## ⚠️ Tiêu chí loại trừ (Điều kiện loại trực tiếp)
Dự án sẽ nhận điểm **0** ở phần An toàn điện nếu vi phạm bất kỳ lỗi nào sau đây trong quá trình đấu nối dây thật:
1.  Nối ngược cực âm (-) và cực dương (+) từ Pin vào bộ nguồn điều khiển (ESC/FC) gây chập mạch.
2.  Để lộ lõi dây đồng của các đầu nối nguồn lớn mà không bọc cách điện (bằng co nhiệt hoặc băng dính điện).
3.  Không có nút dừng khẩn cấp hoặc không thực hiện kê cao robot khỏi mặt bàn khi chạy thử nghiệm động cơ.
