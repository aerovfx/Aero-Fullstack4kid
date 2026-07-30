# CHƯƠNG 1: SỐ HỌC
## Giáo án chi tiết - Toán 5 Kết nối tri thức

---

## MỤC TIÊU CHƯƠNG

### Kiến thức
- Đọc, viết số đến 100.000
- Phân số, số thập phân
- Phép tính với phân số, số thập phân

### Năng lực số
- Sử dụng Google Sheets nhập liệu số
- Mô phỏng phân số bằng GeoGebra
- AI hỗ trợ tạo bài tập

### Tư duy
- Phân tích, tổng hợp số liệu
- Suy luận logic từ phân số đến thập phân

---

## TIẾT 1: SỐ ĐẾN 100.000 (45 phút)

### I. MỤC ĐÍCH
- Học sinh đọc, viết số đến 100.000
- Hiểu vị trí các chữ số trong số đến 100.000
- Sử dụng Google Sheets để biểu diễn số

### II. CHUẨN BỊ
| Đồ dùng | Chi tiết |
|----------|----------|
| **Giáo viên** | Máy chiếu, Google Sheets mẫu, bảng |
| **Học sinh** | Vở, bút, máy tính bỏ túi |
| **Phần mềm** | Google Sheets (truy cập: sheets.google.com) |

### III. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 1: Khởi động (5 phút)**

**GV:** "Hôm nay chúng ta sẽ tìm hiểu về những con số rất lớn. Em nào biết số lớn nhất trong các số: 12.345, 67.890, 99.999?"

**Mục đích:** Thu hút sự chú ý, liên hệ thực tế

**Hoạt động AI:** Cho học sinh dự đoán "AI sẽ viết số nào?" - tạo sự tò mò

---

#### **Hoạt động 2: Trình bày kiến thức mới (15 phút)**

**Bước 1: Giới thiệu vị trí chữ số (7 phút)**

| Chữ số | Hàng đơn vị | Hàng chục | Hàng trăm | Hàng nghìn | Hàng chục nghìn |
|--------|-------------|-----------|-----------|------------|-----------------|
| Ví dụ: 45.678 | 8 | 7 | 6 | 5 | **4** |

**GV minh họa:** Viết số 45.678 trên bảng, chỉ từng vị trí

**Câu hỏi:** "Chữ số 6 trong số 45.678 ở hàng nào? Giá trị của nó là bao nhiêu?"

**Bước 2: Đọc và viết số (8 phút)**

| Số | Đọc | Viết |
|----|-----|------|
| 45.678 | Bốn mươi lăm nghìn sáu trăm bảy mươi tám | 45678 |
| 99.999 | Chín mươi chín nghìn chín trăm chín mươi chín | 99999 |

**Luyện tập:** Cho 5 số, học sinh đọc và viết

---

#### **Hoạt động 3: Thực hành với Google Sheets (15 phút)**

**Hướng dẫn giáo viên:** Mở Google Sheets, tạo bảng minh họa

```
|    | A | B | C | D | E | F |
|----|-----|-----|-----|-----|-----|-----|
| 1  | Số | Chục nghìn | Nghìn | Trăm | Chục | Đơn vị |
| 2  | 45678 | 4 | 5 | 6 | 7 | 8 |
| 3  | [HS nhập] | =LEFT(A3,1) | =MID(A3,2,1) | ... |
```

**Học sinh làm:**
1. Mở file Google Sheets giáo viên chia sẻ
2. Nhập 5 số bất kỳ vào cột A
3. Sử dụng hàm để tách từng chữ số
4. Kiểm tra kết quả

**Công thức hữu ích:**
- `=LEFT(A2,1)` - Lấy chữ số hàng chục nghìn
- `=MID(A2,2,1)` - Lấy chữ số hàng nghìn
- `=RIGHT(A2,1)` - Lấy chữ số hàng đơn vị

---

#### **Hoạt động 4: Bài tập củng cố (10 phút)**

**Bài 1:** Đọc các số sau:
- 23.456
- 67.890
- 12.304

**Bài 2:** Viết bằng số:
- Bốn mươi nghìn năm trăm sáu mươi bảy
- Chín mươi chín nghìn chín trăm chín mươi chín

