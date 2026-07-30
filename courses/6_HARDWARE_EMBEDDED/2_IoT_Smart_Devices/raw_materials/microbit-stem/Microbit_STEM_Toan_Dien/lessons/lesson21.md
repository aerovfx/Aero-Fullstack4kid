# Bài 21: Mảng (Array) – Danh Sách Điểm
# Lesson 21: Arrays – Score List

---

| Thông tin / Info | Chi tiết / Detail |
|---|---|
| **Bài số / Lesson** | 21 |
| **Cấp độ / Grade** | Lớp 6–9 / Grade 6–9 |
| **Thời lượng / Duration** | 90 phút / 90 minutes |
| **Chủ đề / Topic** | Cấu trúc dữ liệu: Mảng / Data Structures: Arrays |
| **Công cụ / Tools** | Micro:bit, MakeCode, MicroPython |
| **Giai đoạn / Phase** | Giai đoạn 3 – Tư duy Dữ liệu / Phase 3 – Data Thinking |

---

## 1. MỤC TIÊU / OBJECTIVES

Sau khi hoàn thành bài học này, học sinh có thể:  
After completing this lesson, students will be able to:

- 🎯 **Hiểu khái niệm mảng** – giải thích mảng là gì và tại sao chúng ta dùng mảng thay vì nhiều biến riêng lẻ.  
  **Understand the concept of an array** – explain what an array is and why we use arrays instead of many individual variables.

- 🎯 **Khai báo và khởi tạo mảng** trong MicroPython bằng cú pháp danh sách Python (`list`).  
  **Declare and initialize an array** in MicroPython using Python list syntax.

- 🎯 **Truy cập phần tử mảng** bằng chỉ số (index), hiểu chỉ số bắt đầu từ 0.  
  **Access array elements** using an index, understanding that indexes start at 0.

- 🎯 **Duyệt mảng với vòng lặp `for`** để xử lý từng phần tử.  
  **Iterate through an array with a `for` loop** to process each element.

- 🎯 **Thực hiện các phép toán trên mảng**: tính tổng, trung bình, tìm giá trị lớn nhất và nhỏ nhất.  
  **Perform operations on arrays**: calculate sum, average, find maximum and minimum values.

- 🎯 **Hiển thị kết quả lên LED Micro:bit** thông qua `display.scroll()` và điều khiển bằng nút bấm.  
  **Display results on the Micro:bit LED** using `display.scroll()` and control with buttons.

- 🎯 **Tư duy giải quyết vấn đề**: tổ chức dữ liệu điểm số của học sinh thành chương trình tính toán thực tế.  
  **Problem-solving thinking**: organize student score data into a practical computing program.

---

## 2. THIẾT BỊ CẦN THIẾT / REQUIRED COMPONENTS

| Thiết bị | Số lượng | Mô tả | Description |
|---|---|---|---|
| Micro:bit v1 hoặc v2 | 1 | Bo mạch lập trình chính | Main programming board |
| Cáp USB Micro | 1 | Kết nối với máy tính | Connect to computer |
| Máy tính / Laptop | 1 | Cài đặt MakeCode hoặc Mu Editor | Run MakeCode or Mu Editor |
| Pin AAA (tùy chọn) | 2 | Cấp nguồn khi chạy độc lập | Power supply for standalone use |
| Hộp pin (tùy chọn) | 1 | Giữ pin và kết nối Micro:bit | Battery holder connecting to Micro:bit |
| Bút và giấy | 1 bộ | Ghi chép lý thuyết và kết quả | Note-taking theory and results |

---

## 3. LÝ THUYẾT / THEORY

### 3.1 Mảng là gì? / What is an Array?

**Tiếng Việt:**  
Hãy tưởng tượng bạn là một giáo viên cần lưu điểm số của 5 học sinh. Nếu dùng biến thông thường, bạn cần viết:

```
diem1 = 85
diem2 = 92
diem3 = 78
diem4 = 96
diem5 = 88
```

Điều này rất bất tiện khi có 30 học sinh hay 100 học sinh! **Mảng** (Array) giải quyết vấn đề này bằng cách gom nhiều giá trị cùng kiểu dữ liệu vào **một biến duy nhất**.

**English:**  
Imagine you are a teacher who needs to store the scores of 5 students. Using regular variables, you would write:

```
score1 = 85
score2 = 92
score3 = 78
score4 = 96
score5 = 88
```

This becomes very inconvenient with 30 or 100 students! An **Array** solves this problem by grouping many values of the same data type into **a single variable**.

---

**Định nghĩa / Definition:**

> **Mảng** là một tập hợp có thứ tự các phần tử, được lưu trữ liên tiếp trong bộ nhớ và truy cập thông qua một chỉ số (index).  
> An **Array** is an ordered collection of elements, stored consecutively in memory and accessed through an index.

Trong Python và MicroPython, mảng thường được biểu diễn bằng kiểu **`list`** (danh sách):  
In Python and MicroPython, arrays are typically represented using the **`list`** type:

