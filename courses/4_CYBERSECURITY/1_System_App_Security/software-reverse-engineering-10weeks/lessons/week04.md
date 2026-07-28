# Tuần 4: Stepping, call stack và breakpoint

## Nguồn bài học

- **Stepping Into Call Function of x64dbg**.
- **How to Use Breakpoints in Software Cracking**.
- **Stepping Into Call Function of x64dbg**.
- **How to Use Breakpoints in Software Cracking**.
- Kỹ thuật được áp dụng để debug toy binary, không nhằm vượt kiểm soát phần mềm thật.

## Chuyên đề: Phá Vỡ Rào Cản Mã Nguồn — 5 Bí Mật Về Breakpoint Trong Kỹ Thuật Đảo Ngược Phần Mềm

### 1. Lời mở đầu: Cảm giác lạc lối giữa những dòng code

Đối với một "newbie" khi lần đầu dấn thân vào thế giới kỹ thuật đảo ngược (Reverse Engineering), khoảnh khắc mở một tệp tin thực thi trong trình gỡ lỗi như x64dbg (hay SDPG64) thường mang lại cảm giác choáng ngợp đến nghẹt thở. Trước mắt bạn không phải là giao diện thân thiện của ứng dụng, mà là một mê cung của những địa chỉ bộ nhớ RAM, các mã Hex vô hồn và hàng ngàn dòng lệnh Assembly nhảy múa liên tục. Trong mớ hỗn độn của Stack và Registers đó, mã nguồn thực sự của ứng dụng dường như đang lẩn trốn sau lớp vỏ bọc cứng nhắc của mã máy. Làm thế nào để chúng ta có thể "dừng thời gian", đóng băng trạng thái của CPU để soi xét từng chân tơ kẽ tóc của logic phần mềm? Bí mật nằm ở Breakpoint (Điểm dừng) — công cụ tối thượng cho phép bạn chiếm quyền kiểm soát luồng thực thi, buộc ứng dụng phải dừng lại và tiết lộ những bí mật sâu kín nhất của nó.

### 2. Takeaway 1: Breakpoint - Khi phần mềm cũng cần một "khoảng nghỉ" như con người

Trong kỹ thuật đảo ngược, Breakpoint không chỉ đơn giản là lệnh dừng. Nó là một sự can thiệp có tính toán vào chu kỳ xử lý của CPU. Để hiểu bản chất của nó, hãy nhìn vào cách thức vận hành của chính chúng ta. Một ứng dụng khi thực thi cũng giống như một con người đang mải miết làm việc; nó cần những điểm dừng chiến thuật để chúng ta có thể kiểm tra xem "nó đang nghĩ gì" (dữ liệu trong thanh ghi) và "nó định làm gì tiếp theo".

> *"Cũng giống như con người khi bạn làm điều gì đó... bạn phải nghỉ ngơi lần đầu tiên, đó cũng là cách các ứng dụng hoạt động."*

Việc đặt một Breakpoint chính là cách bạn tạo ra một "khoảng nghỉ" cưỡng bức. Thay vì để mã lệnh trôi đi với tốc độ hàng triệu phép tính mỗi giây, bạn đóng băng nó lại tại một địa chỉ bộ nhớ cụ thể để quan sát sự thay đổi của các biến số và luồng logic ngay tại thời điểm then chốt.

### 3. Takeaway 2: Đừng nhầm lẫn giữa "Hệ điều hành" và "Ứng dụng"

Một cái bẫy kinh điển mà các "script kiddies" thường mắc phải là bắt đầu phân tích ngay khi vừa nạp ứng dụng vào debugger. Khi bạn mở ứng dụng trong debugger, trình gỡ lỗi sẽ dừng lại ở **System Breakpoint**. Đây là giai đoạn cực kỳ quan trọng cần lưu ý: Tại thời điểm này, bạn đang đứng ở lớp vỏ của Windows (Operating System), nơi hệ điều hành chuẩn bị bàn giao quyền điều khiển cho ứng dụng. Mọi dòng mã bạn thấy lúc này chỉ là các thư viện hệ thống dùng chung, hoàn toàn không liên quan đến logic phân tích mà bạn đang tìm kiếm. Để thực sự chạm tay vào mục tiêu, bạn phải nhấn "Run" (`F9`) để vượt qua lớp rào chắn hệ thống, tiến thẳng tới **Entry Point** — điểm khởi đầu thực sự của mã nguồn ứng dụng. Chỉ khi ở Entry Point, hành trình giải mã của bạn mới chính thức bắt đầu.

