// unreal-rpg-10weeks · Tuần 08 · Bài 04: Thử thách (Challenge).
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{4, 5, 6};
    int total = 0; for (const int value : values) total += value;
    std::cout << "04 - Thử thách (Challenge): " << total << '\n';
}
