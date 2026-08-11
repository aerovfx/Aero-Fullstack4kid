# Tuần 16: Hacking Wireless Networks (CEH v13 Module 16)

> Module CEH v13 tương ứng: **16 — Hacking Wireless Networks**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 16** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu giao thức chuẩn IEEE 802.11, các chế độ hoạt động (infrastructure, ad-hoc), và mô hình khung frame.
2. Phân biệt các giao thức bảo mật WLAN: **WEP → WPA → WPA2 → WPA3**, và vì sao WEP/WPA đã vỡ.
3. Nắm các loại tấn công không dây: **Evil Twin, KRACK, PMKID, Deauthentication, Rogue AP, MAC spoofing, Jamming**.
4. Hiểu công cụ CEH (airodump-ng, aircrack-ng, wifite, kismet) và quy trình hack 802.11 theo LÝ THUYẾT.
5. Xây dựng **wireless security audit checklist + máy tính entropy mật khẩu WPA2** (Lab 1) và tự kiểm tra mạng nhà mình (Lab 2).

---

## Lý Thuyết / Theory

### 1. Chuẩn 802.11 Cơ Bản

| Thuật ngữ | Ý nghĩa |
|-----------|---------|
| **AP (Access Point)** | Thiết bị phát sóng, trung tâm mạng |
| **STA (Station)** | Thiết bị client kết nối (laptop, phone) |
| **BSSID** | Địa chỉ MAC của AP |
| **SSID** | Tên mạng WiFi hiển thị |
| **Channels** | Dải tần: 2.4 GHz (1-13), 5 GHz, 6 GHz (WiFi 6E) |
| **Frame types** | Management (beacon, probe, auth, deauth), Control (RTS/CTS, ACK), Data |
| **Beacon frame** | AP quảng bá SSID + capabilities |

### 2. Tiến Hóa Bảo Mật WLAN

| Giao thức | Cơ chế | Tình trạng |
|-----------|--------|-----------|
| **WEP** | RC4 64/128-bit, IV 24-bit | **VỠ HOÀN TOÀN** — IV lặp lại sau ~5000 frame; bẻ trong phút |
| **WPA (TKIP)** | RC4 + TKIP, MIC 64-bit | Yếu — tấn công **Michael/bit-flip**, brute-force passphrase |
| **WPA2 (AES-CCMP)** | AES, 4-way handshake, PSK | Chính chuẩn; lỗ hổng **KRACK** (2017) |
| **WPA3 (SAE)** | Handshake **SAE/Dragonfly** (chống offline dictionary), PMF | An toàn hơn; lỗ hổng **Downgrade** (Dragonblood 2019) |

> **Tấn công chính WPA2-PSK:** bắt **4-way handshake** (deauth để ép client đăng nhập lại) rồi **offline dictionary/brute-force** passphrase. WPA3 chống điều này bằng SAE (không thể bắt handshake để brute-force offline).

### 3. Các Loại Tấn Công Không Dây

| Tấn công | Mô tả |
|----------|-------|
| **Evil Twin** | AP giả mạo cùng SSID, đánh lừa client vào mạng của kẻ tấn công (mitm) |
| **KRACK** | Đánh dấu lại (reinstall) key trong 4-way handshake WPA2 — đọc/tiêm traffic |
| **PMKID attack** | Rút PMKID từ client không cần deauth — offline crack |
| **Deauthentication** | Gửi frame deauth liên tục — ngắt mạng nạn nhân, ép khách kết nối lại |
| **Rogue AP** | AP không được phép cắm vào mạng công ty (backdoor) |
| **Jamming** | Nhiễu RF tần số — DoS vùng phủ sóng |
| **MAC spoofing** | Giả địa chỉ MAC để qua khỏi MAC filter |

### 4. Quy Trình Hack 802.11 (LÝ THUYẾT)

```
1. Khảo sát:      airmon-ng start wlan0  →  airodump-ng wlan0mon
2. Chọn mục tiêu: ghi BSSID + channel
3. Bắt handshake: airodump-ng -c CH --bssid BSSID -w cap wlan0mon
4. Ép deauth:     aireplay-ng -0 5 -a BSSID wlan0mon   (ép client login lại)
5. Crack:         aircrack-ng -w wordlist.txt -b BSSID cap.cap
```

> [!WARNING]
> Toàn bộ mục trên **CHỈ LÀ LÝ THUYẾT** theo giáo trình CEH. **KHÔNG** chạy aircrack-ng trên mạng người khác — đó là hành vi phạm pháp. Chỉ thực hành **trên mạng của chính bạn** nếu bạn có quyền.

### 5. Phòng Thủ WLAN

