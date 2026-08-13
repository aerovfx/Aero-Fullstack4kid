// unreal-rpg-10weeks · Tuần 03 · Bài 17: Tổ chức module tuần 03.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - Tổ chức module tuần 03: " << total << '\n';
}