```python
# Cú pháp khai báo / Declaration syntax
ten_mang = [gia_tri_1, gia_tri_2, gia_tri_3, ...]

# Ví dụ / Example
scores = [85, 92, 78, 96, 88]
```

---

### 3.2 Chỉ số (Index) bắt đầu từ 0 / Zero-Based Indexing

**Tiếng Việt:**  
Mỗi phần tử trong mảng có một **chỉ số** (index) để xác định vị trí của nó. Điều quan trọng cần nhớ: **chỉ số bắt đầu từ 0, không phải 1!**

```
scores = [85, 92, 78, 96, 88]
           ↑   ↑   ↑   ↑   ↑
index:    [0] [1] [2] [3] [4]
```

**English:**  
Each element in an array has an **index** to identify its position. The key thing to remember: **indexes start at 0, not 1!**

```
scores = [85, 92, 78, 96, 88]
           ↑   ↑   ↑   ↑   ↑
index:    [0] [1] [2] [3] [4]
```

**Cách truy cập phần tử / How to access elements:**

```python
scores = [85, 92, 78, 96, 88]

print(scores[0])   # Kết quả / Result: 85  (phần tử đầu tiên / first element)
print(scores[1])   # Kết quả / Result: 92
print(scores[4])   # Kết quả / Result: 88  (phần tử cuối / last element)
print(scores[-1])  # Kết quả / Result: 88  (chỉ số âm = đếm từ cuối / negative index = from end)
```

**⚠️ Lỗi thường gặp / Common Mistake:**  
Nếu truy cập `scores[5]` khi mảng chỉ có 5 phần tử (index 0–4), chương trình sẽ báo lỗi `IndexError`.  
If you access `scores[5]` when the array only has 5 elements (index 0–4), the program will throw an `IndexError`.

---

### 3.3 Thuộc tính và Hàm cơ bản / Basic Properties and Functions

**Tiếng Việt:**  
Python cung cấp nhiều hàm và thuộc tính hữu ích để làm việc với mảng:

**English:**  
Python provides many useful functions and properties for working with arrays:

| Hàm / Function | Ví dụ / Example | Kết quả / Result | Mô tả / Description |
|---|---|---|---|
| `len()` | `len(scores)` | `5` | Số phần tử / Number of elements |
| `sum()` | `sum(scores)` | `439` | Tổng các phần tử / Sum of elements |
| `max()` | `max(scores)` | `96` | Giá trị lớn nhất / Maximum value |
| `min()` | `min(scores)` | `78` | Giá trị nhỏ nhất / Minimum value |
| `.append()` | `scores.append(75)` | Thêm 75 vào cuối / Adds 75 to end | Thêm phần tử / Add element |
| `.sort()` | `scores.sort()` | Sắp xếp tăng dần / Sorts ascending | Sắp xếp / Sort |

> **Lưu ý / Note:** MicroPython trên Micro:bit hỗ trợ hầu hết các hàm list của Python, nhưng một số hàm như `sorted()` có thể bị giới hạn về bộ nhớ. / MicroPython on Micro:bit supports most Python list functions, but some like `sorted()` may be limited by memory.

---

### 3.4 Duyệt Mảng với Vòng Lặp / Iterating Arrays with Loops

**Tiếng Việt:**  
Để xử lý từng phần tử trong mảng, chúng ta dùng vòng lặp `for`. Có hai cách phổ biến:

**English:**  
To process each element in an array, we use a `for` loop. There are two common approaches:

**Cách 1: Duyệt trực tiếp / Method 1: Direct Iteration**
```python
scores = [85, 92, 78, 96, 88]

for score in scores:
    print(score)  # In từng điểm / Print each score
```

**Cách 2: Duyệt theo chỉ số / Method 2: Index-based Iteration**
```python
scores = [85, 92, 78, 96, 88]

for i in range(len(scores)):
    print("Học sinh", i+1, ":", scores[i])
    # Student 1 : 85
    # Student 2 : 92  ... etc.
```

**So sánh / Comparison:**

| Tiêu chí / Criteria | Cách 1 / Method 1 | Cách 2 / Method 2 |
|---|---|---|
| Đơn giản / Simplicity | ✅ Đơn giản hơn / Simpler | ❌ Phức tạp hơn / More complex |
| Lấy chỉ số / Get index | ❌ Không trực tiếp / Not directly | ✅ Có chỉ số `i` / Has index `i` |
| Thay đổi phần tử / Modify element | ❌ Không thể / Cannot | ✅ `scores[i] = ...` |
| Dùng khi nào / When to use | Chỉ đọc giá trị / Read-only | Cần vị trí / Need position |

---

### 3.5 Các Phép Toán Trên Mảng / Array Operations

#### Tính Tổng / Calculate Sum

```python
scores = [85, 92, 78, 96, 88]
total = 0
for score in scores:
    total += score
# total = 85 + 92 + 78 + 96 + 88 = 439
```

#### Tính Trung Bình / Calculate Average

```python
average = total // len(scores)  # Dùng // để lấy phần nguyên / Use // for integer division
# average = 439 // 5 = 87
```

#### Tìm Giá Trị Lớn Nhất / Find Maximum Value

