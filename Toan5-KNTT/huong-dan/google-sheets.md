# HƯỚNG DẪN GOOGLE SHEETS CHO GIÁO VIÊN
## Toán 5 - Kết nối tri thức

---

## TỔNG QUAN VỀ GOOGLE SHEETS

### Google Sheets là gì?
Google Sheets là phần mềm bảng tính trực tuyến miễn phí của Google. Đặc biệt phù hợp cho Toán 5:
- Tính toán tự động bằng công thức
- Tạo biểu đồ trực quan
- Làm việc nhóm realtime
- Lưu trữ đám mây

### Truy cập
| Nền tảng | Link |
|----------|------|
| **Online** | https://sheets.google.com |
| **iOS** | App Store: Google Sheets |
| **Android** | Google Play: Google Sheets |

### Đăng nhập
1. Truy cập https://sheets.google.com
2. Đăng nhập Google Account
3. Nhấn "+" để tạo spreadsheet mới

---

## GIAO DIỆN CHÍNH

```
┌─────────────────────────────────────┐
│  File  Edit  View  Insert  Format  │
├─────────────────────────────────────┤
│  A1 │ B1 │ C1 │ D1 │ E1 │ ...    │
├─────────────────────────────────────┤
│  A2 │ B2 │ C2 │ D2 │ E2 │ ...    │
├─────────────────────────────────────┤
│  A3 │ B3 │ C3 │ D3 │ E3 │ ...    │
│     │    │    │    │    │          │
└─────────────────────────────────────┘
```

---

## CÔNG THỨC COBAN

### 1. CÔNG THỨC TOÁN HỌC

#### Cộng, trừ, nhân, chia
```
=B2+C2         (Cộng)
=B2-C2         (Trừ)
=B2*C2         (Nhân)
=B2/C2         (Chia)
```

#### Lũy thừa
```
=B2^2          (Bình phương)
=B2^3          (Lũy thừa 3)
```

#### Căn bậc hai
```
=SQRT(B2)      (Căn bậc hai)
```

#### Giá trị tuyệt đối
```
=ABS(B2)       (Giá trị tuyệt đối)
```

---

### 2. CÔNG THỨC THỐNG KÊ

#### Tổng
```
=SUM(B2:B10)         (Tổng từ B2 đến B10)
=SUM(B2:B10,C2:C10)  (Tổng nhiều cột)
```

#### Trung bình
```
=AVERAGE(B2:B10)     (Trung bình cộng)
```

#### Số lớn nhất, nhỏ nhất
```
=MAX(B2:B10)         (Lớn nhất)
=MIN(B2:B10)         (Nhỏ nhất)
```

#### Đếm
```
=COUNT(B2:B10)       (Đếm số ô có số)
=COUNTA(B2:B10)      (Đếm ô có dữ liệu)
=COUNTIF(B2:B10,">5") (Đếm theo điều kiện)
```

---

### 3. CÔNG THỨC ĐIỀU KIỆN

#### IF - Nếu thì
```
=IF(B2>=8,"Giỏi",IF(B2>=6,"Khá","Yếu"))

Giải thích:
- Nếu B2 >= 8 → "Giỏi"
- Nếu không, B2 >= 6 → "Khá"
- Nếu không → "Yếu"
```

#### AND - Và
```
=AND(B2>5,C2>5)   (Đúng nếu cả 2 điều kiện đúng)
```

#### OR - Hoặc
```
=OR(B2>8,C2>8)    (Đúng nếu ít nhất 1 điều kiện đúng)
```

---

### 4. CÔNG THỨC VĂN BẢN

#### Nối văn bản
```
=A2&" "&B2        (Nối A2 và B2 với khoảng trắng)
```

#### Left, Right, Mid
```
=LEFT(A2,3)       (Lấy 3 ký tự đầu)
=RIGHT(A2,3)      (Lấy 3 ký tự cuối)
=MID(A2,2,3)      (Lấy 3 ký tự từ vị trí 2)
```

#### Find
```
=FIND("/",A2)     (Tìm vị trí ký tự "/")
```

---

### 5. CÔNG THỨC TÌM KIẾM

#### VLOOKUP - Tìm theo cột
```
=VLOOKUP(A2,D:E,2,FALSE)

Giải thích:
- A2: Giá trị cần tìm
- D:E: Phạm vi tìm kiếm
- 2: Lấy giá trị ở cột thứ 2
- FALSE: Tìm chính xác
```

---

## BÀI THỰC HÀNH CHO TỪNG CHƯƠNG

