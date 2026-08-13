// unreal-rpg-10weeks · Tuần 01 · Bài 18: Ghi log và debug tuần 01.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{18, 19, 20};
    int total = 0; for (const int value : values) total += value;
    std::cout << "18 - Ghi log và debug tuần 01: " << total << '\n';
}
