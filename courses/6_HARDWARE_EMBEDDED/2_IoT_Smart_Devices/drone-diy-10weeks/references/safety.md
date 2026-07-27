# 🛡️ Quy Định An Toàn Bay / Flight Safety Regulations
# *DIY Drone Course — Safety Reference*

---

> ⚠️ **ĐỌC TRƯỚC KHI BAY** | **READ BEFORE FLYING**  
> Vi phạm các quy định an toàn có thể gây tai nạn nghiêm trọng, hỏng thiết bị, hoặc vi phạm pháp luật.  
> *Violating safety regulations may cause serious accidents, equipment damage, or legal violations.*

---

## 🇻🇳 Quy Định Pháp Lý Việt Nam / Vietnamese Legal Regulations

### Cục Hàng Không Dân Dụng Việt Nam (CAAV)

| Quy định | Nội dung |
|---------|---------|
| **Trọng lượng < 250g** | Không cần đăng ký, hạn chế bay gần sân bay |
| **250g – 7kg** | Phải đăng ký, cần giấy phép bay |
| **> 7kg** | Phải có chứng chỉ phi công drone chuyên nghiệp |
| **Độ cao tối đa** | 120m AGL (Above Ground Level) cho drone dân sự |
| **Tầm nhìn** | Phải giữ drone trong tầm nhìn trực tiếp (VLOS) |

### Khu Vực Cấm Bay / No-Fly Zones

```
❌ Bán kính 8km từ sân bay (Nội Bài, Tân Sơn Nhất, Đà Nẵng, v.v.)
❌ Khu vực quân sự, trụ sở chính phủ
❌ Nhà máy điện, đập thủy điện
❌ Khu vực đông người (> 1000 người): lễ hội, sân vận động
❌ Khu vực đang cháy, thiên tai, cứu hộ cứu nạn
⚠️  Khu dân cư: cần thông báo/xin phép địa phương
```

> 📱 **App kiểm tra**: Tải app **AirMap** hoặc **Aloft** để kiểm tra không phận trước khi bay.

---

## ✅ Checklist An Toàn Trước Bay / Pre-Flight Safety Checklist

### A. Kiểm Tra Địa Điểm / Location Check
- [ ] Khu vực được phép bay (kiểm tra app AirMap)
- [ ] Không có người, vật nuôi trong vòng 10m
- [ ] Khu vực thoáng, không có cây/dây điện overhead
- [ ] Thời tiết: gió < 6m/s, không mưa, tầm nhìn tốt
- [ ] Có người phụ (spotter) quan sát xung quanh

### B. Kiểm Tra Thiết Bị / Equipment Check
- [ ] Frame không nứt, vít đã siết chặt
- [ ] Cánh quạt không chipped/cracked, đã vặn chặt đúng chiều (CW/CCW)
- [ ] Motor quay trơn, không tiếng kẹt
- [ ] ESC dây nối chắc chắn, không lỏng
- [ ] Pin LiPo đủ điện (> 3.7V/cell), không phồng
- [ ] GPS lock ≥ 6 vệ tinh (nếu dùng GPS mode)
- [ ] Cảnh báo Failsafe đã cấu hình
- [ ] RC đã bind, throttle ở 0, drone chưa arm

### C. Kiểm Tra Phần Mềm / Software Check
- [ ] Firmware cập nhật mới nhất
- [ ] PID tuning đã ổn định (từ lần bay trước)
- [ ] Blackbox/logging đã bật
- [ ] Home point đặt chính xác

### D. Sau Khi Arm / After Arming
- [ ] Tất cả mọi người đứng ra xa ≥ 5m
- [ ] Throttle tăng từ từ
- [ ] Hover thấp 1–2m kiểm tra ổn định trước khi bay cao

---

## ⚠️ Cảnh Báo Nguy Hiểm / Danger Warnings

### 🔥 Pin LiPo — Nguy Hiểm Cháy / LiPo Fire Hazard

```
⛔ KHÔNG BAO GIỜ:
  - Sạc pin không giám sát
  - Sạc pin bị phồng (puffed/swollen)
  - Để pin dưới nắng trực tiếp
  - Đâm thủng, uốn cong pin
  - Xả pin dưới 3.5V/cell (= 10.5V cho 3S)
  - Để pin đầy 100% khi không dùng > 3 ngày

✅ LUÔN LUÔN:
  - Dùng túi LiPo Safe Bag khi sạc
  - Sạc ở mức storage voltage (3.8V/cell) nếu không bay
  - Chuẩn bị bình cát hoặc thùng kim loại trong phòng
  - Báo cháy ngay nếu pin phát nhiệt bất thường
```

### ⚡ Cánh Quạt Quay / Spinning Propellers

```
⛔ KHÔNG BAO GIỜ:
  - Với tay vào cánh quạt khi drone đang bật nguồn
  - Đứng trong tầm quay của cánh quạt khi test motor
  - Để trẻ em/thú cưng gần drone đang arm

✅ TRÌNH TỰ AN TOÀN KHI TEST MOTOR:
  1. Tháo cánh quạt trước khi test trên bàn
  2. Đứng phía sau drone, không đứng trên đường thẳng với motor
  3. Chỉ lắp cánh quạt khi đã ra khu vực bay
```

### 📡 Mất Tín Hiệu RC / RC Signal Loss

```
Cấu hình Failsafe (RTL - Return to Launch):
  1. Betaflight → Failsafe tab → Stage 2 = Return to Home
  2. Test: tắt transmitter khi drone hover thấp → phải tự về

Dấu hiệu sắp mất tín hiệu:
  - RSSI < 30% (cảnh báo trong OSD/dashboard)
  - Drone có chuyển động không mong muốn
  → Hạ thấp và hạ cánh ngay!
```

---

## 🚑 Xử Lý Sự Cố / Emergency Procedures

| Tình huống | Xử lý |
|-----------|------|
| **Drone flyaway** | Đặt throttle = 0 → disarm → bật RTL |
| **Motor smoke/lửa** | Disarm ngay → tháo nguồn → xa ra 5m |
| **Pin phồng/nóng** | Để ra ngoài trời trên nền đất/cát, gọi giáo viên |
| **Crash gần người** | Disarm ngay → kiểm tra người trước, drone sau |
| **Mất tầm nhìn** | Không di chuyển thêm → kích hoạt RTL |

---

## 📋 Quy Tắc Lớp Học / Classroom Rules

1. **Không bao giờ bay trong nhà** trừ khi có mạng lưới bảo vệ
2. **Mặc kính bảo hộ** khi test motor trong phòng
3. **Thông báo "ARMING!"** trước khi arm drone
4. **Pilot gọi "CLEAR!"**, mọi người trả lời "CLEAR!" trước khi bay
5. **Một pilot tại một thời điểm** — không hai người cầm tay điều khiển cùng lúc
6. **Không bay khi mệt mỏi, mất tập trung**
7. **Dừng ngay** nếu thấy bất kỳ điều bất thường

---

*Tài liệu an toàn — STEM Drone Program · Cập nhật 07/2026*