**Thuật toán / Algorithm:**
1. Giả sử phần tử đầu tiên là lớn nhất / Assume first element is the largest
2. Duyệt qua từng phần tử / Iterate through each element
3. Nếu tìm thấy phần tử lớn hơn → cập nhật / If a larger element is found → update

```python
max_score = scores[0]  # Giả sử phần tử đầu là lớn nhất / Assume first is max
for score in scores:
    if score > max_score:
        max_score = score
# max_score = 96
```

#### Tìm Giá Trị Nhỏ Nhất / Find Minimum Value

```python
min_score = scores[0]  # Giả sử phần tử đầu là nhỏ nhất / Assume first is min
for score in scores:
    if score < min_score:
        min_score = score
# min_score = 78
```

---

### 3.6 Ứng Dụng Thực Tế / Real-World Applications

**Tiếng Việt:**  
Mảng được sử dụng rộng rãi trong cuộc sống và công nghệ:

**English:**  
Arrays are widely used in everyday life and technology:

| Lĩnh vực / Domain | Ví dụ sử dụng mảng / Array Usage Example |
|---|---|
| 🎓 Giáo dục / Education | Lưu điểm số của cả lớp / Store scores for the entire class |
| 🌡️ Khoa học / Science | Lưu dữ liệu cảm biến nhiệt độ theo thời gian / Store temperature sensor data over time |
| 🎮 Trò chơi / Games | Lưu điểm cao của 10 người chơi tốt nhất / Store high scores of top 10 players |
| 📱 Ứng dụng / Apps | Danh sách bài hát, danh bạ điện thoại / Song list, phone contacts |
| 🤖 Robot / Robotics | Lưu chuỗi lệnh di chuyển / Store a sequence of movement commands |
| 📊 Tài chính / Finance | Lưu giá cổ phiếu theo từng ngày / Store daily stock prices |

---

## 4. THỰC HÀNH / PRACTICE

### Tổng quan bài thực hành / Practice Overview

Trong bài thực hành này, chúng ta sẽ xây dựng một **hệ thống quản lý điểm số** đơn giản trên Micro:bit. Chương trình sẽ:
- Lưu điểm của 5 học sinh trong một mảng
- Tính điểm trung bình
- Tìm điểm cao nhất và thấp nhất
- Hiển thị kết quả trên LED
- Cho phép xem từng điểm bằng nút bấm

In this practice, we will build a simple **score management system** on the Micro:bit. The program will:
- Store scores of 5 students in an array
- Calculate the average score
- Find the highest and lowest scores
- Display results on the LED
- Allow viewing individual scores using buttons

---

### Bước 1: Khai Báo Mảng 5 Điểm Số / Step 1: Declare Array of 5 Scores

**Tiếng Việt:**  
Chúng ta bắt đầu bằng cách nhập thư viện Micro:bit và khai báo mảng điểm số.

**English:**  
We start by importing the Micro:bit library and declaring the scores array.

```python
from microbit import *

# Danh sach diem so cua 5 hoc sinh / Score list of 5 students
scores = [85, 92, 78, 96, 88]
```

**Giải thích / Explanation:**
- `from microbit import *` → nạp toàn bộ thư viện Micro:bit / load all Micro:bit libraries
- `scores` → tên biến mảng / array variable name
- `[85, 92, 78, 96, 88]` → 5 phần tử nguyên trong dấu ngoặc vuông / 5 integer elements in square brackets

**Câu hỏi tư duy / Thinking question:**  
Tại sao ta dùng `scores` thay vì `diem1, diem2, diem3, diem4, diem5`?  
Why do we use `scores` instead of `score1, score2, score3, score4, score5`?

---

### Bước 2: Tính Tổng và Trung Bình / Step 2: Calculate Sum and Average

**Tiếng Việt:**  
Dùng vòng lặp để cộng dồn tất cả điểm số, sau đó chia cho số lượng phần tử.

**English:**  
Use a loop to accumulate all scores, then divide by the number of elements.

```python
# Tinh tong / Calculate sum
total = 0
for score in scores:
    total += score   # total = total + score

# Tinh diem trung binh / Calculate average
# Dung // (floor division) de lay so nguyen / Use // (floor division) for integer
average = total // len(scores)
```

**Trace qua từng bước / Trace through each step:**

| Lần lặp / Iteration | `score` | `total` (trước / before) | `total` (sau / after) |
|---|---|---|---|
| 1 | 85 | 0 | 85 |
| 2 | 92 | 85 | 177 |
| 3 | 78 | 177 | 255 |
| 4 | 96 | 255 | 351 |
| 5 | 88 | 351 | 439 |

`average = 439 // 5 = 87`

---

### Bước 3: Tìm Điểm Cao Nhất / Step 3: Find Maximum Score

**Tiếng Việt:**  
Sử dụng thuật toán "giả định phần tử đầu tiên là lớn nhất" để tìm giá trị tối đa.

**English:**  
Use the "assume first element is the largest" algorithm to find the maximum value.

