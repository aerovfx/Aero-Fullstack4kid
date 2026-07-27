# KẾ HOẠCH GIẢNG DẠY (GIÁO VIÊN)
> **Học phần:** Thiết kế và Chế tạo Budget Mini UAV  
> **Thời lượng:** 10 buổi (mỗi buổi 2 tiết = 90 - 120 phút)

---

## 📅 Lộ trình chi tiết 10 buổi học

| Buổi | Chủ đề bài học | Nội dung chính | Công việc của học sinh |
| :--- | :--- | :--- | :--- |
| **1** | **Khởi động dự án & Phân tích Spec** | Tìm hiểu nguyên lý hoạt động của UAV; phân tích bài toán thiết kế Mini UAV trị giá $118.28. | Phân nhóm, lập kế hoạch dự án ban đầu. |
| **2** | **Quản lý danh mục linh kiện (Parts/BOM)** | Hiểu về tải trọng, động cơ, pin và cách tối ưu hóa chi phí (Budgeting). | Tạo danh sách linh kiện dự án mẫu (30 linh kiện). |
| **3** | **Sơ đồ điện & Sơ đồ nối dây (Wiring)** | Tìm hiểu về sơ đồ nối mạch điện, dòng điện và điện áp hoạt động an toàn. | Vẽ sơ đồ nối dây (Wiring diagram) cho UAV. |
| **4** | **Bắt đầu thiết kế cơ khí 3D (CAD P1)** | Làm quen với không gian 3D CAD, các khối cơ bản (primitives) và Three.js viewer. | Dựng hình khối bao (manufacturing envelope) của pin và FC. |
| **5** | **Thiết kế thân chính UAV (CAD P2)** | Tạo khung UAV (frame plates), các điểm gá động cơ và Flight Controller. | Dựng tấm đỡ trung tâm và tay đỡ motor. |
| **6** | **Ráp nối lắp ghép cơ khí (Mech Connections)** | Định nghĩa liên kết cơ khí (Mechanical connections) và kiểm tra khoảng cách va chạm. | Lắp ghép motor, cánh quạt vào khung UAV trên không gian 3D. |
| **7** | **Mô phỏng luồng MCP CAD** | Chạy các lệnh kiểm định CAD (`validate` -> `preview` -> `commit`) thông qua CAD runtime. | Chạy thử nghiệm validation kiểm tra khoảng cách an toàn của cánh quạt. |
| **8** | **Xuất bản thiết kế và in 3D (Visual/Export)** | Tạo bản vẽ kỹ thuật và xuất file STEP, STL để sẵn sàng chế tạo. | Thực hiện xuất gói ZIP dự án chuẩn Blueprint. |
| **9** | **Xây dựng cẩm nang lắp ráp (Guide)** | Viết quy trình lắp ráp từng bước, cách đấu nối dây an toàn và kiểm tra phần mềm điều khiển. | Soạn tài liệu hướng dẫn lắp ráp (Guide) kèm sơ đồ. |
| **10** | **Kiểm định, Đánh giá & Trình diễn (Showcase)** | Trình diễn mô hình 3D, báo cáo thiết kế, bảng BOM thực tế và chấm điểm theo Rubric. | Trình bày dự án trước hội đồng giáo viên. |

---

## 🛠️ Hướng dẫn chuẩn bị cho giáo viên

### 1. Chuẩn bị phần mềm và môi trường
*   Cài đặt **Node.js** và các thư viện frontend hiển thị 3D.
*   Cài đặt **FreeCAD** cục bộ và cấu hình đường dẫn `FREECAD_CMD` để làm headless worker phục vụ render file cơ khí gốc.
*   Tài nguyên tham khảo trực quan: thư mục [Science/DIY](file:///Users/dangvietchung/Aero-HowtoLLMs/Science/DIY).

### 2. Danh mục vật tư mẫu (Dự toán Budget Mini UAV)
*   **Tổng chi phí:** ~118.28 USD (cho 30 linh kiện).
*   **Các linh kiện chính cần chuẩn bị:**
    *   Khung Carbon/nhựa in 3D (Z-up system).
    *   4 Động cơ không chổi than (Brushless Motors).
    *   4 Cánh quạt (Propellers).
    *   Flight Controller (Bộ điều khiển bay).
    *   Mạch thu tín hiệu (Receiver) và Pin LiPo (Battery).
    *   Ốc vít và các khớp nối cơ khí.

---

> [!IMPORTANT]
> **Quy định an toàn giảng dạy:**
> *   *Luôn kiểm tra điện áp* trước khi cấp nguồn cho mạch thật.
> *   Khi thiết kế CAD, yêu cầu học sinh chừa khoảng hở tối thiểu **5mm** giữa các chi tiết chuyển động (như cánh quạt) và thân mạch để tránh va chạm cơ học.
