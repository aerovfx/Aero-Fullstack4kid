# QUY TRÌNH THỰC HÀNH CAD & MCP RUNTIME
> **Nội dung:** Hướng dẫn luồng làm việc với 3D CAD engine (Three.js viewer, FreeCAD/Plasticity headless runtime) và lập sơ đồ nối dây thiết bị bay.

---

## ⚙️ Luồng thiết kế MCP CAD chuẩn
Trong học phần này, chúng ta không vẽ tự do mà tuân theo quy trình kiểm soát chất lượng kỹ thuật nghiêm ngặt gồm 4 bước:

```text
 ┌───────────────┐     ┌───────────────┐     ┌───────────────┐     ┌───────────────┐
 │ 1. DRAFT      │  →  │ 2. VALIDATE   │  →  │ 3. PREVIEW    │  →  │ 4. COMMIT     │
 └───────────────┘     └───────────────┘     └───────────────┘     └───────────────┘
   Ý tưởng sơ bộ         Kiểm tra lỗi          Dựng hình 3D          Lưu trữ bản vẽ
   (Thông số thô)        (Clash detection)     (Three.js/STEP)       chính thức
```

---

## 🛠️ Hướng dẫn các bước thực hành

### Bước 1: Khởi động CAD Runtime (Dành cho giáo viên/học sinh nâng cao)
Mở terminal và khởi chạy dịch vụ CAD headless (sử dụng nhân FreeCAD):
```bash
FREECAD_CMD=/Applications/FreeCAD.app/Contents/Resources/bin/FreeCADCmd npm run cad:runtime
```
*Lưu ý:* Đảm bảo service trả về trạng thái hoạt động tốt bằng cách truy cập `http://127.0.0.1:44045/health`.

### Bước 2: Thiết lập khung mô hình UAV (Draft)
Khai báo cấu trúc hình học của UAV thông qua định dạng JSON. Ví dụ khai báo khung cơ bản:
```json
{
  "project": "budget-mini-uav",
  "version": "1.0.0",
  "features": [
    {
      "name": "BasePlate",
      "type": "box",
      "dimensions": [100.0, 100.0, 2.0],
      "position": [0.0, 0.0, 0.0]
    },
    {
      "name": "BatteryEnvelope",
      "type": "box",
      "dimensions": [80.0, 40.0, 25.0],
      "position": [0.0, 0.0, 12.5]
    }
  ]
}
```

### Bước 3: Chạy kiểm định va chạm (Validate)
Sử dụng công cụ kiểm thử của hệ thống để xác minh:
1.  **Khoảng cách cánh quạt (Propeller Clearance):** Khoảng cách giữa hai đầu cánh quạt đối diện phải $\ge 10\text{ mm}$ để tránh va quẹt khi quay.
2.  **Độ dày tấm khung (Frame Thickness):** Khung carbon chịu lực chính phải có độ dày $\ge 1.5\text{ mm}$ để đảm bảo độ bền cơ học.
3.  **Trọng tâm (Center of Gravity):** Độ lệch CG so với gốc tọa độ hình học $(0, 0, 0)$ không vượt quá $3\text{ mm}$.

### Bước 4: Lắp ráp cơ khí bằng Three.js / Plasticity
*   Bấm chọn **MECH -> BUILD WITH DIY CAD** để FreeCAD headless sinh ra các tệp CAD định dạng `.FCStd`, `.STEP`, và `.STL`.
*   Sử dụng **OPEN IN PLASTICITY** để gửi mô hình đã kiểm định sang phần mềm Plasticity và tiến hành tạo góc bo tròn (fillets) hay đục lỗ bắt vít chính xác.

---

## 🔌 Đặc tả sơ đồ nối dây (Electrical Connections Spec)
Học sinh tạo sơ đồ kết nối dưới dạng danh sách kết nối (Netlist) hoặc vẽ trực quan. Các liên kết cơ bản bắt buộc phải có:

```text
🔋 Pin (LiPo 3S/4S) ──────> 🔌 Bảng phân phối điện (PDB) / ESC 4-trong-1
                            ├───> 🖥️ Flight Controller (Cấp nguồn 5V/BEC)
                            └───> ⚡ 4 Động cơ không chổi than (Đường truyền động lực)

🎮 Mạch thu sóng (RX) ────> 🖥️ Flight Controller (Chân tín hiệu SBUS/IBUS)
🖥️ Flight Controller ────> 🔌 ESC 4-trong-1 (Tín hiệu điều khiển PWM/DShot)
```