**Bài 3 (Năng lực số):** Hoàn thành bảng Google Sheets

---

#### **Hoạt động 5: Kết thúc (5 phút)**

**GV tóm tắt:** "Hôm nay chúng ta đã học đọc, viết số đến 100.000 và sử dụng Google Sheets để tách các chữ số."

**Bài về:** Viết 10 số đến 100.000, đọc và xác định vị trí từng chữ số

---

## TIẾT 2: PHÂN SỐ CƠ BẢN (45 phút)

### I. MỤC ĐÍCH
- Nhận biết phân số, tử số, mẫu số
- Đọc, viết phân số
- Mô phỏng phân số bằng GeoGebra

### II. CHUẨN BỊ
| Đồ dùng | Chi tiết |
|----------|----------|
| **Giáo viên** | Máy chiếu, GeoGebra (geogebra.org/geometry) |
| **Học sinh** | Giấy kẻ ô, kéo, giấy màu |
| **Phần mềm** | GeoGebra Geometry |

### III. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 1: Khởi động (5 phút)**

**GV:** "Cô có 1 chiếc bánh, muốn chia cho 4 bạn. Mỗi bạn được bao nhiêu?"

**Hình minh họa:** Vẽ hình tròn, chia 4 phần đều

**Câu hỏi:** "Làm sao để viết kết quả bằng toán?"

---

#### **Hoạt động 2: Trình bày kiến thức mới (15 phút)**

**Bước 1: Giới thiệu phân số (8 phút)**

```
    Tử số (phần đã lấy)
    ───────────
    Mẫu số (tổng số phần)
```

| Phân số | Đọc | Ý nghĩa |
|---------|-----|----------|
| 1/4 | Một phần tư | Lấy 1 trong 4 phần |
| 3/4 | Ba phần tư | Lấy 3 trong 4 phần |
| 2/5 | Hai phần năm | Lấy 2 trong 5 phần |

**GV minh họa:** Cắt giấy hình tròn thành 4 phần, shading 1 phần = 1/4

**Bước 2: Phân loại phân số (7 phút)**

| Loại | Đặc điểm | Ví dụ |
|------|-----------|-------|
| Phân số đúng | Tử < Mẫu | 1/2, 3/4, 2/5 |
| Phân số hỗn hợp | Nguyên + Phân số | 1 1/2, 2 3/4 |
| Phân số giả | Tử ≥ Mẫu | 5/4, 7/3 |

---

#### **Hoạt động 3: Mô phỏng bằng GeoGebra (15 phút)**

**Hướng dẫn giáo viên:**
1. Mở GeoGebra Geometry: https://www.geogebra.org/geometry
2. Tạo hình tròn: Nhập `Circle((0,0), 1)`
3. Chia hình tròn: Nhập `CircularSector((0,0), 1, 0, 90)` (1/4 vòng)
4. Tô màu phần đã chọn

**Học sinh làm trên máy tính hoặc theo dõi GV:**

```
Bước 1: Vẽ hình tròn bán kính 1
Bước 2: Chia thành 4 phần bằng nhau (mỗi phần 90 độ)
Bước 3: Tô màu 1 phần → Đây là phân số 1/4
Bước 4: Thử với 2/3, 3/5...
```

**Câu hỏi:** "Làm sao để thể hiện phân số 3/4 trên GeoGebra?"

---

#### **Hoạt động 4: Bài tập củng cố (10 phút)**

**Bài 1:** Viết phân số mô tả:
- 1 trong 3 phần → ___
- 4 trong 5 phần → ___
- 2 trong 6 phần → ___

**Bài 2:** Đọc các phân số:
- 3/8
- 5/12
- 7/10

**Bài 3 (Tự làm):** Cắt giấy thành 8 phần đều, tô 3 phần → Viết phân số tương ứng

---

#### **Hoạt động 5: Kết thúc (5 phút)**

**GV:** "Phân số giúp chúng ta mô tả phần của một tổng thể. GeoGebra giúp trực quan hóa phân số."

**Bài về:** Tìm 5 ví dụ về phân số trong cuộc sống hàng ngày

---

## TIẾT 3: SỐ THẬP PHÂN (45 phút)

### I. MỤC ĐÍCH
- Nhận biết số thập phân, dấu phẩy thập phân
- Đọc, viết số thập phân
- Liên hệ giữa phân số và số thập phân

