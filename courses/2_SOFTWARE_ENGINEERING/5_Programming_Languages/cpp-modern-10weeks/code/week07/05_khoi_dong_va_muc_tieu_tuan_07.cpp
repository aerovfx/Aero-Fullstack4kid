// cpp-modern-10weeks · Tuần 07 · Bài 05: Khởi động và mục tiêu tuần 07.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{5, 6, 7};
    int total = 0; for (const int value : values) total += value;
    std::cout << "05 - Khởi động và mục tiêu tuần 07: " << total << '\n';
}
