// ĐÁP ÁN - Bài tập 1 (Tuần 3): Hoán đổi giá trị bằng con trỏ.
#include <iostream>
using namespace std;

void swap_values(int* a, int* b) {
    int temp = *a;   // lưu giá trị mà a trỏ tới
    *a = *b;         // ghi giá trị của b vào ô nhớ của a
    *b = temp;       // ghi giá trị cũ của a vào ô nhớ của b
}

int main() {
    int x = 10;
    int y = 99;

    cout << "=== HOÁN ĐỔI GIÁ TRỊ BẰNG CON TRỎ ===" << endl;
    cout << "Trước khi hoán đổi: x = " << x << ", y = " << y << endl;
    cout << "Địa chỉ x = " << &x << " | Địa chỉ y = " << &y << endl;

    swap_values(&x, &y);   // truyền ĐỊA CHỈ, không phải giá trị

    cout << "Sau khi hoán đổi : x = " << x << ", y = " << y << endl;
    cout << "Địa chỉ x = " << &x << " | Địa chỉ y = " << &y << endl;
    cout << "=> Giá trị đổi chỗ, nhưng địa chỉ mỗi biến KHÔNG đổi." << endl;

    return 0;
}
