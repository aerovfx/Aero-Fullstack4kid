# BÀI TẬP MẪU TÍCH HỢP AI
## Toán 5 - Kết nối tri thức với cuộc sống

---

## NGUYÊN TẮC SỬ DỤNG AI TRONG HỌC TẬP

### Quy tắc vàng
1. **AI là trợ lý, không thay thế tư duy** - Giải trước, kiểm tra với AI
2. **Luôn kiểm chứng đáp án** - AI có thể sai, cần kiểm tra
3. **Không chia sẻ thông tin cá nhân** - An toàn mạng trên hết
4. **Hiểu cách AI hoạt động** - AI dự đoán từ dữ liệu, không "hiểu" thực sự

### Cách đặt câu hỏi cho AI
| Loại | Câu hỏi mẫu | Mục đích |
|------|-------------|----------|
| **Giải thích** | "Giải thích từng bước: 1/2 + 1/3 = ?" | Hiểu cách giải |
| **Tạo bài** | "Tạo 5 bài tập phân số cho lớp 5" | Luyện tập thêm |
| **Kiểm tra** | "Kiểm tra: 25% của 200 = 50 đúng không?" | Xác minh đáp án |
| **Mô phỏng** | "GeoGebra, vẽ帮助我 tam giác đều" | Trực quan hóa |

---

## CHƯƠNG 1: BÀI TẬP SỐ HỌC

### Bài tập 1: AI tạo số ngẫu nhiên để luyện đọc

**Mục đích:** Luyện đọc, viết số đến 100.000

**Cách làm:**
1. Mở Google Sheets
2. Nhập công thức tạo số ngẫu nhiên:
```
=RANDBETWEEN(10000,99999)
```
3. Kéo xuống để tạo 10 số
4. Đọc và viết từng số

**Câu hỏi AI:** "Hãy tạo cho em 5 số từ 10.000 đến 99.999 để em luyện đọc"

**Lưu ý:** Kiểm tra xem AI có tạo đúng dải số không

---

### Bài tập 2: Mô phỏng phân số bằng GeoGebra

**Mục đích:** Hiểu phân số trực quan

**Cách làm:**
1. Mở GeoGebra Geometry
2. Vẽ hình tròn: `Circle((0,0), 1)`
3. Mô phỏng phân số:
   - 1/4: `CircularSector((0,0), 1, 0, 90)`
   - 1/3: `CircularSector((0,0), 1, 0, 120)`
   - 3/5: `CircularSector((0,0), 1, 0, 216)`
4. Tô màu phần đã chọn

**Câu hỏi AI:** "GeoGebra, hãy vẽ帮助 tôi phân số 3/4"

---

### Bài tập 3: Chuyển đổi phân số - thập phân bằng Sheets

**Mục đích:** Liên hệ phân số và thập phân

**Cách làm trên Google Sheets:**
```
|    | A | B | C | D |
|----|----------|----------|----------|----------|
| 1 | Phân số | Tử | Mẫu | Thập phân |
| 2 | 1/2 | 1 | 2 | =B2/C2 |
| 3 | 3/4 | 3 | 4 | =B3/C3 |
| 4 | 2/5 | 2 | 5 | =B4/C4 |
```

**Công thức:** `=B2/C2` để chuyển phân số sang thập phân

---

## CHƯƠNG 2: BÀI TẬP PHÉP TÍNH

### Bài tập 4: Game toán trên Scratch

**Mục đích:** Luyện cộng, trừ bằng Scratch

**Các bước:**
1. Mở Scratch: https://scratch.mit.edu
2. Tạo project mới
3. Nhập mã:
```
Khi nhấn cờ xanh
  Đặt [Điểm v] = (0)
  Lặp lại 10 lần
    Đặt [Số1 v] = (random(100 to 9999))
    Đặt [Số2 v] = (random(100 to 9999))
    Hỏi [(Số1) + (Số2) = ?] và chờ
    Nếu <đáp án> = <(Số1) + (Số2)> thì
      Nói [Đúng! +1 điểm] trong 1 giây
      Thay đổi [Điểm v] bằng (1)
    Else
      Nói [Sai rồi. Đáp án là ((Số1) + (Số2))] trong 2 giây
    Kết thúc nếu
  Kết thúc lặp
  Nói [Tổng điểm: (Điểm)]
```

