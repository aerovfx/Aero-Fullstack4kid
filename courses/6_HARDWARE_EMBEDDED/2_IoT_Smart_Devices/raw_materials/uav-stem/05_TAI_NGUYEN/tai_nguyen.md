# DANH SÁCH TÀI NGUYÊN & CÔNG CỤ
> **Dự án:** Thiết kế chế tạo Budget Mini UAV  
> **Tổng hợp:** Danh sách phần mềm cần thiết, tài liệu tham khảo và địa chỉ tải các thư viện 3D.

---

## 💻 Danh sách phần mềm yêu cầu

1.  **Môi trường lập trình & Chạy dịch vụ:**
    *   [Node.js (LTS)](https://nodejs.org/): Để khởi chạy ứng dụng web DIY Workspace.
    *   [Git](https://git-scm.com/): Dùng để tải và quản lý phiên bản thiết kế.

2.  **Công cụ CAD & Dựng hình cơ khí:**
    *   [FreeCAD (Phiên bản mới nhất)](https://www.freecad.org/): Cần cài đặt để chạy engine headless sinh file cơ khí STEP/STL gốc.
    *   [Plasticity CAD](https://www.plasticity.xyz/): Phần mềm thiết kế B-Rep gọn nhẹ để chỉnh sửa chi tiết và tạo bo góc (fillets).

---

## 📚 Tài liệu tham khảo kỹ thuật

Học sinh và giáo viên có thể tham khảo trực tiếp các tài liệu mẫu nằm trong kho mã nguồn cục bộ:
*   **Kiến trúc dự án DIY:** [Science/DIY/docs/ARCHITECTURE.md](file:///Users/dangvietchung/Aero-HowtoLLMs/Science/DIY/docs/ARCHITECTURE.md) - Giải thích luồng dữ liệu CAD, cơ chế kiểm định va chạm và ranh giới an toàn.
*   **Mô tả dự án UAV mẫu:** [Science/DIY/README.md](file:///Users/dangvietchung/Aero-HowtoLLMs/Science/DIY/README.md) - Các thông số về UAV 30 linh kiện, tổng chi phí $118.28.
*   **Hướng dẫn cấu trúc học tập:** [Science/HOC_LIEU/README.md](file:///Users/dangvietchung/Aero-HowtoLLMs/Science/HOC_LIEU/README.md) - Chi tiết về các kế hoạch học tập STEM chính khóa và chuyên đề khoa học.

---

## 🛒 Thư viện linh kiện 3D mẫu (BOM Parts)
Các linh kiện mẫu để học sinh import vào bản vẽ CAD được lưu trữ tại:
*   [Thư mục CAD Primitives của dự án](file:///Users/dangvietchung/Aero-HowtoLLMs/Science/DIY/cad-runtime/)
*   Các mô hình định dạng STEP/STL của: Flight Controller, Pin LiPo, Motor Brushless và Propellers.
