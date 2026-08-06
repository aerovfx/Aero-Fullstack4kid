// ex01_pointer_swap.cpp
//
// BÀI TẬP 1 (Tuần 3): HOÁN ĐỔI GIÁ TRỊ BẰNG CON TRỎ
// Ôn lại: con trỏ, địa chỉ (&), truy cập gián tiếp (*), truyền tham chiếu qua con trỏ.
//
// NHIỆM VỤ:
// Viết hàm swap_values(int* a, int* b) hoán đổi giá trị của HAI biến gốc
// bằng cách thao tác trực tiếp trên bộ nhớ qua con trỏ.
//
// Vì sao quan trọng với bảo mật: hiểu con trỏ trỏ vào đâu và sửa gì trong
// bộ nhớ là nền tảng để hiểu các lỗ hổng bộ nhớ (buffer overflow, UAF) ở Tuần 4.
//
// BIÊN DỊCH & CHẠY:
//   g++ ex01_pointer_swap.cpp -o swap && ./swap

#include <iostream>
using namespace std;

// TODO 1: Hoàn thành hàm này.
// Nhận vào ĐỊA CHỈ của hai biến. Dùng *a, *b để đọc/ghi giá trị GỐC.
// Gợi ý: cần một biến tạm để không mất giá trị khi gán đè.
void swap_values(int* a, int* b) {
    // ... viết code ở đây ...
}

int main() {
    int x = 10;
    int y = 99;

    cout << "=== HOÁN ĐỔI GIÁ TRỊ BẰNG CON TRỎ ===" << endl;
    cout << "Trước khi hoán đổi: x = " << x << ", y = " << y << endl;

    // TODO 2: Gọi swap_values và truyền vào ĐỊA CHỈ của x và y (dùng &).
    // swap_values( ... , ... );

    cout << "Sau khi hoán đổi : x = " << x << ", y = " << y << endl;

    // TODO 3 (nâng cao): in ra địa chỉ bộ nhớ của x và y (&x, &y) để thấy
    // rằng giá trị đổi chỗ nhưng địa chỉ của mỗi biến thì KHÔNG đổi.

    return 0;
}