- **WPA3/SAE** (hoặc tối thiểu WPA2-AES), **PMF (802.11w)** bật.
- **Passphrase mạnh**: ≥ 12 ký tự, không phải từ điển, entropy cao (Lab 1 đo).
- **Tắt WPS** (lỗ hổng brute-force PIN), tắt MAC filter làm lớp duy nhất.
- **Rogue AP detection**: khảo sát định kỳ (kismet, wifite) tìm AP lạ cùng SSID.
- **WiFi Enterprise** (802.1X/RADIUS) cho doanh nghiệp — mỗi người 1 tài khoản, cấm cá nhân tự cắm AP.
- **Chính sách:** không kết nối WiFi công cộng không mã hoá, dùng VPN trên mạng lạ.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này **CHỈ kiểm tra mạng WiFi của CHÍNH BẠN** (mạng bạn có quyền, ví dụ WiFi nhà). Đừng scan/bẻ mạng hàng xóm.
> 2. Không cài aircrack-ng/airmon-ng trên máy không được phép. Tấn công wireless người khác vi phạm Luật An ninh mạng 2018.
> 3. Công cụ Lab 1 **không cần root**, không kết nối mạng — chỉ phân tích chuỗi passphrase bạn tự gõ.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week16_wifi_audit.py`. Tool làm **2 việc phòng thủ**:
> - Tính **entropy mật khẩu WPA2** (bits) và đánh giá mạnh/yếu — khuyên chọn passphrase đủ tốt.
> - In **checklist audit WiFi** cho mạng nhà/doanh nghiệp.

### Lab 1: WPA2 Passphrase Entropy Checker (Python)

```bash
python3 CODE/week16_wifi_audit.py --pass "hoanghahaha"
python3 CODE/week16_wifi_audit.py --pass "R@7v2#mQ9!zP"
python3 CODE/week16_wifi_audit.py --checklist
```

Kết quả mẫu:

```
[PASSPHRASE]  hoanghahaha
[ENTROPY]     21.5 bits  (quá yếu — tìm thấy pattern từ điển, sẽ bị crack nhanh)
[KHUYẾN NGHỊ] Dùng ít nhất 12 ký tự ngẫu nhiên → entropy > 50 bits
```

> **Giải thích CEH:** entropy thấp = passphrase nằm trong không gian tìm kiếm nhỏ của wordlist → bẻ nhanh. Đây là lý do WPA2-PSK cần passphrase ngẫu nhiên dài, dù không ai "nhìn thấy" mật khẩu.

### Lab 2: Tự kiểm tra mạng nhà mình

```bash
# (macOS) - xem mạng bạn đang nối và phương thức bảo mật
# Hệ thống Preferences → Wi-Fi → chi tiết mạng đang kết nối
# Ghi nhận: chuẩn bảo mật (WPA2/WPA3), mật khẩu có phải kiểu "hoanghahaha" không?
# Nếu WEP/WPA đơn thuần → đổi ngay sang WPA2-AES/WPA3, đổi passphrase dài.
```

### Lab 3: Checklist audit nhanh

```bash
python3 CODE/week16_wifi_audit.py --checklist
```

Kết quả mẫu:

```
===== WIFI AUDIT CHECKLIST (BLUE TEAM) =====
 [ ] WPA2/WPA3 (không còn WEP/WPA)
 [ ] WPS đã TẮT
 [ ] Passphrase >= 12 ký tự, entropy cao
 [ ] Không có AP lạ / Rogue AP trong phạm vi
 [ ] MAC filter KHÔNG được dùng làm lớp bảo mật chính
 [ ] Firmware router đã cập nhật (tránh KRACK/Dragonblood)
 [ ] (Doanh nghiệp) dùng 802.1X + chính sách cấm tự cắm AP
===== TỰ ĐÁNH GIÁ =====
```

---

## Bài Tập Về Nhà / Homework

1. **Entropy:** chạy `--pass` với 5 passphrase: 1 yếu (tên bạn + số), 1 trung bình, 1 mạnh, và so sánh bits. Nộp bảng so sánh.
2. **Bảng so sánh:** WEP vs WPA vs WPA2 vs WPA3 — cơ chế, lỗ hổng chính, còn dùng được không.
3. **Tấn công:** giải thích 3 tấn công: Evil Twin, KRACK, PMKID — điều kiện, cách hoạt động, phòng thủ.
4. **Audit nhà:** chạy checklist, điều tra router nhà bạn, viết 3 hành động bạn sẽ thực hiện (VD: đổi passphrase, tắt WPS, cập nhật firmware).

---

## Rubric Đánh Giá Tuần 16

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Entropy tool** | 5 passphrase + giải thích bits (40đ) | 2-3 passphrase (25đ) | Không chạy (10đ) |
| **Bảng so sánh WEP→WPA3** | Đủ 4 chuẩn + lỗ hổng đúng (30đ) | Thiếu chi tiết (20đ) | Sai khái niệm (5đ) |
| **3 tấn công + audit nhà** | Giải thích đúng + 3 hành động (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 16

- [ ] Giải thích 802.11, BSSID/SSID, management/control/data frame
- [ ] So sánh WEP/WPA/WPA2/WPA3 — lỗ hổng của từng chuẩn
- [ ] Giải thích KRACK, PMKID, Evil Twin, Deauth, Rogue AP, Jamming
- [ ] Trình bày quy trình hack 802.11 (lý thuyết) + công cụ CEH
- [ ] Chạy thành công `week16_wifi_audit.py --pass` và `--checklist`
- [ ] Nêu 6 countermeasures bảo mật WLAN
