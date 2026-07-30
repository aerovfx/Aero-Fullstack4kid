# HƯỚNG DẪN GEOGEBRA CHO GIÁO VIÊN
## Toán 5 - Kết nối tri thức

---

## TỔNG QUAN VỀ GEOGEBRA

### GeoGebra là gì?
GeoGebra là phần mềm miễn phí, hỗ trợ dạy học hình học, đại số, thống kê. Đặc biệt phù hợp cho Toán 5 với các tính năng:
- Vẽ hình học chính xác
- Mô phỏng trực quan
- Đo đạc tự động
- Dễ sử dụng

### Truy cập
| Nền tảng | Link |
|----------|------|
| **Online** | https://www.geogebra.org/geometry |
| **iOS** | App Store: GeoGebra Geometry |
| **Android** | Google Play: GeoGebra Geometry |

### Giao diện chính
```
┌─────────────────────────────────────┐
│  [Thanh công cụ]                   │
│  ┌─────────────────────────────┐   │
│  │                             │   │
│  │     Vùng vẽ hình học       │   │
│  │                             │   │
│  └─────────────────────────────┘   │
│  [Thanh lệnh]                      │
│  [Cửa sổ phụ]                      │
└─────────────────────────────────────┘
```

---

## LỆNH COBAN CHO GIÁO VIÊN

### 1. LỆNH VẼ HÌNH PHẲNG

#### Vẽ điểm
```
Lệnh: Point((x, y))
Ví dụ: Point((0, 0)) → Điểm A tại gốc tọa độ
```

#### Vẽ đoạn thẳng
```
Lệnh: Segment(Point1, Point2)
Ví dụ: Segment((0,0), (5,0)) → Đoạn thẳng AB dài 5cm
```

#### Vẽ đường thẳng
```
Lệnh: Line(Point1, Point2)
Ví dụ: Line((0,0), (1,1)) → Đường thẳng đi qua O và (1,1)
```

#### Vẽ hình tròn
```
Lệnh: Circle(Center, Radius)
Ví dụ: Circle((0,0), 3) → Hình tròn tâm O, bán kính 3
```

---

### 2. LỆNH VẼ HÌNH HỌC

#### Vẽ tam giác
```
Lệnh: Polygon(Point1, Point2, Point3)
Ví dụ: Polygon((0,0), (4,0), (2,3)) → Tam giác ABC
```

#### Vẽ tứ giác
```
Lệnh: Polygon(Point1, Point2, Point3, Point4)
Ví dụ: Polygon((0,0), (4,0), (4,3), (0,3)) → Hình chữ nhật
```

#### Vẽ hình tròn (chi tiết hơn)
```
Lệnh: Circle(Center, PointOnCircle)
Ví dụ: Circle((0,0), (3,0)) → Tròn tâm O, đi qua A(3,0)
```

---

### 3. LỆNH ĐO

#### Đo khoảng cách
```
Lệnh: Distance(Point1, Point2)
Ví dụ: Distance(A, B) → Đo AB
```

#### Đo góc
```
Lệnh: Angle(Point1, Point2, Point3)
Ví dụ: Angle(A, B, C) → Đo góc ABC
```

#### Đo diện tích
```
Lệnh: Area(Polygon)
Ví dụ: Area(Polygon(A,B,C)) → Diện tích tam giác ABC
```

#### Đo chu vi
```
Lệnh: Perimeter(Polygon)
Ví dụ: Perimeter(Polygon(A,B,C)) → Chu vi tam giác ABC
```

---

### 4. LỆNH TẠO HÌNH

#### Tạo hình bán nguyệt
```
Lệnh: CircularSector(Center, Radius, StartAngle, EndAngle)
Ví dụ: CircularSector((0,0), 3, 0, 90) → Hình bán nguyệt 90°
```

#### Tạo đường cung
```
Lệnh: CircularArc(Center, Radius, StartAngle, EndAngle)
Ví dụ: CircularArc((0,0), 3, 0, 180) → Cung tròn 180°
```