### CHƯƠNG 1: SỐ HỌC

#### Bài 1: Nhập liệu và tách chữ số
**Mục đích:** Luyện nhập liệu, sử dụng hàm văn bản

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D | E | F |
|----|-------|-------|-------|-------|-------|-------|
| 1 | Số | Chục nghìn | Nghìn | Trăm | Chục | Đơn |
| 2 | 45678 | | | | | |

Bước 2: Nhập công thức
B2: =LEFT(A2,1)         (Lấy chữ số hàng chục nghìn)
C2: =MID(A2,2,1)        (Lấy chữ số hàng nghìn)
D2: =MID(A2,3,1)        (Lấy chữ số hàng trăm)
E2: =MID(A2,4,1)        (Lấy chữ số hàng chục)
F2: =RIGHT(A2,1)        (Lấy chữ số hàng đơn vị)

Bước 3: Kéo xuống cho 10 dòng
```

---

#### Bài 2: Chuyển đổi phân số sang thập phân
**Mục đích:** Liên hệ phân số và thập phân

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D |
|----|----------|----------|----------|----------|
| 1 | Phân số | Tử | Mẫu | Thập phân |
| 2 | 1/2 | | | |

Bước 2: Tách tử, mẫu
B2: =LEFT(A2,FIND("/",A2)-1)           (Tách tử)
C2: =RIGHT(A2,LEN(A2)-FIND("/",A2))    (Tách mẫu)

Bước 3: Tính thập phân
D2: =B2/C2

Bước 4: Format ô D2 thành số thập phân
```

---

### CHƯƠNG 2: PHÉP TÍNH

#### Bài 3: Bảng cửu abroad
**Mục đích:** Luyện nhân

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D | E | ... | J |
|----|---|---|---|---|---|-----|---|
| 1 | × | 1 | 2 | 3 | 4 | ... | 10 |
| 2 | 1 | | | | | | |
| 3 | 2 | | | | | | |
| ... | | | | | | | |
| 11 | 10 | | | | | | |

Bước 2: Nhập công thức
B2: =$A2*B$1

Bước 3: Kéo xuống và sang phải cho toàn bộ bảng
```

---

#### Bài 4: Tính tiền mua hàng
**Mục đích:** Ứng dụng thực tế

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D |
|----|----------|----------|----------|----------|
| 1 | Mặt hàng | Số lượng | Đơn giá | Thành tiền |
| 2 | Kẹo | 5 | 2000 | |
| 3 | Bánh | 3 | 5000 | |
| 4 | Nước | 2 | 3000 | |
| 5 | TỔNG | | | |

Bước 2: Nhập công thức
D2: =B2*C2
D5: =SUM(D2:D4)

Bước 3: Format cột D thành tiền Việt
```

---

### CHƯƠNG 3: ĐO LƯỜNG

#### Bài 5: Chuyển đổi đơn vị độ dài
**Mục đích:** Quy đổi đơn vị

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D |
|----|----------|----------|----------|----------|
| 1 | Giá trị | Đơn vị gốc | Đơn vị đích | Kết quả |
| 2 | 3,5 | km | m | |
| 3 | 250 | cm | m | |
| 4 | 1500 | m | km | |

Bước 2: Nhập công thức
D2: =IF(B2="km",A2*1000,IF(B2="m",A2/1000,A2))

Giải thích:
- Nếu đơn vị gốc là km → nhân 1000
- Nếu đơn vị gốc là m → chia 1000
```

---

### CHƯƠNG 4: HÌNH HỌC

#### Bài 6: Tính diện tích, chu vi
**Mục đích:** Áp dụng công thức hình học

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D | E |
|----|----------|----------|----------|----------|----------|
| 1 | Hình | Dài | Rộng/Cạnh | Chu vi | Diện tích |
| 2 | Chữ nhật | 5 | 3 | | |
| 3 | Vuông | 4 | - | | |
| 4 | Tam giác | 6 | 4(h) | | |

Bước 2: Nhập công thức
D2: =2*(B2+C2)         (Chu vi chữ nhật)
E2: =B2*C2             (Diện tích chữ nhật)
D3: =4*B3              (Chu vi vuông)
E3: =B3^2              (Diện tích vuông)
E4: =(B4*C4)/2         (Diện tích tam giác)
```

---

### CHƯƠNG 5: TỶ LỆ, PHẦN TRĂM

