// unreal-rpg-10weeks · Tuần 08 · Bài 18: Ghi log và debug tuần 08.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{18, 19, 20};
    int total = 0; for (const int value : values) total += value;
    std::cout << "18 - Ghi log và debug tuần 08: " << total << '\n';
}