```python
# Tim diem cao nhat / Find highest score
max_score = scores[0]   # Bat dau voi phan tu dau tien / Start with first element

for score in scores:
    if score > max_score:
        max_score = score   # Cap nhat neu tim duoc lon hon / Update if larger found
```

**Minh họa từng bước / Step-by-step illustration:**

```
Khởi đầu:   max_score = 85
Bước 1:     score = 85, 85 > 85? Không → max_score vẫn 85
Bước 2:     score = 92, 92 > 85? Có  → max_score = 92
Bước 3:     score = 78, 78 > 92? Không → max_score vẫn 92
Bước 4:     score = 96, 96 > 92? Có  → max_score = 96
Bước 5:     score = 88, 88 > 96? Không → max_score vẫn 96
Kết quả:    max_score = 96 ✅
```

---

### Bước 4: Tìm Điểm Thấp Nhất / Step 4: Find Minimum Score

**Tiếng Việt:**  
Tương tự bước 3, nhưng chúng ta tìm giá trị nhỏ hơn thay vì lớn hơn.

**English:**  
Similar to step 3, but we look for a smaller value instead of a larger one.

```python
# Tim diem thap nhat / Find lowest score
min_score = scores[0]   # Bat dau voi phan tu dau tien / Start with first element

for score in scores:
    if score < min_score:
        min_score = score   # Cap nhat neu tim duoc nho hon / Update if smaller found
```

**Minh họa từng bước / Step-by-step illustration:**

```
Khởi đầu:   min_score = 85
Bước 1:     score = 85, 85 < 85? Không → min_score vẫn 85
Bước 2:     score = 92, 92 < 85? Không → min_score vẫn 85
Bước 3:     score = 78, 78 < 85? Có  → min_score = 78
Bước 4:     score = 96, 96 < 78? Không → min_score vẫn 78
Bước 5:     score = 88, 88 < 78? Không → min_score vẫn 78
Kết quả:    min_score = 78 ✅
```

---

### Bước 5: Hiển Thị Kết Quả Lên LED / Step 5: Display Results on LED

**Tiếng Việt:**  
Dùng `display.scroll()` để hiển thị điểm trung bình, cao nhất, thấp nhất luân phiên. Nút A cho phép xem từng điểm riêng lẻ.

**English:**  
Use `display.scroll()` to alternately display average, maximum, and minimum scores. Button A allows viewing each score individually.

```python
# Vong lap chinh / Main loop
while True:
    # Hien thi diem trung binh / Display average
    display.scroll('TB:' + str(average), delay=80)
    sleep(500)

    # Hien thi diem cao nhat / Display max score
    display.scroll('MAX:' + str(max_score), delay=80)
    sleep(500)

    # Hien thi diem thap nhat / Display min score
    display.scroll('MIN:' + str(min_score), delay=80)
    sleep(500)

    # Nut A: hien thi tung diem / Button A: display each score
    if button_a.was_pressed():
        for i in range(len(scores)):
            display.scroll(str(i+1) + ':' + str(scores[i]), delay=80)
```

**Kết quả mong đợi / Expected Output:**

```
LED hiển thị / LED displays:
→ "TB:87"   (trung bình / average)
→ "MAX:96"  (điểm cao nhất / highest score)
→ "MIN:78"  (điểm thấp nhất / lowest score)
→ (Nhấn A / Press A) → "1:85" "2:92" "3:78" "4:96" "5:88"
```

---

### Bước 6: Bài Tập Mở Rộng – Sắp Xếp Mảng / Step 6: Extended Exercise – Sort the Array

**Tiếng Việt:**  
Thử sắp xếp mảng điểm số theo thứ tự tăng dần bằng thuật toán "Bubble Sort" đơn giản.

**English:**  
Try sorting the scores array in ascending order using a simple "Bubble Sort" algorithm.

```python
# Bubble Sort don gian / Simple Bubble Sort
# Tao ban sao de khong thay doi mang goc / Create copy to preserve original
sorted_scores = list(scores)

n = len(sorted_scores)
for i in range(n):
    for j in range(0, n - i - 1):
        if sorted_scores[j] > sorted_scores[j + 1]:
            # Hoan doi / Swap
            temp = sorted_scores[j]
            sorted_scores[j] = sorted_scores[j + 1]
            sorted_scores[j + 1] = temp

# Hien thi thu hang / Display rankings
for i in range(len(sorted_scores)):
    display.scroll('H' + str(i+1) + ':' + str(sorted_scores[i]), delay=80)
    sleep(300)
```

**Minh họa Bubble Sort / Bubble Sort Illustration:**

```
Mảng gốc:  [85, 92, 78, 96, 88]

Lần 1:  [85, 78, 92, 88, 96]  (96 nổi lên cuối / 96 bubbles to end)
Lần 2:  [78, 85, 88, 92, 96]  (92 vào đúng vị trí / 92 in position)
Lần 3:  [78, 85, 88, 92, 96]  (Không thay đổi / No change)
Lần 4:  [78, 85, 88, 92, 96]  (Đã sắp xếp / Sorted)

Kết quả: [78, 85, 88, 92, 96] ✅
```

---

