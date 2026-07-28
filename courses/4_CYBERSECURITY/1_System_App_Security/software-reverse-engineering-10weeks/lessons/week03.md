# Tuần 3: Assembly và control flow nền tảng

## Nguồn bài học

- **Basic Steps of x64dbg Debugger** — giao diện CPU, register, memory, stack và các thao tác chạy/đi từng lệnh. Bài học dùng chương trình lớp tự biên dịch có symbol.

## Chuyên đề: Hướng Dẫn Thiết Lập Môi Trường — Những Bài Học Đắt Giá Cho Người Mới Bắt Đầu

Bạn có còn nhớ cảm giác phấn khích khi lần đầu tiên tò mò nhấn chuột phải vào một tệp `.exe` và tự hỏi điều gì thực sự đang diễn ra bên dưới lớp vỏ bóng bẩy của giao diện người dùng? Thế giới của kỹ thuật đảo ngược (reverse engineering) chính là hành trình giải mã "linh hồn" của phần mềm, nơi những dòng mã máy vô cảm trở thành một câu chuyện có logic. Tuy nhiên, rào cản lớn nhất khiến nhiều "nhà thám hiểm" bỏ cuộc không phải là độ khó của mã lệnh, mà là sự lúng túng khi thiết lập vũ khí tác chiến. Bài viết này không chỉ là một hướng dẫn kỹ thuật; nó là lộ trình giúp bạn xây dựng một không gian làm việc chuyên nghiệp, biến những lỗi hệ thống khó chịu thành những bài học nhập môn đầy giá trị.

### Bài học 1: Triết lý Mã nguồn mở và quyền năng của "Sourcing Out"

Trong "kho vũ khí" của một chuyên gia bảo mật, **x64dbg** (bao gồm cả biến thể **x32dbg**) là thanh kiếm sắc bén nhất. Điểm khác biệt lớn nhất giữa một công cụ chuyên nghiệp thực thụ và các phần mềm thương mại chính là triết lý **Open Source (Mã nguồn mở)**.

Thay vì nhìn thấy những nhãn giá (pricing) đắt đỏ, bạn được tự do tiếp cận mã nguồn. Như một nhà nghiên cứu đã từng chia sẻ, mã nguồn mở nghĩa là mọi người đều có quyền "source out" – tìm hiểu tận gốc rễ chương trình và sử dụng nó cho mục đích cá nhân, miễn là tuân thủ các điều khoản và điều kiện đi kèm. Sự tự do này chính là nền tảng cốt lõi để cộng đồng cùng nhau phát triển và chia sẻ tri thức mà không bị ngăn cách bởi rào cản tài chính.

### Bài học 2: "Bức tường" lỗi DLL – Bài tập tư duy đầu tiên

Một lỗi kinh điển mà hầu hết mọi người đều gặp phải khi chạy debugger trên một bản Windows mới cài đặt là thông báo: `API-MS-WIN-CRT-RUNTIME-L1-1-0.DLL missing`. Thực tế, đây không phải là lỗi phần mềm, mà là do hệ điều hành của bạn đang ở trạng thái "sơ khai", thiếu hụt các thư viện thực thi cần thiết.

Thay vì nản lòng, hãy kích hoạt tư duy của một cracker/reverser: quan sát, sao chép và tìm kiếm. Một "pro-tip" dành cho bạn là hãy truy cập `wwhacks.net`, trang web hàng đầu cung cấp quy trình giải quyết các vấn đề này một cách triệt để.

> *"Tất cả những gì bạn cần làm là sao chép chính xác lỗi bạn gặp phải và dán nó vào Google để tìm quy trình giải quyết vấn đề."*

Giải pháp cụ thể là bạn cần cài đặt các bộ thư viện **Microsoft Visual C++ Redistributable (cả hai phiên bản 2015 và 2017)**. Đây là những mảnh ghép còn thiếu để "nhịp cầu" giữa phần mềm và hệ điều hành được thông suốt.

