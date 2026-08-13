// unreal-rpg-10weeks · Tuần 03 · Bài 20: Thực hành có hướng dẫn tuần 03.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{20, 21, 22};
    int total = 0; for (const int value : values) total += value;
    std::cout << "20 - Thực hành có hướng dẫn tuần 03: " << total << '\n';
}
