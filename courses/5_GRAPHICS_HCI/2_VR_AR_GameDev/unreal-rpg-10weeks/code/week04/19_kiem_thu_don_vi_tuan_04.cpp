// unreal-rpg-10weeks · Tuần 04 · Bài 19: Kiểm thử đơn vị tuần 04.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{19, 20, 21};
    int total = 0; for (const int value : values) total += value;
    std::cout << "19 - Kiểm thử đơn vị tuần 04: " << total << '\n';
}