---

## BÀI THỰC HÀNH CHO TỪNG CHƯƠNG

### CHƯƠNG 1: SỐ HỌC

#### Bài 1: Mô phỏng phân số bằng hình tròn
**Mục đích:** Hiểu phân số trực quan

**Các bước:**
```
Bước 1: Vẽ hình tròn
Lệnh: Circle((0,0), 3)

Bước 2: Chia hình tròn thành 4 phần
Lệnh: CircularSector((0,0), 3, 0, 90)
Lệnh: CircularSector((0,0), 3, 90, 180)
Lệnh: CircularSector((0,0), 3, 180, 270)
Lệnh: CircularSector((0,0), 3, 270, 360)

Bước 3: Tô màu phần 1/4
- Click vào phần cần tô
- Chọn Color → Chọn màu

Bước 4: Đo diện tích
Lệnh: Area(CircularSector((0,0), 3, 0, 90))
```

---

#### Bài 2: Mô phỏng phân số bằng hình chữ nhật
**Các bước:**
```
Bước 1: Vẽ hình chữ nhật
Lệnh: Polygon((0,0), (6,0), (6,4), (0,4))

Bước 2: Chia thành 6 phần bằng nhau
Lệnh: Segment((1,0), (1,4))
Lệnh: Segment((2,0), (2,4))
Lệnh: Segment((3,0), (3,4))
Lệnh: Segment((4,0), (4,4))
Lệnh: Segment((5,0), (5,4))

Bước 3: Tô màu 3 phần = 3/6 = 1/2
```

---

### CHƯƠNG 2: PHÉP TÍNH

#### Bài 3: Mô phỏng cộng phân số
**Mục đích:** Hiểu phép cộng phân số

**Các bước:**
```
Bước 1: Vẽ 2 hình tròn
Lệnh: Circle((0,0), 2)
Lệnh: Circle((5,0), 2)

Bước 2: Mô phỏng 1/2
Lệnh: CircularSector((0,0), 2, 0, 180)

Bước 3: Mô phỏng 1/3
Lệnh: CircularSector((5,0), 2, 0, 120)

Bước 4: Tính tổng = 5/6
- Vẽ hình tròn thứ 3
- Mô phỏng 5/6: CircularSector((10,0), 2, 0, 300)
```

---

### CHƯƠNG 4: HÌNH HỌC

#### Bài 4: Vẽ và khám phá tam giác đều
**Các bước:**
```
Bước 1: Vẽ đoạn thẳng AB = 5cm
Lệnh: Segment((0,0), (5,0))

Bước 2: Từ A, vẽ cung tròn bán kính 5cm
Lệnh: CircularArc((0,0), 5, 0, 360)

Bước 3: Từ B, vẽ cung tròn bán kính 5cm
Lệnh: CircularArc((5,0), 5, 0, 360)

Bước 4: Giao điểm C
- Click vào giao điểm 2 cung tròn

Bước 5: Vẽ tam giác
Lệnh: Polygon(A, B, C)

Bước 6: Kiểm tra
- Đo các cạnh: Distance(A,B), Distance(B,C), Distance(C,A)
- Đo các góc: Angle(A,B,C), Angle(B,C,A), Angle(C,A,B)
```

---

#### Bài 5: Khám phá tam giác vuông
**Các bước:**
```
Bước 1: Vẽ đoạn thẳng AB = 4cm
Lệnh: Segment((0,0), (4,0))

Bước 2: Từ B, kẻ góc vuông
Lệnh: Line((4,0), (4,3))

Bước 3: Lấy BC = 3cm trên tia góc vuông
Lệnh: Point((4,3))

Bước 4: Vẽ tam giác
Lệnh: Polygon(A, B, C)

Bước 5: Kiểm tra
- Đo góc: Angle(A,B,C) → Phải = 90°
- Áp dụng định lý Pitago: AB² + BC² = AC²
```

