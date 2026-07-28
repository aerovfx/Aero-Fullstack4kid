# Modern C++ — 10 tuần

Khóa sử dụng C++20, tập trung vào RAII và thư viện chuẩn thay vì thao tác con trỏ thô không cần thiết. Mục tiêu là code rõ quyền sở hữu, kiểm thử được và có cấu hình build tái lập.

## Chuẩn bị

```bash
c++ --version
c++ -std=c++20 -Wall -Wextra -Wpedantic code/inventory.cpp -o inventory
./inventory
```

## Lộ trình

| Tuần | Chủ đề | Code trọng tâm | Sản phẩm |
|---|---|---|---|
| 1 | Compiler, biến, kiểu, hàm | `auto`, `const`, reference | Máy tính đơn vị |
| 2 | Điều khiển và STL cơ bản | range-for, `vector`, `string` | Thống kê điểm |
| 3 | Class và value semantics | constructor, method, encapsulation | Product model |
| 4 | RAII và resource lifetime | destructor, scope | File wrapper |
| 5 | Smart pointer | `unique_ptr`, `shared_ptr`, `weak_ptr` | Object graph |
| 6 | Algorithm và lambda | `sort`, `find_if`, `transform` | Search/filter |
| 7 | Template và concept | function/class template | Generic repository |
| 8 | Error handling | exception, `optional`, expected result | Parser an toàn |
| 9 | Testing, CMake, sanitizer | CTest, ASan/UBSan | Pipeline chất lượng |
| 10 | Concurrency và đồ án | thread, mutex, async | Inventory CLI |

## Ví dụ cốt lõi: STL và value semantics

```cpp
#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

struct Product {
    std::string name;
    int quantity{};
};

int main() {
    std::vector<Product> products{{"Keyboard", 3}, {"Mouse", 8}};
    const auto low_stock = std::ranges::find_if(products, [](const Product& item) {
        return item.quantity < 5;
    });
    if (low_stock != products.end()) {
        std::cout << low_stock->name << " needs restocking\n";
    }
}
```

`std::vector` sở hữu phần tử và tự giải phóng bộ nhớ. Lambda nhận `const Product&` để không sao chép và không sửa dữ liệu.

## Quy tắc an toàn

- Ưu tiên object theo value, container STL và smart pointer.
- Không dùng `new`/`delete` trực tiếp trong bài tập thông thường.
- Bật warning nghiêm ngặt; dùng AddressSanitizer và UndefinedBehaviorSanitizer khi debug.
- Không tối ưu dựa trên cảm giác: đo bằng profiler hoặc benchmark.

## Đồ án cuối khóa

Xây Inventory CLI hỗ trợ thêm sản phẩm, nhập/xuất kho, tìm kiếm và lưu tệp. Dùng CMake, tách library/application, có test cho business rules và chạy sạch sanitizer.

Code khởi đầu: [`code/inventory.cpp`](code/inventory.cpp).

