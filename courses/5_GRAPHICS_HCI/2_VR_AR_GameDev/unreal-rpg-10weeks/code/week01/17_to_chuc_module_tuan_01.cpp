// unreal-rpg-10weeks · Tuần 01 · Bài 17: Tổ chức module tuần 01.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - Tổ chức module tuần 01: " << total << '\n';
}