### Bài học 3: Phân biệt "Tiền đồn" (DIE) và "Chiến trường" (x64dbg)

Để chiến thắng trong cuộc đấu trí với phần mềm, bạn cần sự phối hợp hiệp đồng giữa hai công cụ: **Detect It Easy (DIE)** và **x64dbg**.

- **Detect It Easy (DIE) - Tiền đồn phân tích**: Đây là nơi bạn thực hiện các bước "trinh sát". DIE giúp bạn thực hiện các phân tích chuyên sâu (depth analysis) để biết phần mềm được lập trình bằng ngôn ngữ gì, có bị đóng gói (pack) hay không. Đặc biệt, DIE là công cụ để bạn **tính toán Entry Point** dựa trên các thông số kỹ thuật trước khi thực sự bắt tay vào phân tích.
- **x64dbg - Chiến trường thực sự**: Sau khi đã có dữ liệu từ DIE, bạn đưa mục tiêu vào x64dbg để thực hiện phân tích. Một lưu ý quan trọng về kiến trúc hệ thống: Nếu bạn đang làm việc trên môi trường ảo hóa Windows 7 32-bit (như trong hướng dẫn này), bạn phải sử dụng **x32dbg**. Việc lựa chọn phiên bản debugger phải tương thích tuyệt đối với kiến trúc (bit-depth) của hệ điều hành và mục tiêu.

### Bài học 4: Entry Point - Cánh cửa dẫn vào "ma trận" bộ nhớ

Hãy tưởng tượng khi bạn mở Microsoft Word, phần mềm không hiển thị ngay lập tức. Nó được nạp từ ổ cứng vào bộ nhớ tạm thời (RAM) dưới dạng các dãy số nhị phân 0 và 1. Để can thiệp vào quá trình này, bạn phải hiểu hai khái niệm:

- **Base Address**: Địa chỉ gốc nơi phần mềm bắt đầu "đóng quân" trong bộ nhớ.
- **Entry Point (Điểm khởi đầu)**: Đây là vị trí chính xác mà CPU bắt đầu thực thi dòng lệnh đầu tiên của chương trình.

Công thức của một chuyên gia là: **$\text{Base Address} + \text{Offset} = \text{Entry Point}$**. Khi bạn xác định được điểm khởi đầu này trong DIE và khớp nó với debugger, bạn chính thức nắm giữ chìa khóa để điều khiển luồng hoạt động của phần mềm.

### Bài học 5: Đọc hiểu "Ma trận" – Những nhân vật trong thế giới Hexadecimal

Khi mở một debugger, bạn sẽ đối mặt với một giao diện phức tạp. Đừng lo lắng, hãy nhìn nó như một "ma trận" logic:

- **Opcode (Mã máy)**: Những dãy số **Hexadecimal** (thập lục phân). Đây là cách máy tính đọc các số nhị phân 0 và 1 nhưng được trình bày lại cho gọn gàng hơn.
- **Assembly (Hợp ngữ)**: Đây là ngôn ngữ trung gian giúp con người đọc được ý đồ của máy tính. Debugger sẽ chuyển đổi các dãy Hexadecimal khô khan thành các lệnh như `MOV`, `JMP`, `CALL`...
- **Registers (Thanh ghi)**: Hãy chú ý đến `EAX`, `EBX`... Đây là nơi "hành động" thực sự diễn ra. Các thanh ghi này giống như những chiếc hộp chứa dữ liệu tạm thời mà CPU sử dụng để tính toán với tốc độ cực nhanh.
- **Stack (Ngăn xếp)**: Khác với mã lệnh tĩnh, Stack là một thành phần **động (dynamic)**. Nó liên tục thay đổi, trồi sụt dữ liệu trong suốt quá trình chương trình vận hành để hỗ trợ cho các thanh ghi.

### Kết luận và Suy ngẫm

