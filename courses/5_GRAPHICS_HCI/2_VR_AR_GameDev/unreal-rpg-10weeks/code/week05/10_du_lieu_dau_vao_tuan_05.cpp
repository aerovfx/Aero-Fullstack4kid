// unreal-rpg-10weeks · Tuần 05 · Bài 10: Dữ liệu đầu vào tuần 05.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{10, 11, 12};
    int total = 0; for (const int value : values) total += value;
    std::cout << "10 - Dữ liệu đầu vào tuần 05: " << total << '\n';
}
