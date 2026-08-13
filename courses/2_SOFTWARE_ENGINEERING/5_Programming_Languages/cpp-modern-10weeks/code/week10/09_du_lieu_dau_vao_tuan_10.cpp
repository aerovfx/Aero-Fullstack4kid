// cpp-modern-10weeks · Tuần 10 · Bài 09: Dữ liệu đầu vào tuần 10.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{9, 10, 11};
    int total = 0; for (const int value : values) total += value;
    std::cout << "09 - Dữ liệu đầu vào tuần 10: " << total << '\n';
}