### 4. Takeaway 3: String References – Bản đồ kho báu trong mê cung Hex

Thay vì cuộn chuột vô vọng qua hàng vạn dòng lệnh Disassembly, một chuyên gia lão luyện sẽ luôn tìm kiếm những "dấu vết văn bản" (Strings). Trong ứng dụng CLI (Command Line Interface) chúng ta đang nghiên cứu, có chứa một thông báo ẩn: `"try harder"`. Các lập trình viên thường để lại các chuỗi ký tự này như một lời gợi ý hoặc thông báo trạng thái (ví dụ: thông báo sai Serial Key hoặc yêu cầu nhập mật khẩu). Những chuỗi văn bản này chính là những "biển báo giao thông" quý giá. Tìm thấy chuỗi `"try harder"` đồng nghĩa với việc bạn đã xác định được tọa độ của hàm xử lý logic quan trọng. Đây là lối tắt thông minh nhất để dẫn bạn đến thẳng "trái tim" của phần mềm mà không cần phải đọc hiểu từng dòng mã máy phức tạp.

### 5. Takeaway 4: Quy trình "Chuột phải" thần thánh để lọc nhiễu dữ liệu

Để truy vết các chuỗi ký tự trong x64dbg / SDPG64, bạn cần thực hiện một quy trình kỹ thuật chuẩn xác nhằm loại bỏ sự nhiễu loạn từ hàng ngàn DLL hệ thống. Quy trình cụ thể như sau:

- **Bước 1**: Tại cửa sổ Disassembly (vùng chứa mã có thể đọc được), nhấp chuột phải.
- **Bước 2**: Chọn **Search for -> Current Module**. *Lưu ý*: Việc chọn "Current Module" là cực kỳ quan trọng để debugger chỉ tập trung tìm kiếm trong phạm vi mã nguồn của chính ứng dụng mục tiêu, thay vì quét toàn bộ bộ nhớ RAM khổng lồ.
- **Bước 3**: Chọn **String references**. Khi danh sách hiện ra, bạn chỉ cần tìm chuỗi `"try harder"`. Việc Double-click vào dòng này sẽ lập tức đưa màn hình Disassembly "nhảy" đến đúng địa chỉ bộ nhớ chứa lệnh in đoạn văn bản đó. Lúc này, toàn bộ logic kiểm tra mật khẩu hay bản quyền bao quanh chuỗi ký tự đó sẽ hiện ra rõ mồn một trước mắt bạn.

### 6. Takeaway 5: Kiểm chứng giả thuyết bằng cơ chế "Break" và "Run"

Sau khi đã đặt Breakpoint tại một hàm Call (ví dụ: `call`) hoặc một lệnh Jump gần chuỗi `"try harder"`, công việc còn lại là kiểm chứng luồng thực thi. Khi bạn chạy một ứng dụng CLI trong môi trường gỡ lỗi, màn hình Command Prompt ban đầu sẽ hoàn toàn trống rỗng (blank). Chỉ khi bạn nhấn "Run" (`F9`) và CPU thực thi đến đúng địa chỉ bạn đã đánh dấu, chương trình mới tạm dừng (Paused) và nội dung `"try harder"` mới xuất hiện. Bằng cách đặt Breakpoint tại các điểm rẽ nhánh logic (Jumps), bạn có thể quan sát cách ứng dụng đưa ra quyết định: Tại sao nó lại nhảy đến thông báo lỗi? Điều kiện nào cần được thỏa mãn để nó nhảy đến thông báo thành công? Kiểm soát được Breakpoint tại các điểm nhảy này chính là chìa khóa để thay đổi định mệnh của phần mềm.

### Kết luận và Câu hỏi gợi mở

