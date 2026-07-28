# Tuần 3: Assembly và control flow nền tảng

## Nguồn bài học

**Basic Steps of x64dbg Debugger** — giao diện CPU, register, memory, stack và các thao tác chạy/đi từng lệnh. Bài học dùng chương trình lớp tự biên dịch có symbol.

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