### II. CHUẨN BỊ
| Đồ dùng | Chi tiết |
|----------|----------|
| **Giáo viên** | Máy chiếu, thước kẻ, Google Sheets |
| **Học sinh** | Vở, thước kẻ có chia mm |
| **Phần mềm** | Google Sheets |

### III. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 1: Khởi động (5 phút)**

**GV:** "Em nào biết 1cm = ? mm? Vậy 1mm viết bằng số thập phân là bao nhiêu?"

**Hình minh họa:** Thước kẻ thực tế

---

#### **Hoạt động 2: Trình bày kiến thức mới (15 phút)**

**Bước 1: Giới thiệu số thập phân (8 phút)**

```
    Phần nguyên | Dấu phẩy | Phần thập phân
    5           ,         3
    (5 đơn vị)  |         (3 phần mười)
```

| Số thập phân | Đọc | Liên hệ |
|--------------|-----|---------|
| 5,3 | Năm phẩy ba | 5 + 3/10 |
| 2,75 | Hai phẩy bảy lăm | 2 + 75/100 |
| 0,5 | Không phẩy năm | 5/10 = 1/2 |

**Bước 2: Liên hệ phân số - thập phân (7 phút)**

| Phân số | Số thập phân | Giải thích |
|---------|--------------|------------|
| 1/2 | 0,5 | 1 ÷ 2 = 0,5 |
| 3/4 | 0,75 | 3 ÷ 4 = 0,75 |
| 2/5 | 0,4 | 2 ÷ 5 = 0,4 |
| 7/10 | 0,7 | 7 ÷ 10 = 0,7 |

**Công thức:** Phân số → Thập phân: Tử số ÷ Mẫu số

---

#### **Hoạt động 3: Thực hành Google Sheets (15 phút)**

**Hướng dẫn:** GV tạo mẫu, học sinh thực hành

```
|    | A | B | C |
|----|-------|---------|----------------|
| 1 | Phân số | Tử | Mẫu |
| 2 | 1/2 | 1 | 2 |
| 3 | =A2 | =B2 | =C2 | → Kết quả: 0,5 |
```

**Công thức:** `=B2/C2` để chuyển phân số sang thập phân

**Bài tập:**
1. Nhập 5 phân số vào bảng
2. Sử dụng hàm để chuyển sang thập phân
3. So sánh kết quả

---

#### **Hoạt động 4: Bài tập củng cố (10 phút)**

**Bài 1:** Chuyển sang số thập phân:
- 3/4 = ___
- 7/10 = ___
- 2/5 = ___

**Bài 2:** Viết bằng phân số:
- 0,6 = ___
- 0,25 = ___
- 1,5 = ___

**Bài 3:** Xác định đúng/sai:
- 0,3 = 3/10 ( )
- 5/4 = 1,25 ( )

---

#### **Hoạt động 5: Kết thúc (5 phút)**

**GV:** "Số thập phân giúp chúng ta biểu diễn chính xác các giá trị nhỏ. Hàm trong Google Sheets giúp chuyển đổi nhanh giữa phân số và thập phân."

**Bài về:** Liệt kê 5 số thập phân gặp trong đời sống

---

## TIẾT 4: PHÉP CỘNG PHÂN SỐ CÓ MẪU SỐ KHÁC NHAU (45 phút)

### I. MỤC ĐÍCH
- Cộng phân số có mẫu số khác nhau
- Rút gọn phân số sau khi cộng
- Sử dụng GeoGebra mô phỏng

### II. CHUẨN BỊ
| Đồ dùng | Chi tiết |
|----------|----------|
| **Giáo viên** | Máy chiếu, GeoGebra |
| **Học sinh** | Vở, giấy nháp |
| **Phần mềm** | GeoGebra |

### III. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 1: Khởi động (5 phút)**

**GV:** "Cô có 1/2 cái bánh và 1/3 cái bánh. Tổng là bao nhiêu? Có phải 2/5 không?"

**Mục đích:** Tạo mâu thuẫn nhận thức

---

#### **Hoạt động 2: Trình bày kiến thức mới (15 phút)**

**Bước 1: Tìm mẫu số chung (8 phút)**