---

### Bài tập 5: AI giải toán word problem

**Mục đích:** Giải bài toán thực tế

**Câu hỏi AI:** "Hãy giải thích từng bước: An có 45.678 đồng. An mua sách 12.345 đồng và bút 5.678 đồng. Hỏi An còn bao nhiêu tiền?"

**Kết quả AI:**
```
Bước 1: Tổng tiền mua = 12.345 + 5.678 = 18.023 đồng
Bước 2: Tiền còn lại = 45.678 - 18.023 = 27.655 đồng
Đáp số: 27.655 đồng
```

**Lưu ý:** Học sinh giải trước, rồi đối chiếu với AI

---

### Bài tập 6: Google Sheets tính tiền mua hàng

**Mục đích:** Luyện Sheets + thực tế

**Hướng dẫn:**
```
|    | A | B | C | D |
|----|----------|----------|----------|----------|
| 1 | Mặt hàng | Số lượng | Đơn giá | Thành tiền |
| 2 | Kẹo | 5 | 2000 | =B2*C2 |
| 3 | Bánh | 3 | 5000 | =B3*C3 |
| 4 | Nước | 2 | 3000 | =B4*C4 |
| 5 | TỔNG | | | =SUM(D2:D4) |
| 6 | Trả | | | 50000 |
| 7 | Thối | | | =D6-D5 |
```

---

## CHƯƠNG 3: BÀI TẬP ĐO LƯỜNG

### Bài tập 7: Ứng dụng đo trên điện thoại

**Mục đích:** Thực hành đo lường hiện đại

**Cách làm:**
1. Tải ứng dụng:
   - iOS: "Measure" (Apple)
   - Android: "AR Ruler" hoặc "Google Measure"
2. Đo thực tế:
   - Chiều dài bàn học
   - Chiều rộng lớp học
   - Chiều cao cửa sổ
3. Ghi kết quả, so sánh với thước thực

---

### Bài tập 8: Google Sheets chuyển đổi đơn vị

**Mục đích:** Luyện Sheets + quy đổi

**Hướng dẫn:**
```
|    | A | B | C | D |
|----|----------|----------|----------|----------|
| 1 | Giá trị | Đơn vị gốc | Đơn vị đích | Kết quả |
| 2 | 3,5 | km | m | =IF(B2="km",A2*1000,A2/1000) |
| 3 | 250 | cm | m | =IF(B3="cm",A3/100,A3*100) |
| 4 | 1500 | m | km | =IF(B4="m",A4/1000,A4*1000) |
```

---

### Bài tập 9: AI giải bài toán đo lường

**Câu hỏi AI:** "Một đường dài 3km500m. Em đi được 1km200m. Hỏi còn bao nhiêu mét nữa?"

**Kết quả AI:**
```
Bước 1: Đổi về m
- 3km500m = 3.500m
- 1km200m = 1.200m
Bước 2: Tính còn lại
- 3.500 - 1.200 = 2.300m
Đáp số: 2.300m
```

---

## CHƯƠNG 4: BÀI TẬP HÌNH HỌC

### Bài tập 10: GeoGebra khám phá tam giác

**Mục đích:** Nhận dạng, phân loại tam giác

**Các bước:**
1. Mở GeoGebra Geometry
2. Vẽ tam giác: `Polygon(A,B,C)`
3. Đo góc: `Angle(A,B,C)`
4. Phân loại:
   - Nếu α = β = γ = 60° → Tam giác đều
   - Nếu α = 90° → Tam giác vuông
   - Nếu có 2 góc bằng → Tam giác cân

---

### Bài tập 11: AI nhận dạng hình dạng

**Mục đích:** Ứng dụng AI trong nhận dạng

**Các bước:**
1. Chụp ảnh các hình trong lớp:
   - Bảng (hình chữ nhật)
   - Đồng hồ (hình tròn)
   - Mũi tên (hình tam giác)
