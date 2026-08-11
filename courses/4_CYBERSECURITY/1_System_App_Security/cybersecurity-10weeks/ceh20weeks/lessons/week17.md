# Tuần 17: Hacking Mobile Platforms (CEH v13 Module 17)

> Module CEH v13 tương ứng: **17 — Hacking Mobile Platforms**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 17** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu hệ sinh thái mobile: Android (AOSP, phân mảnh) vs iOS (khép kín), mô hình sandbox, permission model.
2. Nắm các vector tấn công mobile: **malware, malicious app, rooting/jailbreak, MITM qua mạng không dây, SMS phishing, OS vuln, supply chain app store**.
3. Hiểu các kỹ thuật CEH: **repackaging app (trojanize), backing up & extracting app data, bypassing jailbreak detection, insecure storage**.
4. Biết công cụ phòng thủ di động: **Mobile Device Management (MDM), containerization (BYOD), app signing & vetting, remote wipe, mã hoá thiết bị**.
5. Xây dựng tool phòng thủ kiểm tra **cấu hình an toàn của Android device (adb)** và **API key/secret lộ trong source** (Lab 1, Lab 2).

---

## Lý Thuyết / Theory

### 1. So Sánh Nền Tảng

| Đặc điểm | Android | iOS |
|----------|---------|-----|
| Mô hình | AOSP mở, phân mảnh OEM | Khép kín, Apple kiểm soát |
| Cài app ngoài store | **Cho phép (sideload)** — rủi ro | Chỉ App Store (chính thức) |
| Jailbreak/root | Root thường xuyên (custom ROM) | Jailbreak (cần khai thác) |
| Permission | Runtime permission (Android 6+) | App Store review + runtime |
| App sandbox | Sandbox theo user | Sandbox strict (entitlement) |
| Phân mảnh bảo mật | Cao (thiết bị cũ không update) | Thấp (cập nhật tập trung) |

### 2. Các Vector Tấn Công Mobile

| Vector | Mô tả |
|--------|-------|
| **Malicious app / trojan** | App "giả lậu" chứa spyware, ransomware, banking trojan |
| **Repackaging** | Tải app thật → **giải nén → chèn mã độc → đóng gói lại** → phát tán ngoài store |
| **Rooting / jailbreak** | Phá rào sandbox — malware có quyền đọc toàn bộ data, keylog |
| **MITM** | Bắt traffic qua WiFi giả, HTTP không TLS, cert không đúng |
| **SMS phishing (SMiShing)** | Lừa cài app / nhấn link độc qua SMS |
| **Insecure storage** | App lưu **token/API key/password dạng text** trong bộ nhớ đọc được |
| **Backup extraction** | Kẻ cắp máy/adb backup lấy database app (contacts, SMS, cookies) |
| **Side-channel** | Từ app có permission camera/mic/location bị lạm dụng |

### 3. Kỹ Thuật CEH (LÝ THUYẾT)

- **Android:** `adb backup` → giải nén `.ab` → xem database SQLite app.
- **iOS:** backup iTunes (unencrypted) → giải nén xem keychain/plist.
- **Repackaging:** `apktool d app.apk` → sửa smali → `apktool b` → ký lại bằng `jarsigner`/`apksigner`.
- **Bypass jailbreak/root detection:** chỉnh smali, hoặc dùng tool (Frida) — chỉ để **nghiên cứu bảo mật** chính app của bạn.
- **Insecure storage:** `strings app | grep -i "api_key\|secret\|password"`.

> [!WARNING]
> Toàn bộ mục trên là **LÝ THUYẾT** giáo trình CEH. Không repackage/hack app của người khác. Chỉ thực hành trên app của CHÍNH BẠN trong môi trường lab.

### 4. Phòng Thủ Mobile