## 5. MAKECODE – HƯỚNG DẪN DÙNG KHỐI LỆNH / MAKECODE BLOCK GUIDE

Đối với học sinh sử dụng MakeCode, có thể sử dụng các khối sau:  
For students using MakeCode, the following blocks can be used:

### Khai Báo Mảng / Declaring an Array

1. Vào **Variables** → **Make a Variable** → đặt tên `scores`  
   Go to **Variables** → **Make a Variable** → name it `scores`
2. Vào **Arrays** (trong Advanced) → chọn khối **set list to** với các số `[85, 92, 78, 96, 88]`  
   Go to **Arrays** (under Advanced) → select the **set list to** block with values `[85, 92, 78, 96, 88]`

### Duyệt Mảng / Iterating Array

1. Vào **Loops** → dùng khối **for index from 0 to (length of list) - 1**  
   Go to **Loops** → use the **for index from 0 to (length of list) - 1** block
2. Trong vòng lặp, dùng **Arrays** → **get value at** để truy cập phần tử  
   Inside the loop, use **Arrays** → **get value at** to access elements

### Tính Tổng / Calculating Sum

1. Khai báo biến `total = 0` (Variables → Set total to 0)
2. Trong vòng lặp, dùng **Set total to total + (get value at index)**  
   In the loop, use **Set total to total + (get value at index)**

### Tìm Max/Min / Finding Max/Min

1. Khai báo biến `max_score = get value at 0`  
   Declare variable `max_score = get value at 0`
2. Trong vòng lặp, dùng khối **if (get value at index) > max_score then set max_score**  
   In the loop, use block **if (get value at index) > max_score then set max_score**

### Hiển Thị / Display

1. Dùng khối **show string** với nối chuỗi: `"TB:" + average`  
   Use **show string** block with concatenation: `"TB:" + average`
2. Thêm khối **pause** giữa các lần hiển thị để dễ đọc  
   Add **pause** blocks between displays for readability

---

## 6. MÃ MICROPYTHON ĐẦY ĐỦ / COMPLETE MICROPYTHON CODE

```python
from microbit import *

# ============================================================
# BAI 21: MANG (ARRAY) - DANH SACH DIEM
# LESSON 21: ARRAYS - SCORE LIST
# ============================================================

# Danh sach diem so / Score list
scores = [85, 92, 78, 96, 88]

# ============================================================
# TINH TONG VA TRUNG BINH / CALCULATE SUM AND AVERAGE
# ============================================================
total = 0
for score in scores:
    total += score
average = total // len(scores)

# ============================================================
# TIM DIEM CAO NHAT / FIND MAX SCORE
# ============================================================
max_score = scores[0]
for score in scores:
    if score > max_score:
        max_score = score

# ============================================================
# TIM DIEM THAP NHAT / FIND MIN SCORE
# ============================================================
min_score = scores[0]
for score in scores:
    if score < min_score:
        min_score = score

# ============================================================
# VONG LAP CHINH - HIEN THI KET QUA / MAIN LOOP - DISPLAY
# ============================================================
while True:
    # Hien thi diem trung binh / Display average
    display.scroll('TB:' + str(average), delay=80)
    sleep(500)

    # Hien thi diem cao nhat / Display max score
    display.scroll('MAX:' + str(max_score), delay=80)
    sleep(500)

    # Hien thi diem thap nhat / Display min score
    display.scroll('MIN:' + str(min_score), delay=80)
    sleep(500)

    # Nut A: Hien thi tung diem / Button A: Show each score
    if button_a.was_pressed():
        for i in range(len(scores)):
            display.scroll(str(i + 1) + ':' + str(scores[i]), delay=80)

    # Nut B: Hien thi tong so hoc sinh / Button B: Show total students
    if button_b.was_pressed():
        display.scroll('N=' + str(len(scores)), delay=80)
```

---

## 7. BÀI TẬP MỞ RỘNG / EXTENDED EXERCISES

### 🔵 Bài tập 1: Đổi Điểm Số / Exercise 1: Change Scores (Dễ / Easy)

**Yêu cầu / Task:**  
Thay đổi mảng `scores` để có **10 điểm số** thay vì 5. Tính lại trung bình, max, min và hiển thị trên Micro:bit.

Change the `scores` array to have **10 scores** instead of 5. Recalculate average, max, min and display on Micro:bit.

```python
# Gợi ý / Hint
scores = [75, 88, 92, 65, 79, 83, 91, 70, 86, 94]
# Phần còn lại giữ nguyên / Rest of the code remains the same
```

**Câu hỏi / Question:**  
Chương trình của bạn có cần thay đổi phần nào khác không khi thay đổi số lượng phần tử?  
Does your program need to change any other part when changing the number of elements?

---

### 🟡 Bài tập 2: Đếm Số Học Sinh Đạt / Exercise 2: Count Passing Students (Trung bình / Medium)

**Yêu cầu / Task:**  
Thêm một đoạn code đếm số học sinh có điểm số **≥ 80** (đạt loại Tốt) và hiển thị lên LED khi nhấn nút A+B cùng lúc.

