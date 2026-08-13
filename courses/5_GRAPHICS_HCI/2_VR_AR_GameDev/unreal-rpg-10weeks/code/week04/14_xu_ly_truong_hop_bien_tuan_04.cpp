// unreal-rpg-10weeks · Tuần 04 · Bài 14: Xử lý trường hợp biên tuần 04.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{14, 15, 16};
    int total = 0; for (const int value : values) total += value;
    std::cout << "14 - Xử lý trường hợp biên tuần 04: " << total << '\n';
}
