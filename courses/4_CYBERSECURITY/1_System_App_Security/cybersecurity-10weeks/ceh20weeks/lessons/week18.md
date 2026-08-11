# Tuần 18: IoT & Operational Technology Hacking (CEH v13 Module 18)

> Module CEH v13 tương ứng: **18 — IoT and OT Hacking**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 18** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu kiến trúc IoT: **thiết bị (device) → gateway → cloud → app**, và các giao thức phổ biến (MQTT, CoAP, AMQP, Zigbee, BLE, LoRa).
2. Phân biệt IoT vs **OT/ICS/SCADA**: PLC, HMI, RTU, giao thức Modbus/DNP3 — vì sao OT nguy hiểm hơn (rủi ro an toàn tính mạng, an toàn vận hành).
3. Nắm các vector tấn công IoT: **default credentials, firmware reverse engineering, insecure cloud API, MITM giao thức, khai thác OWASP Top 10 IoT**.
4. Hiểu khái niệm và lỗ hổng nổi bật của OT: **Stuxnet (Siemens S7), attack via PLC, protocol vuln (Modbus không xác thực)**.
5. Xây dựng tool phòng thủ: **IoT device credential auditor + MQTT topic heuristic checker** (Lab 1) và checklist bảo mật IoT/OT (Lab 2).

---

## Lý Thuyết / Theory

### 1. Kiến Trúc & Giao Thức IoT

```
[ Device ] --MQTT/BLE/Zigbee/WiFi---> [ Gateway ] --MQTT/HTTPS--> [ Cloud ]
                                                                     |
[ Mobile App ] <------HTTPS/API--------------------------------------+
```

| Giao thức | Đặc điểm | Lưu ý bảo mật |
|-----------|----------|---------------|
| **MQTT** | Pub/Sub qua broker, port 1883/8883 | Mặc định **KHÔNG mã hoá**, auth yếu, topic dễ bị subscribe trộm |
| **CoAP** | REST nhẹ cho thiết bị hạn chế, port 5683 | UDP, thường không TLS |
| **AMQP** | Message queue cho IoT/cloud | Cấu hình phức tạp |
| **Zigbee/Z-Wave** | Mesh năng lượng thấp | Key mặc định có thể bị reverse |
| **BLE** | Trong nhà, ngắn | Sniff nếu pairing yếu |
| **LoRa/LoRaWAN** | Xa, IoT nông nghiệp/đô thị | App key phải giữ kín |

### 2. IoT vs OT/ICS/SCADA

| Đặc điểm | IoT | OT / ICS / SCADA |
|----------|-----|------------------|
| Mục đích | Tiện ích dân dụng/thương mại | Điều khiển **cơ sở hạ tầng vật lý** (nhà máy, điện, nước) |
| Thiết bị | Sensor, camera, smart home | **PLC, RTU, HMI, SCADA server** |
| Giao thức | MQTT, BLE, Zigbee, WiFi | **Modbus, DNP3, OPC-UA, S7comm** |
| Hệ quả bị hack | Rò rỉ dữ liệu, quấy rối | **Ngừng sản xuất, nổ, chết người, thiên tai hạ tầng** |
| Tuổi thọ thiết bị | Vài năm, patch được | 10-30 năm, **không patch** được |

> **Điểm mấu chốt CEH:** OT rủi ro cao hơn vì (a) không thể patch nhanh, (b) mất an toàn vận hành = nguy hiểm tính mạng, (c) giao thức cũ thiếu xác thực/mã hoá (Modbus không hề xác thực).

### 3. Các Vector Tấn Công IoT

| Vector | Mô tả |
|--------|-------|
| **Default/insecure credentials** | Camera/router để mật khẩu mặc định → botnet (VD **Mirai**) |
| **Firmware reverse engineering** | Giải nén firmware → lộ secret, backdoor, vuln |
| **Insecure cloud API** | API thiết bị không xác thực → điều khiển từ xa người khác |
| **Protocol MITM** | Bắt/sửa MQTT không mã hoá, BLE pairing yếu |
| **Physical/side-channel** | UART/JTAG tiếp xúc, đọc flash |
| **OWASP Top 10 IoT** | Yếu xác thực, mật khẩu, mạng, update thiếu, lộ dữ liệu |

### 4. Tấn Công OT Đáng Chú Ý (LÝ THUYẾT)

- **Stuxnet (2010):** virus phá **Siemens S7 PLC** làm hỏng centrifuge nhà máy hạt nhân Iran — bằng chứng OT có thể bị vũ khí hoá để phá hoại vật lý.
- **Attack qua PLC/Modbus:** Modbus TCP **không có xác thực** — kẻ có quyền truy cập mạng có thể ghi giá trị, bật/tắt thiết bị.
- **Năm 2016 Ukraine blackout:** malware đánh cắp session HMI, cắt điện.

> [!WARNING]
> Phần trên là **LÝ THUYẾT** giáo trình CEH. **KHÔNG BAO GIỜ** thử ghi/điều khiển PLC/thiết bị công nghiệp thật — có thể gây tai nạn, chết người, vi phạm pháp luật nghiêm trọng.

### 5. Phòng Thủ IoT/OT