2. Sử dụng Google Lens hoặc AI image recognition
3. AI sẽ nhận dạng và phân loại

**Câu hỏi AI:** "Hãy phân loại hình học trong ảnh này"

---

### Bài tập 12: Google Sheets tính diện tích

**Mục đích:** Luyện Sheets + công thức hình học

**Hướng dẫn:**
```
|    | A | B | C | D | E |
|----|----------|----------|----------|----------|----------|
| 1 | Hình | Thông số 1 | Thông số 2 | Chu vi | Diện tích |
| 2 | Chữ nhật | 5 | 3 | =2*(B2+C2) | =B2*C2 |
| 3 | Vuông | 4 | - | =4*B3 | =B3^2 |
| 4 | Tam giác | 6 | 4 (h) | - | =(B4*C4)/2 |
| 5 | Tròn | r=3 | - | =2*PI()*B5 | =PI()*B5^2 |
```

---

## CHƯƠNG 5: BÀI TẬP TỶ LỆ, PHẦN TRĂM

### Bài tập 13: Google Sheets tính giảm giá

**Mục đích:** Luyện Sheets + phần trăm

**Hướng dẫn:**
```
|    | A | B | C | D | E |
|----|----------|----------|----------|----------|----------|
| 1 | Mặt hàng | Giá gốc | % giảm | Tiền giảm | Giá sau giảm |
| 2 | Áo | 200000 | 20% | =B2*C2 | =B2-D2 |
| 3 | Quần | 350000 | 15% | =B3*C3 | =B3-D3 |
| 4 | Giày | 500000 | 10% | =B4*C4 | =B4-D4 |
```

**Tạo biểu đồ:**
1. Chọn cột A và E
2. Insert → Chart → Column chart
3. Thêm tiêu đề: "So sánh giá sau giảm"

---

### Bài tập 14: AI giải bài toán lãi suất

**Câu hỏi AI:** "Em gửi 5.000.000đ vào ngân hàng với lãi suất 7%/năm. Sau 3 năm, em nhận được bao nhiêu tiền? (Lãi suất đơn)"

**Kết quả AI:**
```
Công thức: Tiền lãi = Tiền gốc × Lãi suất × Thời gian

Bước 1: Tính tiền lãi mỗi năm
- 5.000.000 × 7/100 = 350.000đ/năm

Bước 2: Tính tiền lãi 3 năm
- 350.000 × 3 = 1.050.000đ

Bước 3: Tổng tiền nhận được
- 5.000.000 + 1.050.000 = 6.050.000đ

Đáp số: 6.050.000đ
```

---

### Bài tập 15: Dự báo thị trường

**Mục đích:** Ứng dụng AI phân tích

**Các bước:**
1. Thu thập dữ liệu giá 1 sản phẩm qua 6 tháng
2. Nhập vào Google Sheets
3. Tạo biểu đồ đường
4. Sử dụng AI dự đoán:
   "Dựa trên dữ liệu giá 6 tháng qua, dự đoán xu hướng tháng tới"

---

## CHƯƠNG 6: BÀI TẬP THỐNG KÊ

### Bài tập 16: Google Forms khảo sát

**Mục đích:** Luyện thu thập dữ liệu

**Các bước:**
1. Truy cập: https://forms.google.com
2. Tạo form: "Khảo sát thời gian sử dụng điện thoại"
3. Các câu hỏi:
   - Bạn dùng điện thoại bao nhiêu giờ/ngày? (số)
   - Chủ yếu dùng làm gì? (trắc nghiệm:游戏, học, chat, khác)
   - Bạn nghĩ dùng nhiều có tốt không? (trắc nghiệm)
4. Chia sẻ cho 10 bạn
5. Xem kết quả trên Sheets

---

### Bài tập 17: AI phân tích dữ liệu

**Mục đích:** Ứng dụng AI phân tích

**Các bước:**
1. Thu thập dữ liệu survey
2. Nhập vào Sheets
3. Tạo biểu đồ
4. Sử dụng AI: "Phân tích dữ liệu survey này và đưa ra nhận xét"