Thiết lập một không gian làm việc chỉnh chu và hiểu rõ cách phần mềm tồn tại trong bộ nhớ chính là 50% chặng đường của một người làm reverse engineering thành công. Khi bạn đã biết cách biến lỗi hệ thống thành cơ hội học hỏi và nhìn thấy được logic đằng sau những thanh ghi `EAX`, `EBX`, bạn đã sẵn sàng cho những thử thách lớn hơn.

## Kết quả cần đạt

- Đọc hexadecimal, little-endian và địa chỉ ảo ở mức cơ bản.
- Nhận diện register, flag, stack frame, `call`, `ret`, `cmp`, `test` và branch.
- Chuyển một hàm C nhỏ thành control-flow graph.
- Ghi địa chỉ theo module offset/RVA để chịu được ASLR.

## 1. Bốn vùng chính trong debugger

| Vùng | Câu hỏi trả lời |
|---|---|
| Disassembly | CPU sắp thực hiện instruction nào? |
| Registers/flags | Input, result tạm và trạng thái so sánh là gì? |
| Dump/memory | Byte tại địa chỉ đang trỏ tới là gì? |
| Stack | Return address, local data và chuỗi call hiện tại ra sao? |

Register không có “ý nghĩa cố định” cho toàn bộ chương trình. Ý nghĩa phụ thuộc instruction và calling convention tại thời điểm quan sát.

## 2. Source lab

```c
#include <stdio.h>
#include <stdlib.h>

int classify_score(int score) {
    if (score < 0 || score > 100) return -1;
    if (score >= 80) return 2;
    if (score >= 50) return 1;
    return 0;
}

int main(int argc, char **argv) {
    if (argc != 2) return 2;
    int score = (int)strtol(argv[1], NULL, 10);
    printf("class=%d\n", classify_score(score));
    return 0;
}
```

Build Debug và Release. Không tối ưu ở lượt đầu để source/assembly dễ đối chiếu; sau đó bật tối ưu để so sánh.

## 3. Instruction cần biết

- `mov`: sao chép dữ liệu; không luôn có nghĩa “move ownership”.
- `lea`: tính địa chỉ hiệu dụng, cũng thường được compiler dùng cho phép toán.
- `cmp a, b`: cập nhật flag dựa trên phép trừ logic.
- `test a, a`: thường kiểm tra zero/null.
- `je/jz`, `jne/jnz`, `jl/jg`, `ja/jb`: branch phụ thuộc signed/unsigned và flags.
- `call`: lưu return address rồi chuyển control.
- `ret`: lấy return address và quay về caller.

## 4. Lab x64dbg

1. Mở đúng x32dbg/x64dbg theo PE target.
2. Đi tới module của toy app, không phân tích startup code của hệ thống quá sớm.
3. Tìm `classify_score` bằng symbol/map do build tạo.
4. Test `-1`, `49`, `50`, `79`, `80`, `101`.
5. Trước mỗi conditional branch, ghi operands và ZF/SF/OF/CF liên quan.
6. Vẽ basic block và edge; đánh dấu return value từng đường.
7. Lặp lại với Release, ghi nơi compiler inline, reorder hoặc dùng conditional move.

## 5. Evidence table

| Input | Module offset | Observation | Expected return | Actual |
|---:|---|---|---:|---:|
| -1 | `<module>+...` | range check fails | -1 | |
| 50 | `<module>+...` | middle branch | 1 | |
| 80 | `<module>+...` | high branch | 2 | |

## Lỗi thường gặp

- Đọc nhầm signed branch thành unsigned.
- Ghi địa chỉ tuyệt đối rồi không tìm lại được do ASLR.
- Đổi register/flag trong lúc quan sát nhưng không ghi modified state.
- Cho rằng disassembler luôn tách đúng boundary của function/data.
- Suy ra source chính xác từ một build tối ưu.

## Bài tập và rubric

Nộp control-flow graph, function map, bảng sáu input và so sánh Debug/Release. Chấm: instruction/flags 30, CFG 25, evidence 20, optimization reasoning 15, giới hạn kết luận 10.

