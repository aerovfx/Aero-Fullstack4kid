// unreal-rpg-10weeks · Tuần 03 · Bài 13: Kiểm tra dữ liệu tuần 03.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{13, 14, 15};
    int total = 0; for (const int value : values) total += value;
    std::cout << "13 - Kiểm tra dữ liệu tuần 03: " << total << '\n';
}