| Phân số | Mẫu số chung (BCNN) | Phân số tương đương |
|---------|---------------------|---------------------|
| 1/2 và 1/3 | 6 | 3/6 và 2/6 |
| 2/3 và 1/4 | 12 | 8/12 và 3/12 |
| 3/5 và 2/7 | 35 | 21/35 và 10/35 |

**Cách tìm BCNN:**
- Liệt kê bội số của mỗi mẫu số
- Chọn bội số chung nhỏ nhất

**Bước 2: Cộng phân số (7 phút)**

```
Cộng phân số:
1. Tìm mẫu số chung (BCNN)
2. Đổi phân số tương đương
3. Cộng tử số
4. Giữ nguyên mẫu số
5. Rút gọn (nếu cần)
```

**Ví dụ:**
```
  1     1     3     2     3 + 2     5
 ─ + ─ = ─ + ─ = ─── = ─
  2     3     6     6       6       6
```

---

#### **Hoạt động 3: Mô phỏng GeoGebra (15 phút)**

**Hướng dẫn giáo viên:**
1. Vẽ hình tròn bán kính 1
2. Chia thành 6 phần đều (mỗi phần 60 độ)
3. Tô màu 3 phần (1/2) và 2 phần (1/3)
4. Đếm tổng: 5 phần → 5/6

**Học sinh thực hành:**
- Tạo hình vẽ trên GeoGebra
- Mô phỏng phép cộng 2/3 + 1/4
- Kiểm tra kết quả

---

#### **Hoạt động 4: Bài tập củng cố (10 phút)**

**Bài 1:** Tính:
- 1/3 + 1/6 = ___
- 2/5 + 1/10 = ___
- 3/4 + 1/2 = ___

**Bài 2:** Áp dụng:
- Em ăn 1/3 cái bánh, mẹ ăn 1/4 cái bánh. Hỏi cả hai ăn được bao nhiêu?

---

#### **Hoạt động 5: Kết thúc (5 phút)**

**GV:** "Khi cộng phân số có mẫu khác nhau, ta phải đưa về mẫu số chung trước. GeoGebra giúp hình dung phép cộng phân số."

---

## TIẾT 5: PHÉP TRỪ PHÂN SỐ (45 phút)

### I. MỤC ĐÍCH
- Trừ phân số có mẫu số giống và khác nhau
- Liên hệ thực tế

### II. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 1: Khởi động (5 phút)**
- "Em có 3/4 cái bánh, ăn 1/4 cái. Còn lại bao nhiêu?"

#### **Hoạt động 2: Trình bày (15 phút)**
- Trừ phân số cùng mẫu: Trừ tử số, giữ mẫu số
- Trừ phân số khác mẫu: Đổi mẫu chung, rồi trừ

**Ví dụ:**
```
  3     1     3 - 1     2     1
 ─ - ─ = ─── = ─ = ─
  4     4       4       2
```

#### **Hoạt động 3: Thực hành (15 phút)**
- GeoGebra mô phỏng phép trừ
- Google Sheets tính toán

#### **Hoạt động 4: Bài tập (10 phút)**
- Tính: 5/6 - 1/3, 7/8 - 3/4

#### **Hoạt động 5: Kết thúc (5 phút)**

---

## TIẾT 6: PHÉP NHÂN PHÂN SỐ (45 phút)

### I. MỤC ĐÍCH
- Nhân phân số với số tự nhiên
- Nhân phân số với phân số

### II. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 2: Trình bày (15 phút)**

**Nhân phân số:**
```
  a     c     a × c
 ─ × ─ = ─────
  b     d       b × d
```

**Ví dụ:**
```
  2     3     2 × 3     6     3
 ─ × ─ = ─── = ─ = ─
  5     4     5 × 4    20    10
```

**Nhân phân số với số tự nhiên:**
```
  2
 ─ × 3 = ?
  5

Cách: 3 × 2     6
    ───── = ─
        1     5
```

---

## TIẾT 7: PHÉP CHIA PHÂN SỐ (45 phút)

### I. MỤC ĐÍCH
- Chia phân số cho số tự nhiên
- Chia phân số cho phân số

### II. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Hoạt động 2: Trình bày (15 phút)**

**Nguyên tắc:** Chia = Nhân với nghịch đảo