Add code to count students with scores **≥ 80** (Good grade) and display on LED when both A and B buttons are pressed.

```python
# Goi y / Hint
pass_count = 0
for score in scores:
    if score >= 80:
        pass_count += 1

# Trong vong lap chinh, them / In main loop, add:
# if button_a.is_pressed() and button_b.is_pressed():
#     display.scroll('DAT:' + str(pass_count), delay=80)
```

---

### 🔴 Bài tập 3: Xếp Loại Học Sinh / Exercise 3: Grade Classification (Khó / Hard)

**Yêu cầu / Task:**  
Viết chương trình duyệt qua mảng điểm số và **phân loại** từng điểm số thành:
- A: ≥ 90
- B: 80–89
- C: 70–79
- D: < 70

Đếm số học sinh ở mỗi loại và hiển thị kết quả.

Write a program that iterates through the scores array and **classifies** each score into:
- A: ≥ 90
- B: 80–89
- C: 70–79
- D: < 70

Count students in each category and display results.

```python
# Goi y / Hint
count_a = 0
count_b = 0
count_c = 0
count_d = 0

for score in scores:
    if score >= 90:
        count_a += 1
    elif score >= 80:
        count_b += 1
    elif score >= 70:
        count_c += 1
    else:
        count_d += 1

# Hien thi ket qua / Display results
display.scroll('A:' + str(count_a) + ' B:' + str(count_b), delay=80)
sleep(500)
display.scroll('C:' + str(count_c) + ' D:' + str(count_d), delay=80)
```

---

### 🟣 Bài tập 4: Cảm Biến Nhiệt Độ / Exercise 4: Temperature Sensor (Nâng cao / Advanced)

**Yêu cầu / Task:**  
Sử dụng **cảm biến nhiệt độ thực** của Micro:bit để thu thập 5 lần đọc nhiệt độ (mỗi 2 giây), lưu vào mảng, sau đó tính và hiển thị trung bình, max, min.

Use the Micro:bit's **built-in temperature sensor** to collect 5 temperature readings (every 2 seconds), store in an array, then calculate and display average, max, min.

```python
# Goi y / Hint
from microbit import *

# Thu thap du lieu nhiet do / Collect temperature data
temps = []
display.scroll('READY', delay=80)
sleep(1000)

for i in range(5):
    t = temperature()
    temps.append(t)
    display.scroll(str(i+1) + ':' + str(t), delay=80)
    sleep(2000)

# Tinh toan tuong tu bai chinh / Calculate similar to main lesson
total = 0
for t in temps:
    total += t
avg_temp = total // len(temps)

display.scroll('AVG:' + str(avg_temp) + 'C', delay=80)
```

---

## 8. CÂU HỎI THẢO LUẬN / DISCUSSION QUESTIONS

### Câu 1 / Question 1

**Tiếng Việt:** Tại sao chỉ số mảng lại bắt đầu từ 0 thay vì 1? Điều này có liên quan gì đến cách máy tính lưu trữ dữ liệu trong bộ nhớ không?

**English:** Why do array indexes start at 0 instead of 1? How does this relate to how computers store data in memory?

> 💡 **Gợi ý trả lời / Hint:** Trong bộ nhớ máy tính, địa chỉ của phần tử được tính bằng `địa_chỉ_đầu + index × kích_thước_phần_tử`. Nếu index = 0, phần tử đầu tiên ngay tại địa chỉ đầu.  
> In computer memory, element addresses are calculated as `start_address + index × element_size`. If index = 0, the first element is at the start address itself.

---

### Câu 2 / Question 2

**Tiếng Việt:** So sánh hai cách tìm giá trị lớn nhất: dùng hàm `max()` có sẵn và viết vòng lặp tự thực hiện. Ưu và nhược điểm của mỗi cách là gì?

**English:** Compare two ways to find the maximum value: using the built-in `max()` function vs. writing a loop manually. What are the advantages and disadvantages of each approach?

---

### Câu 3 / Question 3

**Tiếng Việt:** Nếu mảng `scores` có 1000 phần tử thay vì 5, chương trình của chúng ta có cần thay đổi không? Điều này cho thấy lợi thế gì của việc dùng vòng lặp với mảng?

**English:** If the `scores` array had 1000 elements instead of 5, would our program need to change? What advantage does this demonstrate about using loops with arrays?

---

### Câu 4 / Question 4

**Tiếng Việt:** Hãy nghĩ về một tình huống thực tế khác (ngoài điểm học sinh) mà bạn có thể dùng mảng và các phép toán tìm max, min, tính trung bình.

**English:** Think of another real-life situation (beyond student scores) where you could use an array and the operations of finding max, min, and average.

---

### Câu 5 / Question 5

**Tiếng Việt:** Trong thuật toán Bubble Sort, tại sao chúng ta cần đến `n-1` vòng lặp bên ngoài? Hãy thử giải thích bằng ví dụ cụ thể với mảng `[3, 1, 2]`.

**English:** In the Bubble Sort algorithm, why do we need up to `n-1` outer loop iterations? Try to explain using a specific example with the array `[3, 1, 2]`.