---

#### Bài 6: Khám phá hình bình hành
**Các bước:**
```
Bước 1: Vẽ 2 cạnh đối song song
Lệnh: Segment((0,0), (5,0))
Lệnh: Segment((2,3), (7,3))

Bước 2: Nối các đỉnh
Lệnh: Segment((0,0), (2,3))
Lệnh: Segment((5,0), (7,3))

Bước 3: Kiểm tra
- Đo 2 cặp cạnh đối: Distance(A,B) vs Distance(C,D)
- Đo 2 cặp cạnh đối: Distance(A,C) vs Distance(B,D)
```

---

#### Bài 7: Khám phá hình tròn
**Các bước:**
```
Bước 1: Vẽ hình tròn
Lệnh: Circle((0,0), 3)

Bước 2: Vẽ tâm
Lệnh: Point((0,0))

Bước 3: Vẽ bán kính
Lệnh: Segment((0,0), (3,0))

Bước 4: Vẽ đường kính
Lệnh: Segment((-3,0), (3,0))

Bước 5: Đo
- Bán kính: Distance(O, A) = 3
- Đường kính: Distance(B, C) = 6
- Kiểm tra: d = 2r
```

---

## MẸO DÙNG GEOGEBRA HIỆU QUẢ

### 1. Tạo bài giảng trực tiếp
- Mở GeoGebra trên máy chiếu
- Vẽ hình realtime khi giảng
- Học sinh theo dõi và ghi chép

### 2. Tạo bài tập cho học sinh
- Tạo file GeoGebra mẫu
- Chia sẻ link cho học sinh
- Yêu cầu học sinh thực hành

### 3. Lưu và chia sẻ
```
Lưu file: File → Save
Xuất hình ảnh: File → Export → Graphics
Chia sẻ: File → Share → Copy link
```

### 4. Sử dụng trên thiết bị di động
- Tải app GeoGebra Geometry
- Học sinh có thể thực hành trên điện thoại
- Phù hợp bài tập về nhà

---

## BÀI TẬP THỰC HÀNH CHO HỌC SINH

### Mức độ cơ bản
1. Vẽ tam giác đều cạnh 4cm
2. Vẽ hình vuông cạnh 3cm
3. Vẽ hình tròn bán kính 2cm
4. Đo diện tích tam giác đã vẽ

### Mức độ trung bình
1. Vẽ tam giác cân có đáy 6cm, chiều cao 4cm
2. Vẽ hình thang có đáy 5cm, 3cm, chiều cao 3cm
3. Vẽ 2 hình tròn tiếp tuyến ngoài
4. Tính chu vi, diện tích các hình đã vẽ

### Mức độ nâng cao
1. Vẽ tam giác có 3 góc bằng nhau
2. Vẽ hình lục giác đều
3. Vẽ hình tròn nội tiếp tam giác
4. Khám phá quan hệ giữa bán kính và diện tích

---

## XỬ LÝ LỖI THƯỜNG GẶP

| Lỗi | Nguyên nhân | Cách khắc phục |
|------|-------------|----------------|
| Không vẽ được hình | Sai cú pháp lệnh | Kiểm tra lại lệnh |
| Hình bị méo | Tọa độ không chính xác | Nhập tọa độ đúng |
| Không đo được | Chưa chọn đúng đối tượng | Click đúng điểm/hình |
| File không lưu được | Mất kết nối mạng | Kiểm tra mạng |

---

## TÀI LIỆU THAM KHẢO

| Nguồn | Link |
|-------|------|
| Hướng dẫn GeoGebra | https://www.geogebra.org/doc |
| Video hướng dẫn | YouTube: GeoGebra Vietnam |
| Bài tập mẫu | geogebra.org/materials |

---

**Lưu ý:** Giáo viên nên thực hành GeoGebra trước khi dạy để thành thạo các lệnh cơ bản.
