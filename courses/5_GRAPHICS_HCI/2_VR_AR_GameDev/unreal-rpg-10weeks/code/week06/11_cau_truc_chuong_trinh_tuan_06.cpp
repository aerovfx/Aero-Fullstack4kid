// unreal-rpg-10weeks · Tuần 06 · Bài 11: Cấu trúc chương trình tuần 06.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{11, 12, 13};
    int total = 0; for (const int value : values) total += value;
    std::cout << "11 - Cấu trúc chương trình tuần 06: " << total << '\n';
}
