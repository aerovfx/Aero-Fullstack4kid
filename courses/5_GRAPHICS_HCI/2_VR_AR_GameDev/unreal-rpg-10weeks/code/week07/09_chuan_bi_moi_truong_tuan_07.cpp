// unreal-rpg-10weeks · Tuần 07 · Bài 09: Chuẩn bị môi trường tuần 07.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{9, 10, 11};
    int total = 0; for (const int value : values) total += value;
    std::cout << "09 - Chuẩn bị môi trường tuần 07: " << total << '\n';
}
