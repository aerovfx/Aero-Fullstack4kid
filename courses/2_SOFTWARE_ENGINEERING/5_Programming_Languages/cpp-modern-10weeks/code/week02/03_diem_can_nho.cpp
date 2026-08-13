// cpp-modern-10weeks · Tuần 02 · Bài 03: Điểm cần nhớ.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{3, 4, 5};
    int total = 0; for (const int value : values) total += value;
    std::cout << "03 - Điểm cần nhớ: " << total << '\n';
}
