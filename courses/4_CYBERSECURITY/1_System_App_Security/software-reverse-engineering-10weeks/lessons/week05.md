# Giáo trình Cyber Security – Reverse Engineering

## Tuần 5 – Bài 5

# Phân Tích GUI Application, Windows API & Intermodular Calls

---

# 1. Mục tiêu bài học

Sau khi hoàn thành bài này, học viên có thể:

* Phân tích kiến trúc của ứng dụng GUI (Graphical User Interface) trên hệ điều hành Windows.
* Sử dụng cửa sổ **Intermodular Calls** trong x64dbg để liệt kê toàn bộ các lời gọi API từ ứng dụng sang DLL hệ thống.
* Đặt Breakpoint thành thạo tại các hàm Windows API thường dùng trong kiểm tra đăng ký (`MessageBoxA/W`, `GetWindowTextA/W`, `GetDlgItemTextA/W`).
* Theo vết và phân tích luồng logic kiểm tra Serial Key trong ứng dụng GUI.

---

# 2. Kiến thức chính

## 2.1 Cấu Trúc Ứng Dụng GUI & Windows API

Ứng dụng Windows GUI tương tác với người dùng và hệ điều hành thông qua các thông điệp (Messages) và lời gọi hàm Windows API (Application Programming Interface).

```text
[Người dùng gõ Serial & Click "Register"]
                   ↓
[Windows OS phát thông điệp WM_COMMAND / WM_LBUTTONDOWN]
                   ↓
[Windows API: GetWindowTextA() đọc dữ liệu từ ô nhập]
                   ↓
[Hàm xử lý sự kiện (Event Handler) trong mã ứng dụng]
                   ↓
[Windows API: MessageBoxA() hiển thị kết quả "Success" hoặc "Failed"]
```

### Các hàm Windows API quan trọng cần theo dõi:
1. **Lấy dữ liệu nhập từ giao diện**:
   * `GetWindowTextA` / `GetWindowTextW`: Lấy văn bản từ ô nhập (ANSI / Unicode).
   * `GetDlgItemTextA` / `GetDlgItemTextW`: Lấy văn bản từ ô Input trong Dialog Box.
2. **Hiển thị thông báo**:
   * `MessageBoxA` / `MessageBoxW`: Hiển thị hộp thoại tháo gỡ/thông báo.
3. **Thao tác Registry & File hệ thống**:
   * `RegQueryValueExA/W`: Đọc thông tin bản quyền từ Windows Registry.
   * `CreateFileA/W`, `ReadFile`: Đọc file `.lic` / `.key` đăng ký.

---

## 2.2 Kỹ Thuật Intermodular Calls Trong x64dbg

Intermodular Calls là tính năng trong x64dbg quét toàn bộ phân vùng `.text` để liệt kê danh sách các lệnh `CALL` trỏ tới hàm thuộc các thư viện liên kết động bên ngoài (như `USER32.DLL`, `KERNEL32.DLL`, `ADVAPI32.DLL`).

```text
Thao tác quét Intermodular Calls trong x64dbg:
1. Mở ứng dụng trong x64dbg.
2. Tại cửa sổ CPU, click chuột phải → Search for → Current Module → Intermodular Calls.
3. Nhập từ khóa tìm kiếm (Ví dụ: "GetWindowText" hoặc "MessageBox").
4. Click đúp vào địa chỉ lệnh CALL để chuyển thẳng tới dòng lệnh tương ứng trong đĩa Assembly.
```

---

## 2.3 Workflow Theo Vết Serial Key Trong GUI App

```text
[Bước 1: Tìm lời gọi Windows API (GetWindowText / MessageBox)]
                          ↓
[Bước 2: Đặt Breakpoint (F2) tại lệnh CALL API hoặc Entry của API]
                          ↓
[Bước 3: Thực thi chương trình (F9) & Nhập Serial giả định trên GUI]
                          ↓
[Bước 4: Nhấn Submit → Chương trình dừng tại API]
                          ↓
[Bước 5: Dùng Ctrl+F9 (Execute till Return) & F8 để lùi về Hàm Kiểm Tra Chính]
                          ↓
[Bước 6: Quan sát bộ nhớ (Hexdump / String Reference) để tìm Serial thật hoặc Logic]
```

---

# 3. Thuật ngữ quan trọng

| Thuật ngữ | Ý nghĩa |
|---|---|
| **Windows API** | Bộ hàm giao tiếp tiêu chuẩn của Windows OS |
| **Intermodular Calls** | Danh sách lời gọi hàm giữa các module DLL |
| **Event Handler** | Hàm xử lý sự kiện khi người dùng click button |
| **ANSI / Unicode** | Chuẩn mã hóa chuỗi ký tự (`*A` cho ANSI, `*W` cho Wide Unicode) |
| **String References** | Danh sách chuỗi ký tự tĩnh có trong binary |
| **Import Address Table (IAT)** | Bảng địa chỉ chứa danh sách API nạp runtime |

---

# 4. Ví dụ minh họa

## Ví dụ 1: Tìm hàm MessageBoxA bằng Intermodular Calls

1. Mở bài lab `toy_gui_validator.exe` trong x64dbg.
2. Click chuột phải → **Search for** → **Current Module** → **Intermodular Calls**.
3. Lọc từ khóa `MessageBoxA`:
   ```text
   Address          Target
   00007FF610001420 <USER32.MessageBoxA>
   ```
