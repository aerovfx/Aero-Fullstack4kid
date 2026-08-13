// unreal-rpg-10weeks · Tuần 10 · Bài 08: Thuật ngữ quan trọng tuần 10.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{8, 9, 10};
    int total = 0; for (const int value : values) total += value;
    std::cout << "08 - Thuật ngữ quan trọng tuần 10: " << total << '\n';
}
