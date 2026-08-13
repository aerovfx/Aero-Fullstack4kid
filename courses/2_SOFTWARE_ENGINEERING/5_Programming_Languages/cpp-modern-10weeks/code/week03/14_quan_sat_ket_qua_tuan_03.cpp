// cpp-modern-10weeks · Tuần 03 · Bài 14: Quan sát kết quả tuần 03.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{14, 15, 16};
    int total = 0; for (const int value : values) total += value;
    std::cout << "14 - Quan sát kết quả tuần 03: " << total << '\n';
}