**Câu hỏi AI mẫu:** "Dựa trên dữ liệu khảo sát 10 học sinh, phân tích xu hướng sử dụng điện thoại và đưa ra gợi ý"

---

### Bài tập 18: Dự đoán bằng AI

**Mục đích:** Ứng dụng AI dự đoán

**Các bước:**
1. Thu thập dữ liệu điểm 3 tháng
2. Nhập vào Sheets
3. Tạo biểu đồ đường
4. AI dự đoán:
   "Dựa trên dữ liệu điểm 3 tháng, dự đoán điểm tháng tới"

---

## BÀI TẬP TỔNG HỢP CUỐI KỲA

### Dự án: "Ứng dụng AI vào cuộc sống hàng ngày"

**Đề tài:** Phân tích thời gian sử dụng điện thoại của lớp

**Các bước thực hiện:**

#### Bước 1: Thu thập dữ liệu (Google Forms)
```
Câu hỏi:
1. Bạn dùng điện thoại bao nhiêu giờ/ngày?
2. Chủ yếu dùng làm gì?
3. Bạn có thấy ảnh hưởng đến học tập không?
4. Bạn muốn giảm thời gian dùng điện thoại không?
```

#### Bước 2: Nhập liệu và xử lý (Google Sheets)
- Nhập dữ liệu từ Forms
- Tính % mỗi mục
- Tính trung bình giờ dùng

#### Bước 3: Trực quan hóa (Biểu đồ)
- Biểu đồ cột: So sánh giờ dùng
- Biểu đồ tròn: Tỷ lệ mục đích sử dụng
- Biểu đồ đường: Xu hướng qua các tuần

#### Bước 4: Sử dụng AI phân tích
**Câu hỏi AI:** "Phân tích dữ liệu khảo sát sử dụng điện thoại của 30 học sinh lớp 5. Đưa ra nhận xét và gợi ý"

#### Bước 5: Trình bày
- Tạo PowerPoint hoặc Google Slides
- Trình bày trước lớp (5 phút/nhóm)
- Thảo luận

---

## HƯỚNG DẪN SỬ DỤNG AI CHO GIÁO VIÊN

### Lựa chọn công cụ AI phù hợp

| Công cụ | Mục đích | Độ tuổi | Lưu ý |
|---------|----------|---------|-------|
| **ChatGPT** | Giải thích, tạo bài | Lớp 5 (có giám sát) | Không chia sẻ thông tin cá nhân |
| **GeoGebra** | Mô phỏng hình học | Phù hợp | An toàn |
| **Google Sheets** | Tính toán, biểu đồ | Phù hợp | An toàn |
| **Scratch** | Lập trình | Phù hợp | An toàn |

### Câu hỏi AI hay dùng

| Mục đích | Câu hỏi mẫu |
|----------|-------------|
| **Giải thích** | "Giải thích từng bước: ..." |
| **Tạo bài** | "Tạo 5 bài tập về ..." |
| **Kiểm tra** | "Kiểm tra: ... có đúng không?" |
| **Mô phỏng** | "GeoGebra, vẽ帮助 tôi ..." |
| **Phân tích** | "Phân tích dữ liệu này: ..." |

### An toàn khi dùng AI
1. **Giám sát** khi học sinh dùng AI
2. **Không chia sẻ** thông tin cá nhân
3. **Luôn kiểm tra** đáp án AI
4. **Giải trước**, rồi đối chiếu AI
5. **Hiểu cách** AI hoạt động (dự đoán từ dữ liệu)

---

## TẢI VÀ SỬ DỤNG

### Google Sheets
- Truy cập: https://sheets.google.com
- Đăng nhập Google account
- Tạo spreadsheet mới
- Sử dụng các công thức trong bài

### GeoGebra
- Truy cập: https://www.geogebra.org/geometry
- Không cần cài đặt
- Sử dụng lệnh để vẽ hình

### Scratch
- Truy cập: https://scratch.mit.edu
- Tạo tài khoản miễn phí
- Lập trình trực tuyến

### Google Forms
- Truy cập: https://forms.google.com
- Tạo form mới
- Chia sẻ link
- Kết quả tự động trên Sheets
