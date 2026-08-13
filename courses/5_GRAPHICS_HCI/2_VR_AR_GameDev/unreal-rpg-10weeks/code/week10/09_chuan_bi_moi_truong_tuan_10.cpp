// unreal-rpg-10weeks · Tuần 10 · Bài 09: Chuẩn bị môi trường tuần 10.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{9, 10, 11};
    int total = 0; for (const int value : values) total += value;
    std::cout << "09 - Chuẩn bị môi trường tuần 10: " << total << '\n';
}
