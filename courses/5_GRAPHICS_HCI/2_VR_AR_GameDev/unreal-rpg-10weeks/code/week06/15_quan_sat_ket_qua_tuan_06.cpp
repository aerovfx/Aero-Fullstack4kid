// unreal-rpg-10weeks · Tuần 06 · Bài 15: Quan sát kết quả tuần 06.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{15, 16, 17};
    int total = 0; for (const int value : values) total += value;
    std::cout << "15 - Quan sát kết quả tuần 06: " << total << '\n';
}
