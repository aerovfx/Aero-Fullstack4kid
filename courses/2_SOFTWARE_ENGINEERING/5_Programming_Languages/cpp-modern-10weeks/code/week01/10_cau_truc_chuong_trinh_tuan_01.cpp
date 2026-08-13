// cpp-modern-10weeks · Tuần 01 · Bài 10: Cấu trúc chương trình tuần 01.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{10, 11, 12};
    int total = 0; for (const int value : values) total += value;
    std::cout << "10 - Cấu trúc chương trình tuần 01: " << total << '\n';
}
