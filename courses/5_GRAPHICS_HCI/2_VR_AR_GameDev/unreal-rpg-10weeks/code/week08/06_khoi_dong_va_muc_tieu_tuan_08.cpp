// unreal-rpg-10weeks · Tuần 08 · Bài 06: Khởi động và mục tiêu tuần 08.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{6, 7, 8};
    int total = 0; for (const int value : values) total += value;
    std::cout << "06 - Khởi động và mục tiêu tuần 08: " << total << '\n';
}
