# Tuần 9: Social Engineering (CEH v13 Module 09)

> Module CEH v13 tương ứng: **09 — Social Engineering**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 09** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu **Social Engineering (SE)** là gì, vì sao nó nguy hiểm hơn cả tấn công kỹ thuật (con người là mắt xích yếu nhất).
2. Phân biệt **human-based SE** vs **computer-based SE** và liệt kê các dạng: phishing, spear-phishing, whaling, vishing, smishing, baiting, quid pro quo, pretexting, tailgating, shoulder surfing, impersonation.
3. Nắm rõ các **bước SE attack lifecycle** và các kỹ thuật tâm lý bị lợi dụng (authority, urgency, social proof, scarcity, trust, greed).
4. Phân biệt phishing URL thật/giả bằng **phân tích tĩnh URL** (Lab 1) — kỹ năng phòng thủ thiết yếu.
5. Xây dựng **chương trình phòng thủ**: security awareness, chính sách, MFA, quy trình xác minh, báo cáo phishing, test định kỳ.

---

## Lý Thuyết / Theory

### 1. Social Engineering Là Gì?

> **CEH định nghĩa:** Social engineering là nghệ thuật **thao túng con người** để họ làm lộ thông tin bí mật hoặc thực hiện hành động có hại. Yếu tố quyết định là **tâm lý**, không phải kỹ thuật.

Vì sao nguy hiểm: hệ thống bảo mật mạnh đến đâu cũng bị vô hiệu nếu **người dùng** bị lừa nhập mật khẩu / nhấp link / cắm USB.

### 2. Phân Loại Kỹ Thuật SE

| Dạng | Mô tả | Ví dụ |
|------|-------|-------|
| **Phishing** | Email giả danh tổ chức uy tín để lừa nhấp link/cài malware | Email "Ngân hàng yêu cầu xác minh" |
| **Spear phishing** | Nhắm **cá nhân cụ thể** bằng thông tin riêng | Email có tên sếp, vụ việc thật của công ty |
| **Whaling** | Spear phishing nhắm **lãnh đạo** (CEO/CFO) | "CEO yêu cầu chuyển tiền gấp" (BEC) |
| **Vishing** | Lừa qua **điện thoại** | Gọi giả danh IT yêu cầu mật khẩu |
| **Smishing** | Lừa qua **SMS** | SMS "DHL cần phí thêm, bấm link" |
| **Baiting** | Đặt **mồi** (USB, phim, game) chứa malware | USB bỏ lại trước cổng công ty |
| **Quid pro quo** | Trao đổi "dịch vụ" để lấy thông tin | "IT hỗ trợ miễn phí" → đòi mật khẩu |
| **Pretexting** | Dàn dựng **kịch bản** để xin thông tin | Giả nhân viên bảo hiểm xin SSN |
| **Tailgating** | Đi theo người khác qua cửa an ninh | Theo chân nhân viên vào văn phòng |
| **Shoulder surfing** | Nhìn trộm khi nhập mật khẩu | Nhìn qua vai tại ATM, quán cà phê |
| **Impersonation** | Giả danh người có thẩm quyền | Giả sếp, giả kỹ thuật viên |

### 3. SE Attack Lifecycle

```
Research (thu thập thông tin nạn nhân — OSINT, Tuần 2)
    → Select Victim (chọn mục tiêu)
    → Relationship (tạo niềm tin / pretext)
    → Exploit (khai thác: lừa lộ thông tin / nhấp link)
```

### 4. Kỹ Thuật Tâm Lý Bị Lợi Dụng

| Nguyên tắc | Cách bị lợi dụng | Phòng thủ |
|------------|------------------|-----------|
| **Authority** | Giả danh sếp/IT/ngân hàng | Quy trình xác minh 2 kênh |
| **Urgency** | "Khẩn cấp, trong 10 phút" | Dừng lại, bình tĩnh kiểm tra |
| **Social proof** | "Nhiều người đã làm" | Hỏi lại người quản lý |
| **Scarcity** | "Chỉ còn 1 suất" | Không vội, kiểm tra nguồn |
| **Trust** | Dựng niềm tin qua thời gian | Không chia sẻ thông tin nhạy cảm |
| **Greed/Curiosity** | Trúng thưởng, nội dung giật tít | Không nhấp link lạ |

> [!NOTE]
> **MFA là lá chắn quan trọng:** kể cả khi bị lừa lộ mật khẩu, MFA vẫn chặn được đăng nhập — một trong những countermeasure được CEH nhấn mạnh nhất.

### 5. Phòng Thủ Chống SE

