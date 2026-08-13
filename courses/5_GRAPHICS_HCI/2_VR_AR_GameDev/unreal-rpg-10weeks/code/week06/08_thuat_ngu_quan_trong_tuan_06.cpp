// unreal-rpg-10weeks · Tuần 06 · Bài 08: Thuật ngữ quan trọng tuần 06.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{8, 9, 10};
    int total = 0; for (const int value : values) total += value;
    std::cout << "08 - Thuật ngữ quan trọng tuần 06: " << total << '\n';
}
