// unreal-rpg-10weeks · Tuần 06 · Bài 17: Tổ chức module tuần 06.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - Tổ chức module tuần 06: " << total << '\n';
}
