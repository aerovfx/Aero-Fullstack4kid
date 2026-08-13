// unreal-engine-5-cpp-soulslike-10weeks · Tuần 04 · Bài 09: Cấp độ 1: Interface.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{9, 10, 11};
    int total = 0; for (const int value : values) total += value;
    std::cout << "09 - Cấp độ 1: Interface: " << total << '\n';
}