- **Đổi credential mặc định ngay** khi bóc máy; tắt port không dùng.
- **Cô lập mạng:** IoT/OT nằm trong **VLAN riêng**, không chung với mạng công ty; **firewall + gateway** giữa OT và IT.
- **Mã hoá & xác thực giao thức:** MQTT over TLS + username/password + **ACL topic**, dùng x509.
- **Firmware/OS cập nhật** khi có thể; quản lý tài sản (asset inventory) để biết cái gì đang chạy.
- **Giám sát bất thường** (như Tuần 12-14): lưu lượng lạ tới thiết bị.
- **OT:** air-gap hoặc **Unidirectional Gateway** (data diode), đào tạo vận hành, ICS-CERT advisories.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. **TUYỆT ĐỐI** không kết nối / thử điều khiển thiết bị OT, PLC, SCADA, máy móc nhà máy — kể cả trong "lab". Hệ quả có thể là **thương vong** và hình sự.
> 2. Lab 1 và Lab 2 hoàn toàn **offline, không kết nối thiết bị nào** — chỉ phân tích chuỗi credential/topic bạn tự gõ.
> 3. Không scan mạng thiết bị IoT của người khác, không bẻ firmware không được phép.
> 4. Vi phạm = **FAIL toàn bộ khoá học** + có thể bị truy cứu trách nhiệm.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week18_iot_audit.py`. Tool phòng thủ gồm:
> - **Credential auditor:** kiểm tra mật khẩu bạn đặt cho thiết bị IoT có nằm trong danh sách credential mặc định/đã lộ (kiểu Mirai) không.
> - **MQTT topic heuristic:** đánh giá topic có an toàn khi publish không (nhắc nhở về ACL + TLS).
> - In **checklist bảo mật IoT/OT**.

### Lab 1: IoT Credential Auditor (Python)

```bash
python3 CODE/week18_iot_audit.py --cred admin:admin
python3 CODE/week18_iot_audit.py --cred admin:M@n4ger!2024
python3 CODE/week18_iot_audit.py --topic "home/camera/live"
python3 CODE/week18_iot_audit.py --checklist
```

Kết quả mẫu:

```
[CRED]  admin:admin
[!] ĐÂY LÀ CREDENTIAL MẶC ĐỊNH/ĐÃ LỘ (thuộc danh sách botnet Mirai) — ĐỔI NGAY
[KHUYẾN NGHỊ] user/pass duy nhất cho từng thiết bị, dài >= 12 ký tự.

[CRED]  admin:M@n4ger!2024
[OK]   Không nằm trong danh sách đã lộ — vẫn nhắc: đổi định kỳ, không dùng chung.
```

> **Giải thích CEH:** botnet Mirai quét toàn internet bằng **danh sách credential mặc định** (`admin:admin`, `root:123456`, `support:...`). Thiết bị IoT nào dùng credential trong danh sách đó là mồi ngon.

### Lab 2: MQTT Topic Heuristic + Checklist

```bash
python3 CODE/week18_iot_audit.py --topic "home/camera/live"
python3 CODE/week18_iot_audit.py --checklist
```

Kết quả mẫu:

```
[TOPIC]  home/camera/live
[Nhắc nhở] Topic chỉ là "đường dẫn", KHÔNG phải bảo mật:
   - Phải dùng MQTT over TLS (port 8883)
   - Broker cần auth + ACL topic (không cho subscribe trộm)
   - Dữ liệu nhạy cảm nên mã hoá end-to-end

===== IOT/OT SECURITY CHECKLIST =====
 [ ] Đổi credential mặc định, tắt port không dùng
 [ ] IoT/OT nằm trong VLAN riêng, có firewall/gateway
 [ ] MQTT over TLS + auth + ACL topic
 [ ] Firmware cập nhật khi có thể + asset inventory
 [ ] Giám sát bất thường lưu lượng tới thiết bị
 [ ] (OT) air-gap / data diode + đào tạo vận hành
 [ ] Đánh giá theo OWASP Top 10 IoT định kỳ
===== TỰ ĐÁNH GIÁ =====
```

---

## Bài Tập Về Nhà / Homework

1. **Credential:** chạy `--cred` với 3 mật khẩu (1 trong danh sách lộ, 1 yếu, 1 mạnh) — ghi kết quả và nhận xét.
2. **Kiến trúc:** vẽ sơ đồ IoT 4 lớp (device→gateway→cloud→app) và chỉ rõ 3 nơi yếu cần bảo vệ.
3. **IoT vs OT:** bảng so sánh 5 tiêu chí; giải thích vì sao OT nguy hiểm hơn.
4. **Case study:** tìm hiểu **Mirai botnet (2016)** hoặc **Stuxnet (2010)** — diễn biến, hệ quả, bài học phòng thủ.

---

## Rubric Đánh Giá Tuần 18

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Credential tool** | 3 cred + nhận xét đúng (40đ) | 1-2 cred (25đ) | Không chạy (10đ) |
| **Kiến trúc + IoT vs OT** | Sơ đồ đủ 4 lớp + so sánh đúng (30đ) | Thiếu chi tiết (20đ) | Sai khái niệm (5đ) |
| **Case study Mirai/Stuxnet** | Phân tích diễn biến + bài học (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 18

- [ ] Vẽ kiến trúc IoT 4 lớp và các giao thức chính (MQTT, CoAP, BLE, LoRa)
- [ ] So sánh IoT vs OT/ICS/SCADA — vì sao OT nguy hiểm hơn
- [ ] Liệt kê 6+ vector tấn công IoT (default cred, firmware RE, cloud API, MITM, OWASP Top 10)
- [ ] Kể được Stuxnet/Modbus không xác thực (lý thuyết phòng thủ)
- [ ] Chạy thành công `week18_iot_audit.py --cred` và `--checklist`
- [ ] Nêu 6 countermeasures IoT/OT
