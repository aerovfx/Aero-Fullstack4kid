// cpp-modern-10weeks · Tuần 02 · Bài 08: Chuẩn bị môi trường tuần 02.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{8, 9, 10};
    int total = 0; for (const int value : values) total += value;
    std::cout << "08 - Chuẩn bị môi trường tuần 02: " << total << '\n';
}
