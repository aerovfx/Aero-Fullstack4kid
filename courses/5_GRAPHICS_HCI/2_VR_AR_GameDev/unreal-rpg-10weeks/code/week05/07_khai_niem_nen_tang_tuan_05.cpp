// unreal-rpg-10weeks · Tuần 05 · Bài 07: Khái niệm nền tảng tuần 05.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{7, 8, 9};
    int total = 0; for (const int value : values) total += value;
    std::cout << "07 - Khái niệm nền tảng tuần 05: " << total << '\n';
}
