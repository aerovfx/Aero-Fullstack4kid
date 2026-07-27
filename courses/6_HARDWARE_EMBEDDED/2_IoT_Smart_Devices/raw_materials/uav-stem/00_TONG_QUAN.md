# TỔNG QUAN HỌC PHẦN: THIẾT KẾ VÀ CHẾ TẠO THIẾT BỊ BAY SIÊU NHỎ (BUDGET MINI UAV)
> **Đối tượng:** Học sinh lớp 10 - 12 (hoặc giáo viên STEM muốn phát triển phòng thí nghiệm phần cứng).  
> **Thời lượng:** 10 buổi (mỗi buổi 90 - 120 phút).  
> **Phương pháp:** Học thông qua dự án (Project-Based Learning), làm việc nhóm thiết kế (Maker culture) và ứng dụng phần mềm CAD/MCP.

---

## 🎯 Chuẩn đầu ra (Learning Outcomes)
Sau khi kết thúc học phần, học sinh sẽ:
1.  **Về kiến thức:** Hiểu được cấu trúc và nguyên lý hoạt động của một thiết bị bay không người lái (UAV) cơ bản (Khung, Động cơ, Cánh quạt, Flight Controller, Pin, Mạch thu nhận tín hiệu).
2.  **Về kỹ thuật:** Nắm vững quy trình thiết kế phần cứng theo luồng MCP CAD chuyên nghiệp (`Draft` -> `Validate` -> `Preview` -> `Commit`).
3.  **Về lập trình & CAD:** Có khả năng sử dụng các công cụ 3D CAD (Three.js viewer, FreeCAD/Plasticity) để thiết kế các bộ phận cơ khí và lập sơ đồ mạch điện (Wiring).
4.  **Về kỹ năng mềm:** Phát triển năng lực làm việc nhóm, tối ưu hóa ngân sách dự án (BOM) và viết tài liệu hướng dẫn lắp ráp (Guide).

---

## 📦 Cấu trúc gói dự án Blueprint (ZIP Export)
Cuối học phần, mỗi nhóm học sinh phải xuất được gói thiết kế chuẩn Blueprint gồm 6 tệp chính:
1.  `CONFIG`: Tệp cấu hình thông số kỹ thuật của UAV.
2.  `PARTS`: Danh sách linh kiện (BOM) với đơn giá chi tiết.
3.  `ELECTRICAL_CONNECTIONS`: Sơ đồ nối dây điện và tín hiệu của hệ thống.
4.  `MECHANICAL_CONNECTIONS`: Mối liên kết cơ khí và vị trí lắp ghép giữa các chi tiết.
5.  `GUIDE`: Hướng dẫn lắp ráp từng bước kèm hình ảnh trực quan.
6.  `VISUAL`: Tệp kết xuất 3D (STEP/STL) phục vụ in 3D hoặc gia công.

---

## 🗂️ Sơ đồ tổ chức học liệu (Thư mục DIY_STEM_UAV)
Hệ thống học liệu này tuân thủ nguyên tắc sắp xếp theo hoạt động dạy học của dự án `Science/HOC_LIEU`:
```text
DIY_STEM_UAV/
├── 00_TONG_QUAN.md              # Tài liệu tổng quan này
├── 01_GIAO_VIEN/                # Kế hoạch bài dạy chi tiết, đáp án và bảng dự toán
│   └── ke_hoach_giang_day.md
├── 02_HOC_SINH/                 # Bài học lý thuyết, nhiệm vụ và phiếu học tập
│   └── bai_hoc.md
├── 03_THUC_HANH_DU_AN/          # Hướng dẫn sử dụng CAD, mã code, sơ đồ nối dây
│   └── quy_trinh_cad.md
├── 04_DANH_GIA/                 # Rubric đánh giá dự án và tiêu chí nghiệm thu kỹ thuật
│   └── rubric.md
└── 05_TAI_NGUYEN/               # Danh sách linh kiện mẫu, liên kết cài đặt phần mềm
    └── tai_nguyen.md
```