- **Security awareness training** định kỳ (diễn tập phishing nội bộ an toàn).
- **Chính sách:** không chia sẻ mật khẩu, quy trình xác minh danh tính qua 2 kênh (điện thoại + email), xử lý USB lạ.
- **MFA bắt buộc** cho tài khoản nhạy cảm; hạn chế quyền "người dùng thường" không thể cài phần mềm.
- **Báo cáo phishing:** nút "Report" trong email, quy trình IR nội bộ.
- **Vật lý:** keycard, turnstile, chính sách chống tailgating.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. **TUYỆT ĐỐI không** thực hành social engineering lên người thật (gửi email phishing giả, giả danh, vishing) ngoài phòng lab có ủy quyền. Đây là **hành vi phạm pháp** và gây tổn hại.
> 2. Lab tuần này là **phòng thủ**: phân tích URL để nhận diện phishing — chạy trên dữ liệu bạn tự nhập, **không gửi** URL đi đâu.
> 3. Không dùng kiến thức để "test" sếp/đồng nghiệp khi chưa có văn bản ủy quyền từ công ty.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week09_phishing_url_analyzer.py`. Tool **phân tích tĩnh URL** — không kết nối mạng, an toàn 100%.

### Lab 1: Phishing URL Analyzer — Nhận diện link lừa đảo (Python)

Công cụ phòng thủ: phân tích cú pháp URL để chỉ ra các đặc điểm phổ biến của phishing — host là **IP thuần** (thay vì domain), **punycode** (các ký tự Unicode trá hình), **nhiều dấu gạch ngang**, **subdomain dài** ("paypal.com.login.example.org"), **giao thức https trên port lạ**, chứa từ khoá nhạy cảm.

```bash
python3 CODE/week09_phishing_url_analyzer.py --demo

# Tự nhập URL cần kiểm tra (của bạn, hoặc url mẫu trong bài)
python3 CODE/week09_phishing_url_analyzer.py --url "http://paypal.com.login.example.org/verify"
```

Kết quả mẫu (chế độ demo):

```
URL        : https://192.168.1.5:8443/paypal-login/verify
[IP_HOST]  [!] host la dia chi IP (192.168.1.5) — domain that thuong la ten mien
[PORT]     [!] dung port 8443 (khong phai 443) — it gap o dich vu hop le
[KEYWORDS] [!] chua tu nhanh: 'paypal', 'login'
[DIEM NGUY CO] 3/6 -> NGHI NGỜ PHISHING
```

**Giải thích CEH:** kẻ tấn công dùng IP + port lạ để tránh blacklist và làm URL khó đọc; chèn tên thương hiệu vào **subdomain/path** để đánh lừa mắt người. Phân tích tĩnh này giúp bạn **không cần nhấp** đã biết nghi vấn.

### Lab 2: Kiểm tra chính sách awareness — Danh sách kiểm tra cho người dùng

```bash
# Mở file chứa các câu hỏi an toàn cho người dùng cuối
python3 CODE/week09_phishing_url_analyzer.py --quiz
```

Tool in bộ câu hỏi trắc nghiệm (nhận diện email phishing, chính sách xác minh, xử lý USB lạ) kèm đáp án — dùng làm tài liệu tập huấn.

---

## Bài Tập Về Nhà / Homework

1. **Phân tích URL:** dùng `week09_phishing_url_analyzer.py` phân tích 3 URL mẫu trong bài (1 trong `--demo`, 2 tự tạo kiểu phishing) và 2 URL thật bạn hay dùng. Ghi điểm nguy cơ + giải thích.
2. **Nghiên cứu vụ BEC:** tìm hiểu 1 vụ **Business Email Compromise** (giả CEO yêu cầu chuyển tiền) — mô tả kịch bản, số tiền thiệt hại, và 3 biện pháp phòng thủ.
3. **Viết chính sách ngắn:** soạn 1 trang chính sách "Quy trình xác minh danh tính khi nhận yêu cầu chuyển tiền / thay đổi thông tin" cho công ty nhỏ.

---

## Rubric Đánh Giá Tuần 9

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Phân tích URL** | Phân tích đủ 5 URL, giải thích đúng từng dấu hiệu (40đ) | Đủ 5 URL nhưng thiếu giải thích (25đ) | Không chạy tool / phân tích sai (10đ) |
| **Nghiên cứu BEC** | Mô tả đúng kịch bản, thiệt hại, 3 phòng thủ (30đ) | Thiếu 1 phần (20đ) | Chép lại không phân tích (5đ) |
| **Chính sách** | Đủ quy trình 2 kênh + phân quyền rõ ràng (30đ) | Có nhưng sơ sài (20đ) | Thiếu nội dung cốt lõi (5đ) |

---

## Checklist Đầu Ra Tuần 9

- [ ] Phân biệt human-based vs computer-based SE
- [ ] Liệt kê ít nhất 6 dạng SE (phishing, spear-phishing, whaling, vishing, smishing, baiting...)
- [ ] Nêu được 3 nguyên tắc tâm lý bị lợi dụng (authority, urgency, social proof)
- [ ] Giải thích vì sao MFA là lá chắn quan trọng
- [ ] Chạy thành công `week09_phishing_url_analyzer.py --demo`
- [ ] Viết được quy trình xác minh danh tính 2 kênh