```
  a     c     a     d     a × d
 ─ ÷ ─ = ─ × ─ = ─────
  b     d     b     c       b × c
```

**Ví dụ:**
```
  3     2     3     5     3 × 5    15
 ─ ÷ ─ = ─ × ─ = ─── = ─
  4     5     4     2     4 × 2     8
```

---

## TIẾT 8: PHÉP TÍNH VỚI SỐ THẬP PHÂN (45 phút)

### I. MỤC ĐÍCH
- Cộng, trừ số thập phân
- Nhân số thập phân
- Chia số thập phân

### II. CÁC HOẠT ĐỘNG DẠY HỌC

#### **Cộng, trừ thập phân (15 phút)**
- Căn chỉnh dấu phẩy
- Cộng/trừ từng hàng

**Ví dụ:**
```
  5,25
+ 3,7
------
  8,95
```

#### **Nhân thập phân (15 phút)**
- Nhân như số tự nhiên
- Đếm tổng số chữ số thập phân

**Ví dụ:**
```
  2,5
× 1,2
------
    50
  250
------
  3,00 = 3
```

#### **Chia thập phân (15 phút)**
- Nhân cả hai số với 10, 100... để bỏ dấu phẩy
- Rồi chia như bình thường

---

## TIẾT 9-14: ÔN TẬP VÀ KIỂM TRA CHƯƠNG 1

### Lịch ôn tập
| Tiết | Nội dung | Hoạt động |
|------|----------|-----------|
| 9-10 | Ôn số đến 100.000 | GeoGebra, Sheets |
| 11-12 | Ôn phân số, thập phân | AI tạo bài tập |
| 13 | Ôn phép tính phân số | Giải toán thực tế |
| 14 | Kiểm tra chương 1 | Trắc nghiệm + tự luận |

---

## BÀI TẬP TÍCH HỢP AI - CHƯƠNG 1

### Bài tập 1: AI tạo số ngẫu nhiên
**Mục đích:** Luyện đọc, viết số đến 100.000

**Hướng dẫn:**
1. Mở Google Sheets
2. Nhập công thức: `=RANDBETWEEN(10000,99999)`
3. Kéo xuống 10 ô để tạo 10 số ngẫu nhiên
4. Đọc và viết từng số

**Câu hỏi AI:** "Hãy tạo cho em 5 số đến 100.000 để em luyện đọc"

---

### Bài tập 2: Mô phỏng phân số bằng AI
**Mục đích:** Hiểu phân số trực quan

**Hướng dẫn:**
1. Mở GeoGebra
2. Nhập lệnh: `Circle((0,0),1)` - vẽ hình tròn
3. Nhập lệnh: `CircularSector((0,0),1,0,120)` - tạo 1/3 vòng tròn
4. Thay đổi góc để mô phỏng các phân số khác

**AI hỗ trợ:** "GeoGebra, hãy vẽ帮助我 mô phỏng phân số 3/5"

---

### Bài tập 3: Chuyển đổi bằng Google Sheets
**Mục đích:** Liên hệ phân số - thập phân

**Hướng dẫn:**
```
Cột A: Phân số (nhập dạng text: 1/2, 3/4...)
Cột B: Tử số = LEFT(A2,FIND("/",A2)-1)
Cột C: Mẫu số = RIGHT(A2,LEN(A2)-FIND("/",A2))
Cột D: Số thập phân = B2/C2
```

---

## GHI CHÚ CHO GIÁO VIÊN

### Điều chỉnh theo năng lực
| Nhóm | Điều chỉnh |
|------|------------|
| **Yếu** | Sử dụng hình ảnh trực quan nhiều hơn, bớt bài tập nâng cao |
| **Trung bình** | Đúng tiến độ chương trình |
| **Giỏi** | Thêm bài tập Olympic, tư duy sáng tạo |

### An toàn khi sử dụng AI
1. Giáo viên giám sát khi học sinh dùng AI
2. Không chia sẻ thông tin cá nhân
3. Luôn kiểm tra đáp án AI
4. Sử dụng AI có chọn lọc, đúng mục đích

### Đánh giá
- Đánh giá quá trình: 40%
- Kiểm tra miệng: 10%
- Kiểm tra viết: 50%
