// unreal-rpg-10weeks · Tuần 10 · Bài 02: Hướng dẫn thực hành (Hands-on).
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{2, 3, 4};
    int total = 0; for (const int value : values) total += value;
    std::cout << "02 - Hướng dẫn thực hành (Hands-on): " << total << '\n';
}
