# Tuần 15: SQL Injection (CEH v13 Module 15)

> Module CEH v13 tương ứng: **15 — SQL Injection**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 15** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu **SQL Injection (SQLi)** là gì, vì sao nguy hiểm (đánh cắp dữ liệu DB, bypass auth, RCE trong vài trường hợp).
2. Phân biệt các loại SQLi: **in-band** (error-based, union-based), **blind** (boolean-based, time-based), **out-of-band**.
3. Nắm cú pháp khai thác cơ bản (theo LÝ THUYẾT phòng thủ): `' OR 1=1--`, `UNION SELECT`, `ORDER BY` để xác định số cột, `sleep()` time-based.
4. Hiểu vì sao **parameterized query / prepared statement** là phòng thủ gốc rễ; thêm **WAF, input validation, least privilege DB, ẩn error message**.
5. Xây dựng tool phòng thủ mô phỏng **SQL query sanitizer/validator** (Lab 1) và thực hành lab DVWA (Lab 3).

---

## Lý Thuyết / Theory

### 1. SQLi Là Gì?

> **CEH định nghĩa:** SQL injection là kỹ thuật chèn **mã SQL** vào câu query của ứng dụng thông qua input không được kiểm tra — khiến ứng dụng thực thi mã độc trên database.

```
Query gốc:      SELECT * FROM users WHERE user='[INPUT]' AND pass='[INPUT]'
Input xấu:      ' OR 1=1--
Query trở thành:SELECT * FROM users WHERE user='' OR 1=1--' AND pass=''
Kết quả:        WHERE luôn đúng → trả về TOÀN BỘ users (bypass login)
```

> [!WARNING]
> Mục này **CHỈ phân tích lý thuyết** trên query mẫu (không đụng DB thật). Khai thác SQLi trên hệ thống người khác là bất hợp pháp.

### 2. Các Loại SQLi

| Loại | Cách hoạt động | Đặc điểm |
|------|----------------|----------|
| **In-band error-based** | Dựa vào **thông báo lỗi** của DB để rò cấu trúc | Dễ khai thác nhất |
| **In-band union-based** | Dùng `UNION SELECT` để **gộp dữ liệu** vào kết quả trả về | Cần xác định số cột (`ORDER BY`) |
| **Blind boolean-based** | Không thấy kết quả; so sánh **đúng/sai** qua phản hồi trang | Chậm, từng ký tự |
| **Blind time-based** | Dùng `IF(...; SLEEP(n); ...)` — đoán qua **thời gian phản hồi** | Chậm nhất, khó phát hiện |
| **Out-of-band** | Query kích hoạt request ra ngoài (DNS/HTTP) | Phụ thuộc hàm DB hỗ trợ |

### 3. Kỹ Thuật Khai Thác Cơ Bản (LÝ THUYẾT)

| Kỹ thuật | Cú pháp | Mục đích |
|----------|---------|----------|
| Bypass login | `' OR 1=1--` | Bỏ qua điều kiện WHERE |
| Comment phần còn lại | `--`, `#`, `/* */` | Bỏ điều kiện sau |
| Xác định số cột | `' ORDER BY 5--` | Tăng dần đến khi lỗi |
| Gộp dữ liệu | `' UNION SELECT username, password FROM users--` | Đọc dữ liệu người khác |
| Time-based | `' IF(1=1,SLEEP(5),0)--` (MySQL) | Blind timing |
| Trích xuất DB version | `' UNION SELECT @@version,2--` (MySQL) | Footprinting DB |

**Vì sao tool ở Lab 1 chặn được:** phát hiện `'`, `OR 1=1`, `--`, `UNION SELECT`, `SLEEP(` — nhưng phòng thủ thật phải **không cho SQLi tồn tại** (parameterized query), vì signature chỉ bắt được pattern đã biết.

### 4. Phòng Thủ Tổng Hợp

- **Parameterized query / prepared statement:** input luôn là **dữ liệu**, không bao giờ là SQL (phòng thủ gốc rễ — Lab 2).
- **Input validation (whitelist):** chỉ nhận đúng định dạng (số, enum, regex).
- **Stored procedure** với tham số; tránh dynamic SQL nối chuỗi.
- **Least privilege DB:** tài khoản app chỉ có quyền tối thiểu (không `DROP`, không đọc bảng khác).
- **Ẩn lỗi:** tắt verbose database error, trang lỗi chung (chống error-based).
- **WAF + rate limit:** lớp phòng thủ thứ hai.
- **Web app firewall rule:** chặn `UNION SELECT`, `SLEEP(`, `' OR 1=1`.

### 5. Detection (Phát Hiện)