4. Click đúp vào địa chỉ `00007FF610001420`. Đặt điểm ngắt **F2** tại lệnh `CALL <USER32.MessageBoxA>`.
5. Nhấn **F9**, nhập Serial bất kỳ vào ứng dụng và bấm "Check Key". Chương trình sẽ dừng ngay trước khi bảng thông báo lỗi xuất hiện!

---

## Ví dụ 2: Lùi về hàm kiểm tra từ GetWindowTextA

Khi chương trình dừng tại `GetWindowTextA`, nhấn **Ctrl + F9** để thực thi hết hàm API này và trở về mã nguồn ứng dụng:
```assembly
004012A0 | E8 50020000 | call <KERNEL32.GetWindowTextA> | Đọc chuỗi nhập
004012A5 | 8D45 F0     | lea eax, dword ptr ss:[ebp-10]  | EAX chứa con trỏ chuỗi vừa nhập
004012A8 | 50         | push eax                        | Đẩy chuỗi nhập vào Stack
004012A9 | E8 30000000 | call toy_gui.check_serial       | CALL hàm kiểm tra logic!
004012AE | 83F8 01     | cmp eax, 1                      | Kiểm tra kết quả
```
→ Nhấn **F7** tại dòng `004012A9` để đi thẳng vào hàm thuật toán `check_serial`!

---

# 5. Ghi nhớ

```text
[Mở cửa sổ Intermodular Calls] ──► [Tìm kiếm API: GetWindowText / MessageBox]
                                                 │
                                                 ▼
[Quay lại caller trong Mã Ứng Dụng] ◄── [Đặt Breakpoint (F2) & Nhập Serial giả]
         │
         ▼
[Trace thuật toán so sánh chuỗi bằng F8 / Quan sát Memory Hexdump]
```

> **Ghi nhớ**: "Mọi ứng dụng GUI Windows đều bắt buộc phải thông qua Windows API để lấy dữ liệu nhập vào hoặc xuất kết quả ra màn hình. Intermodular Calls chính là bản đồ dẫn đường nhanh nhất tới điểm kiểm tra!"

---

# 6. Câu hỏi ôn tập

### Câu 1 (Nhận biết)
Tính năng Intermodular Calls trong x64dbg dùng để tìm kiếm đối tượng nào trong mã thực thi?
A. Các file ảnh PNG trong giao diện  
B. Các lời gọi hàm (CALL) tới thư viện liên kết động bên ngoài (DLLs/Windows API)  
C. Lịch sử các trang web người dùng đã truy cập  
D. Danh sách các tài khoản Windows trên máy  

**Đáp án:** B

---

### Câu 2 (Thông hiểu)
Hàm Windows API nào thường được ứng dụng GUI gọi tới để đọc dữ liệu ký tự mà người dùng gõ vào một ô Textbox?
A. `CreateProcessA`  
B. `GetWindowTextA` / `GetWindowTextW`  
C. `ExitProcess`  
D. `DeleteFileA`  

**Đáp án:** B

---

### Câu 3 (Thông hiểu)
Sự khác nhau giữa ký tự đuôi `A` và `W` trong tên các hàm Windows API (Ví dụ: `MessageBoxA` và `MessageBoxW`) là gì?
*Gợi ý trả lời:* Đuôi `A` đại diện cho hàm xử lý chuỗi ký tự chuẩn ANSI (8-bit ASCII), còn đuôi `W` (Wide) đại diện cho hàm xử lý chuỗi ký tự Unicode UTF-16 (16-bit).

---

### Câu 4 (Vận dụng)
Trình bày kịch bản từng bước để tìm ra vị trí so sánh Serial Key của một ứng dụng Windows GUI mà không có chuỗi văn bản thông báo lỗi cụ thể.
*Gợi ý trả lời:* 
1. Sử dụng Intermodular Calls để tìm lời gọi hàm `GetWindowTextA/W` hoặc `GetDlgItemTextA/W`.
2. Đặt Breakpoint (F2) tại tất cả các vị trí `CALL GetWindowText`.
3. Nhập dữ liệu thử nghiệm trên giao diện và bấm nút xác nhận để kích hoạt breakpoint.
4. Khi chương trình dừng tại API, dùng `Ctrl+F9` để thoát khỏi API lùi về mã nguồn ứng dụng.
5. Dùng `F8` để trace qua các câu lệnh tiếp theo để tìm lệnh gọi hàm so sánh chuỗi hoặc kiểm tra logic (`CMP`, `TEST`).

---

### Câu 5 (Vận dụng)
Tại sao việc tìm kiếm chuỗi văn bản (String References) đôi khi thất bại không tìm thấy thông báo lỗi, và lúc đó kỹ thuật Intermodular Calls thể hiện ưu thế như thế nào?
*Gợi ý trả lời:* Vì chuỗi thông báo lỗi có thể đã bị mã hóa (Encrypted), bị nén (Packed) hoặc được ghép từ nhiều đoạn nhỏ tại runtime khiến String Search tĩnh không tìm ra. Lúc đó, lời gọi API hệ thống (`MessageBox`) bắt buộc vẫn phải diễn ra tại runtime, giúp Intermodular Calls bẫy đúng thời điểm API được gọi bất kể chuỗi có bị mã hóa hay không.

---

## Tổng kết bài học

* Hiểu cơ chế hoạt động của ứng dụng Windows GUI và lời gọi Windows API.
* Sử dụng thành thạo **Intermodular Calls** trong x64dbg để khoanh vùng vị trí gỡ lỗi.
* Trace và định vị chính xác vị trí hàm kiểm tra dữ liệu đầu vào.
