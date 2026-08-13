// cpp-modern-10weeks · Tuần 10 · Bài 06: Khái niệm nền tảng tuần 10.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{6, 7, 8};
    int total = 0; for (const int value : values) total += value;
    std::cout << "06 - Khái niệm nền tảng tuần 10: " << total << '\n';
}