- Phát hiện pattern trong log (như Tuần 12): `' OR 1=1`, `UNION SELECT`, `SLEEP(`, `ORDER BY`, double-encode `%27`.
- Giám sát **DB error** xuất hiện trên trang (error-based) — sign của SQLi bị lộ.
- Anomaly: thời gian response bất thường (time-based), request có nhiều ký tự đặc biệt.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này là **PHÒNG THỦ**: tool kiểm tra chuỗi query bạn tự nhập, chạy trên **SQLite trong bộ nhớ** (không phải DB thật) — không tấn công DB của ai.
> 2. Thực hành khai thác SQLi **chỉ trên DVWA / Juice Shop / WebGoat** chạy localhost trong máy ảo của bạn.
> 3. Khai thác SQLi trên website người khác là **trọng tội** (Luật An ninh mạng 2018 VN).
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week15_sqli_defender.py`. Tool mô phỏng **query sanitizer + prepared statement** trên SQLite in-memory — an toàn 100%.

### Lab 1: SQL Query Defender — Phát hiện & chặn SQLi (Python)

Công cụ phòng thủ: kiểm tra chuỗi input, phát hiện pattern SQLi (error-based, union, boolean, time-based), rồi chạy **demo minh hoạ** vì sao **prepared statement** chặn được còn **string concatenation** thì không.

```bash
python3 CODE/week15_sqli_defender.py --demo
python3 CODE/week15_sqli_defender.py --input "admin' OR '1'='1"
python3 CODE/week15_sqli_defender.py --input "admin"
```

Kết quả mẫu (demo):

```
[INPUT]  admin' OR '1'='1
[CHECK]  [!] Phát hiện SQLi: OR '1'='1 — không cho đi tiếp (WAF layer)
[DEMO PREPARED]  SELECT * FROM users WHERE user=? → KHÔNG tìm thấy (an toàn)
[DEMO CONCAT]    SELECT ... WHERE user='admin' OR '1'='1' → trả về 3 row (LỖ HỔNG)
[KẾT LUẬN] Prepared statement biến input thành DỮ LIỆU, không phải SQL.
```

> **Giải thích CEH:** trong `--demo`, tool tự tạo 1 bảng `users` nhỏ **trong RAM**, chạy cả 2 cách để bạn THẤY kết quả khác nhau — an toàn vì không phải DB thật, không kết nối mạng.

### Lab 2: Code phòng thủ tham khảo

```python
import sqlite3

# NGUY HIỂM — nối chuỗi (dễ SQLi)
# cur.execute(f"SELECT * FROM users WHERE user='{username}'")

# AN TOÀN — parameterized query
conn = sqlite3.connect("app.db")
cur = conn.execute("SELECT * FROM users WHERE user = ? AND pass = ?",
                   (username, password))
```

### Lab 3: Thực hành lab (DVWA — localhost)

```bash
# Trong máy ảo Kali của bạn — chạy DVWA localhost:
#   docker run -d -p 80:80 vulnerables/web-dvwa
# Vào Security Level = Low → SQL Injection → thử input và QUAN SÁT kết quả.
# Sau đó bật Prepared Statement trong source để thấy LỖ HỔNG biến mất.
```

---

## Bài Tập Về Nhà / Homework

1. **Scanner:** chạy `week15_sqli_defender.py --demo`, chụp màn hình; giải thích kết quả của `--demo` (prepared vs concat).
2. **Phân loại SQLi:** cho ví dụ & cách khai thác của error-based, union-based, blind boolean, blind time-based (lý thuyết).
3. **Viết code an toàn:** lấy 1 query "xấu" (nối chuỗi) viết lại bằng prepared statement, kèm 2-3 dòng giải thích.
4. **Case study:** tìm hiểu 1 vụ SQLi nổi tiếng (VD: Heartland Payment Systems 2008) — nguyên nhân, thiệt hại, bài học.

---

## Rubric Đánh Giá Tuần 15

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Scanner + demo** | Chạy đúng, giải thích prepared vs concat (40đ) | Chạy được nhưng thiếu giải thích (25đ) | Không chạy được (10đ) |
| **Phân loại SQLi** | Đủ 4 loại + ví dụ đúng (30đ) | Thiếu 1-2 loại (20đ) | Sai khái niệm (5đ) |
| **Code an toàn + case** | Prepared đúng + phân tích case (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 15

- [ ] Giải thích SQLi và vì sao nguy hiểm (đánh cắp dữ liệu, bypass auth)
- [ ] Phân biệt error-based / union-based / blind boolean / blind time-based
- [ ] Hiểu cú pháp khai thác cơ bản: `' OR 1=1--`, `UNION SELECT`, `ORDER BY`, `SLEEP()`
- [ ] Giải thích vì sao prepared statement là phòng thủ gốc rễ
- [ ] Chạy thành công `week15_sqli_defender.py --demo`
- [ ] Nêu 5 countermeasures (parameterized, whitelist, least privilege, ẩn lỗi, WAF)
