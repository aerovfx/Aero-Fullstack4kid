// unreal-rpg-10weeks · Tuần 01 · Bài 19: Kiểm thử đơn vị tuần 01.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{19, 20, 21};
    int total = 0; for (const int value : values) total += value;
    std::cout << "19 - Kiểm thử đơn vị tuần 01: " << total << '\n';
}