---

## 9. BÀI TẬP VỀ NHÀ / HOMEWORK

### 📝 Bài tập 1: Nhật Ký Nhiệt Độ / Task 1: Temperature Journal

**Tiếng Việt:**  
Trong 5 ngày liên tiếp, đo nhiệt độ phòng của bạn vào 3 thời điểm: sáng, trưa, tối. Ghi lại 15 giá trị này vào một mảng trong chương trình MicroPython. Sau đó:
1. Tính nhiệt độ trung bình của cả tuần
2. Tìm ngày nóng nhất (nhiệt độ cao nhất)
3. Tìm ngày lạnh nhất (nhiệt độ thấp nhất)
4. Hiển thị kết quả trên Micro:bit

Viết code và giải thích cách hoạt động của chương trình bằng lời văn.

**English:**  
Over 5 consecutive days, measure your room temperature at 3 times: morning, noon, evening. Record these 15 values in a MicroPython array. Then:
1. Calculate the average temperature for the week
2. Find the hottest day (highest temperature)
3. Find the coldest day (lowest temperature)
4. Display results on the Micro:bit

Write the code and explain how the program works in writing.

---

### 📝 Bài tập 2: Trò Chơi Xúc Xắc / Task 2: Dice Game

**Tiếng Việt:**  
Viết chương trình mô phỏng tung xúc xắc:
1. Khi lắc Micro:bit, tạo ra một số ngẫu nhiên từ 1–6 và thêm vào mảng kết quả
2. Lưu tối đa 10 lần tung
3. Khi nhấn nút A, hiển thị tổng điểm của tất cả lần tung
4. Khi nhấn nút B, hiển thị số lần xuất hiện giá trị 6 (jackpot!)

*Gợi ý:* Dùng `import random` và `random.randint(1, 6)` để tạo số ngẫu nhiên.

**English:**  
Write a program to simulate dice rolling:
1. When the Micro:bit is shaken, generate a random number from 1–6 and add it to a results array
2. Store up to 10 rolls
3. When button A is pressed, display the total of all rolls
4. When button B is pressed, display how many times 6 appeared (jackpot!)

*Hint:* Use `import random` and `random.randint(1, 6)` to generate random numbers.

```python
# Goi y khung code / Code framework hint
import random
from microbit import *

results = []  # Mang ket qua / Results array

while True:
    if accelerometer.was_gesture('shake') and len(results) < 10:
        roll = random.randint(1, 6)
        results.append(roll)
        display.show(str(roll))
        sleep(1000)

    if button_a.was_pressed() and len(results) > 0:
        # Tinh tong / Calculate sum
        total = 0
        for r in results:
            total += r
        display.scroll('SUM:' + str(total), delay=80)

    if button_b.was_pressed():
        # Dem so 6 / Count sixes
        sixes = 0
        for r in results:
            if r == 6:
                sixes += 1
        display.scroll('6s:' + str(sixes), delay=80)
```

---

### 📝 Bài tập 3 (Thách thức / Challenge): Thuật Toán Tìm Kiếm / Task 3: Search Algorithm

**Tiếng Việt:**  
Nghiên cứu thuật toán **Linear Search** (Tìm kiếm tuyến tính): tìm kiếm một giá trị trong mảng và trả về **vị trí (index)** của nó, hoặc -1 nếu không tìm thấy. Viết hàm `linear_search(arr, target)` và kiểm tra với mảng điểm số của bài học.

**English:**  
Research the **Linear Search** algorithm: search for a value in an array and return its **position (index)**, or -1 if not found. Write a `linear_search(arr, target)` function and test it with the lesson's score array.

---

## 10. RUBRIC ĐÁNH GIÁ / ASSESSMENT RUBRIC