- **MDM (Mobile Device Management)** + **containerization** cho BYOD (tách work profile).
- **Không sideload app lạ**; chỉ cài từ store chính thức.
- **Kiểm tra permission:** cấp tối thiểu, xoá app không rõ nguồn.
- **Mã hoá thiết bị** (full disk encryption), màn hình khoá mạnh.
- **Cập nhật OS/app định kỳ** (vá lỗ hổng).
- **Remote wipe** sẵn sàng khi mất máy.
- **App của bạn:** không lưu secret trong app, dùng **secure keystore** (Android Keystore / iOS Keychain), TLS bắt buộc, **certificate pinning**.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Các lab tuần này **CHỈ kiểm tra app/code của CHÍNH BẠN** trên thiết bị của bạn.
> 2. Không root/jailbreak/giải mã app người khác. Repackaging app người khác để cài mã độc là **tội phạm mạng**.
> 3. Lab 1 và Lab 2 **không cần jailbreak, không kết nối mạng** — chỉ đọc file text bạn tự đưa vào.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week17_mobile_scanner.py`. Tool làm **2 việc phòng thủ**:
> - Quét **mã nguồn app (file .java/.kt/.swift/.js/...)** tìm **API key / secret / token bị lộ** (insecure storage — vector tấn công CEH).
> - In **checklist cấu hình an toàn thiết bị Android/iOS** cho audit.

### Lab 1: Quét secret bị lộ trong mã nguồn app (Python)

Tạo file mẫu chứa secret rồi quét:

```bash
mkdir -p /tmp/appscan && cat > /tmp/appscan/Config.kt <<'EOF'
package com.myapp
val API_KEY = "AIzaSyBzBzBzBzBzBzBzBzBzBzBzBzBz"
val dbPass = "SuperSecret123"
EOF
python3 CODE/week17_mobile_scanner.py --scan /tmp/appscan --format kt
python3 CODE/week17_mobile_scanner.py --checklist
```

Kết quả mẫu:

```
[SCAN]  /tmp/appscan/Config.kt
   line 3: phát hiện DẤU HIỆU API key (API_KEY) — cần chuyển sang keystore/server
   line 4: phát hiện DẤU HIỆU password (dbPass)
[KẾT LUẬN] 2 dấu hiệu secret lộ trong source — rủi ro cao nếu app bị reverse.
```

> **Giải thích CEH:** chính vì app bị **reverse engineer** dễ dàng, mọi secret nhúng trong source đều có thể bị trích xuất (như kỹ thuật `strings`). Vì vậy CEH khuyên **không nhúng secret trong app** — dùng keystore + server-side.

### Lab 2: Checklist audit thiết bị

```bash
python3 CODE/week17_mobile_scanner.py --checklist
```

Kết quả mẫu:

```
===== MOBILE SECURITY CHECKLIST (BLUE TEAM) =====
 [ ] Thiết bị KHÔNG root/jailbreak (nếu không cần)
 [ ] Mã hoá thiết bị bật + màn hình khoá mạnh
 [ ] Chỉ cài app từ store chính thức
 [ ] Permission cấp tối thiểu cho từng app
 [ ] OS + app đã cập nhật đầy đủ
 [ ] Không lưu API key/password trong mã nguồn app
 [ ] (Doanh nghiệp) MDM + containerization cho BYOD
===== TỰ ĐÁNH GIÁ =====
```

---

## Bài Tập Về Nhà / Homework

1. **Scanner:** tạo 2 file giả (1 có secret, 1 sạch), chạy `--scan`, nộp kết quả + giải thích rủi ro insecure storage.
2. **Bảng so sánh:** Android vs iOS theo 5 tiêu chí (sideload, sandbox, permission, phân mảnh, cập nhật).
3. **Vector tấn công:** chọn 3 vector (malicious app, repackaging, MITM, SMiShing, insecure storage, backup extraction) — giải thích + phòng thủ.
4. **Audit thiết bị của bạn:** chạy checklist, viết 3 hành động cải thiện (VD: gỡ app lạ, bật mã hoá, cập nhật OS).

---

## Rubric Đánh Giá Tuần 17

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Scanner secret** | 2 file + giải thích rủi ro (40đ) | 1 file, thiếu giải thích (25đ) | Không chạy (10đ) |
| **So sánh Android/iOS** | Đủ 5 tiêu chí đúng (30đ) | 3-4 tiêu chí (20đ) | Sai khái niệm (5đ) |
| **3 vector + audit** | Giải thích + 3 hành động (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 17

- [ ] So sánh Android vs iOS về mô hình bảo mật
- [ ] Liệt kê 6+ vector tấn công mobile
- [ ] Giải thích repackaging, backup extraction, insecure storage (lý thuyết)
- [ ] Chạy thành công `week17_mobile_scanner.py --scan` và `--checklist`
- [ ] Nêu 6 countermeasures (MDM, no sideload, mã hoá, update, remote wipe, keystore)
