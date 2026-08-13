// unreal-rpg-10weeks · Tuần 04 · Bài 10: Dữ liệu đầu vào tuần 04.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{10, 11, 12};
    int total = 0; for (const int value : values) total += value;
    std::cout << "10 - Dữ liệu đầu vào tuần 04: " << total << '\n';
}