Làm chủ Breakpoint không chỉ là học cách dừng một chương trình; đó là học cách thấu hiểu ngôn ngữ tư duy của lập trình viên thông qua mã máy. Từ việc phân biệt System Breakpoint cho đến việc truy quét String References trong Current Module, bạn đã nắm trong tay những kỹ thuật cơ bản nhưng mạnh mẽ nhất để giải mã bất kỳ ứng dụng nào. Đây chính là nền tảng vững chắc để chúng ta tiến tới thử thách thực sự ở bài học tiếp theo: **Reverse Jumps** — kỹ thuật đảo ngược các lệnh nhảy để bẻ lái hoàn toàn logic của phần mềm theo ý muốn của bạn.

> *Nếu bạn có thể dừng bất kỳ khoảnh khắc nào trong một quy trình logic phức tạp, bạn sẽ chọn dừng ở đâu để tìm ra lỗ hổng của nó?*

## Kết quả cần đạt

- Chọn đúng run, pause, step into, step over, run until return và run to user code.
- Phân biệt software, hardware, memory và conditional breakpoint.
- Đọc call stack, argument/return value theo calling convention.
- Tạo debugging timeline có thể lặp lại sau restart.

## 1. Stepping đúng mục đích

| Thao tác | Dùng khi | Rủi ro |
|---|---|---|
| Step into | Muốn hiểu callee | Rơi sâu vào runtime/library |
| Step over | Call đã biết/không liên quan | Bỏ qua side effect cần quan sát |
| Run until return | Đang ở callee không cần thiết | Có thể chạy nhiều code hơn dự kiến |
| Run to user code | Muốn bỏ loader/runtime | Tool có thể nhận diện module chưa hoàn hảo |
| Pause | Cần snapshot trạng thái | Dừng giữa critical section có thể làm lệch timing |

## 2. Breakpoint types

- **Software breakpoint:** thường thay instruction bằng trap byte; linh hoạt nhưng thay đổi code memory tạm thời.
- **Hardware breakpoint:** dùng debug register; số lượng ít, phù hợp execute/read/write tại địa chỉ cụ thể.
- **Memory breakpoint:** theo dõi page access; có thể noisy và ảnh hưởng timing.
- **Conditional breakpoint:** chỉ dừng khi expression/thread/counter thỏa điều kiện.

Breakpoint là công cụ quan sát, không phải bằng chứng tự thân. Luôn ghi câu hỏi mà breakpoint đang kiểm tra.

## 3. Calling convention x64 khái quát

Trên Windows x64, bốn integer/pointer argument đầu thường qua `RCX`, `RDX`, `R8`, `R9`; return value thường ở `RAX`. Stack vẫn chứa return address, shadow space và dữ liệu khác. Compiler có thể inline hoặc tối ưu nên không áp dụng máy móc.

## 4. Lab từng bước

Target là `toy_control_flow` do khóa cung cấp.

1. Tính hash, tạo working copy và snapshot.
2. Đặt breakpoint tại `main` bằng symbol hoặc module entry đã xác minh.
3. Run tới `classify_score` và ghi thread/call stack.
4. Quan sát argument trước call, step into, ghi branch và `RAX` trước return.
5. Restart target; đặt conditional breakpoint chỉ khi score bằng `80`.
6. Tạo hardware execute breakpoint tại cùng function và so sánh hành vi.
7. Xóa breakpoint, restart và chứng minh target chạy bình thường.

## 5. Debugging timeline

```markdown
Question: classify_score nhận input ở đâu?
Breakpoint: toy.exe + RVA <...>
Precondition: argv[1] = 80
Observation: first integer argument = 80; return register = 2
State modified by analyst: No
Conclusion: function maps 80 to class 2 (high confidence)
Evidence: W04-E03 screenshot + register export
```

## Lỗi thường gặp

- Đặt breakpoint trên địa chỉ tuyệt đối không ổn định.
- Quên tắt breakpoint rồi đo performance.
- Nhầm first-chance exception với crash cuối cùng.
- Sửa memory/register và trộn kết quả với run nguyên bản.
- Bước qua system library hàng nghìn instruction mà không có câu hỏi.
- Dùng breakpoint quá rộng làm Heisenbug/timing thay đổi.

## Bài tập và rubric

Nộp timeline tối đa 12 bước cho ba input, kèm call stack và so sánh software/hardware breakpoint. Chấm: breakpoint choice 25, call/argument reasoning 25, reproducibility 20, evidence 20, safety 10.

