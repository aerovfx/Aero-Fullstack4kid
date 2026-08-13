// unreal-rpg-10weeks · Tuần 07 · Bài 14: Xử lý trường hợp biên tuần 07.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{14, 15, 16};
    int total = 0; for (const int value : values) total += value;
    std::cout << "14 - Xử lý trường hợp biên tuần 07: " << total << '\n';
}