#### Bài 7: Tính giảm giá
**Mục đích:** Ứng dụng phần trăm

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D | E |
|----|----------|----------|----------|----------|----------|
| 1 | Mặt hàng | Giá gốc | % giảm | Tiền giảm | Giá sau giảm |
| 2 | Áo | 200000 | 20% | | |
| 3 | Quần | 350000 | 15% | | |
| 4 | Giày | 500000 | 10% | | |

Bước 2: Nhập công thức
D2: =B2*C2
E2: =B2-D2

Bước 3: Format cột C thành phần trăm
- Chọn cột C
- Format → Number → Percent
```

---

#### Bài 8: Tính lãi suất
**Mục đích:** Ứng dụng thực tế

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C | D | E |
|----|----------|----------|----------|----------|----------|
| 1 | Tiền gửi | Lãi suất | Thời gian | Tiền lãi | Tổng tiền |
| 2 | 5000000 | 7% | 2 | | |

Bước 2: Nhập công thức
D2: =B2*C2*A2
E2: =B2+D2
```

---

### CHƯƠNG 6: THỐNG KÊ

#### Bài 9: Thống kê điểm
**Mục đích:** Phân tích dữ liệu

**Các bước:**
```
Bước 1: Tạo bảng
|    | A | B | C |
|----|----------|----------|----------|
| 1 | Học sinh | Điểm | Xếp loại |
| 2 | An | 8 | |
| 3 | Bình | 7 | |
| 4 | ... | | |

Bước 2: Nhập công thức
C2: =IF(B2>=8,"Giỏi",IF(B2>=6,"Khá","Yếu"))
A10: =AVERAGE(B2:B9)      (Điểm trung bình)
B10: =MAX(B2:B9)          (Điểm cao nhất)
B11: =MIN(B2:B9)          (Điểm thấp nhất)
```

---

#### Bài 10: Tạo biểu đồ
**Mục đích:** Trực quan hóa dữ liệu

**Các bước:**
```
Bước 1: Chuẩn bị dữ liệu
|    | A | B |
|----|----------|----------|
| 1 | Môn | Số HS yêu thích |
| 2 | Toán | 12 |
| 3 | Văn | 8 |
| 4 | Anh | 10 |
| 5 | Khoa học | 6 |

Bước 2: Tạo biểu đồ
- Chọn dữ liệu A1:B5
- Insert → Chart
- Chọn Column chart
- Thêm tiêu đề: "Môn yêu thích của lớp"

Bước 3: Tùy chỉnh
- Đổi màu: Click vào biểu đồ → Customize
- Thêm nhãn: Customize → Legend
```

---

## MẸO DÙNG GOOGLE SHEETS HIỆU QUẢ

### 1. Phím tắt thường dùng
| Phím tắt | Chức năng |
|----------|-----------|
| Ctrl + C | Copy |
| Ctrl + V | Paste |
| Ctrl + Z | Hoàn tác |
| Ctrl + B | In đậm |
| Ctrl + I | In nghiêng |
| F2 | Chỉnh sửa ô |
| Ctrl + Arrow | Di chuyển nhanh |

### 2. Format ô nhanh
```
Số: Format → Number
Tiền: Format → Number → Currency
Phần trăm: Format → Number → Percent
Ngày: Format → Number → Date
```

### 3. Tạo biểu đồ đẹp
- Chọn dữ liệu trước khi tạo biểu đồ
- Đặt tên biểu đồ rõ ràng
- Sử dụng màu sắc phù hợp
- Thêm nhãn trục

### 4. Làm việc nhóm
- Chia sẻ link cho giáo viên/khác
- Phân quyền: View hoặc Edit
- Theo dõi thay đổi: File → Version history

---

## XỬ LÝ LỖI THƯỜNG GẶP

| Lỗi | Nguyên nhân | Cách khắc phục |
|------|-------------|----------------|
| #VALUE! | Sai kiểu dữ liệu | Kiểm tra ô nhập |
| #REF! | Ô tham chiếu không tồn tại | Kiểm tra công thức |
| #N/A | Không tìm thấy giá trị | Kiểm tra dữ liệu nguồn |
| #DIV/0! | Chia cho 0 | Kiểm tra mẫu số |
| #NAME? | Lệnh không đúng | Kiểm tra tên hàm |

---

## TÀI LIỆU THAM KHẢO

| Nguồn | Link |
|-------|------|
| Hướng dẫn Google | support.google.com/docs |
| Template mẫu | sheets.google.com/templates |
| Hàm phổ biến | support.google.com/docs/answer/3093343 |

---

**Lưu ý:** Giáo viên nên tạo mẫu trước khi dạy để học sinh dễ làm theo.