| Tiêu chí / Criteria | Xuất sắc (10đ) / Excellent | Tốt (8đ) / Good | Đạt (6đ) / Pass | Chưa đạt (<6đ) / Fail |
|---|---|---|---|---|
| **Hiểu lý thuyết mảng / Array Theory Understanding** | Giải thích đầy đủ, chính xác về mảng, chỉ số, và các phép toán. Đặt ra ví dụ sáng tạo. / Full, accurate explanation of arrays, indexes, and operations. Creates original examples. | Giải thích đúng hầu hết khái niệm. Một vài điểm còn mơ hồ. / Explains most concepts correctly. A few points are unclear. | Hiểu khái niệm cơ bản nhưng còn nhiều nhầm lẫn về chỉ số và vòng lặp. / Understands basic concepts but still confused about indexes and loops. | Không hiểu khái niệm mảng hoặc hiểu sai cơ bản. / Does not understand array concepts or has fundamental misunderstandings. |
| **Kỹ năng lập trình / Programming Skills** | Code chạy đúng hoàn toàn. Có comment đầy đủ, biến đặt tên rõ ràng, cấu trúc logic rõ ràng. / Code runs perfectly. Full comments, clear variable names, logical structure. | Code chạy đúng với lỗi nhỏ. Comment tương đối đủ. / Code runs correctly with minor issues. Reasonably complete comments. | Code chạy được nhưng có lỗi logic hoặc thiếu comment. / Code runs but has logic errors or missing comments. | Code không chạy được hoặc sao chép mà không hiểu. / Code does not run or is copied without understanding. |
| **Bài tập mở rộng / Extended Exercises** | Hoàn thành cả 3 bài tập và thêm tính năng sáng tạo riêng. / Completes all 3 exercises and adds own creative features. | Hoàn thành 2/3 bài tập mở rộng đúng và đầy đủ. / Completes 2/3 extended exercises correctly and fully. | Hoàn thành 1 bài tập mở rộng hoặc hoàn thành một phần. / Completes 1 extended exercise or partially completes them. | Không hoàn thành bài tập mở rộng nào. / Does not complete any extended exercises. |
| **Trình bày và thảo luận / Presentation & Discussion** | Trình bày rõ ràng, trả lời tốt 4–5 câu hỏi thảo luận với lập luận có chiều sâu. / Clear presentation, answers 4–5 discussion questions with depth. | Trả lời đúng 3–4 câu hỏi thảo luận. Trình bày mạch lạc. / Answers 3–4 discussion questions correctly. Coherent presentation. | Trả lời được 1–2 câu hỏi. Trình bày còn thiếu sót. / Answers 1–2 questions. Presentation has gaps. | Không tham gia thảo luận hoặc trả lời không liên quan. / Does not participate in discussion or gives irrelevant answers. |

---

## 11. TÀI NGUYÊN BỔ SUNG / ADDITIONAL RESOURCES

### Liên kết hữu ích / Useful Links

| Tài nguyên / Resource | Mô tả / Description | Địa chỉ / URL |
|---|---|---|
| MakeCode Micro:bit | Trình soạn thảo trực tuyến / Online editor | https://makecode.microbit.org |
| MicroPython Micro:bit | Tài liệu MicroPython / MicroPython docs | https://microbit-micropython.readthedocs.io |
| Mu Editor | Trình soạn thảo Python offline / Offline Python editor | https://codewith.mu |

### Từ Vựng Chính / Key Vocabulary

| Tiếng Việt | English | Định nghĩa |
|---|---|---|
| Mảng | Array | Tập hợp có thứ tự các phần tử cùng kiểu / Ordered collection of same-type elements |
| Danh sách | List | Kiểu dữ liệu mảng trong Python / Array data type in Python |
| Chỉ số | Index | Số thứ tự vị trí phần tử, bắt đầu từ 0 / Element position number, starting at 0 |
| Duyệt | Iterate | Lặp qua từng phần tử của mảng / Loop through each element of array |
| Tổng | Sum | Tổng cộng tất cả các phần tử / Total of all elements |
| Trung bình | Average | Tổng chia cho số lượng phần tử / Sum divided by number of elements |
| Sắp xếp | Sort | Xếp các phần tử theo thứ tự / Arrange elements in order |
| Hoán đổi | Swap | Đổi vị trí hai phần tử cho nhau / Exchange positions of two elements |

---

## 12. GHI CHÚ GIÁO VIÊN / TEACHER NOTES

### Lưu ý Sư phạm / Pedagogical Notes

**Tiếng Việt:**
- **Thời gian phân bổ:** 20 phút lý thuyết → 40 phút thực hành → 20 phút thảo luận/đánh giá
- **Điều kiện tiên quyết:** Học sinh cần đã hoàn thành Bài 5 (Vòng lặp) và Bài 3 (Biến số)
- **Khó khăn thường gặp:** Học sinh thường nhầm lẫn giữa `scores[i]` (phần tử) và `i` (chỉ số). Nhấn mạnh điều này với bảng minh họa
- **Mở rộng:** Học sinh khá có thể thử bài tập cảm biến nhiệt độ (Bài tập 4)

**English:**
- **Time allocation:** 20 min theory → 40 min practice → 20 min discussion/assessment
- **Prerequisites:** Students should have completed Lesson 5 (Loops) and Lesson 3 (Variables)
- **Common difficulties:** Students often confuse `scores[i]` (the element) with `i` (the index). Emphasize this with visual tables
- **Extension:** Advanced students can try the temperature sensor exercise (Exercise 4)

### Chuẩn bị trước buổi học / Pre-class Preparation

- [ ] Kiểm tra Micro:bit và cáp USB cho mỗi học sinh / Check Micro:bit and USB cable for each student
- [ ] Mở sẵn MakeCode hoặc Mu Editor trên máy tính / Pre-open MakeCode or Mu Editor on computers
- [ ] In handout hướng dẫn nếu cần / Print instruction handouts if needed
- [ ] Chuẩn bị ví dụ mảng trong cuộc sống để minh họa / Prepare real-life array examples for illustration

---

*Bài 21 / Lesson 21 – Mảng (Array) – Danh Sách Điểm / Arrays – Score List*  
*Giáo trình STEAM cùng Elecrow Crowtail & Micro:bit / STEAM Curriculum with Elecrow Crowtail & Micro:bit*  
*Phiên bản / Version: 1.0 – Năm học / Academic Year: 2025–2026*
