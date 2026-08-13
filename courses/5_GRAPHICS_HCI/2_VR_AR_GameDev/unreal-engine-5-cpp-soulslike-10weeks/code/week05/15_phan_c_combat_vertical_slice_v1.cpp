// unreal-engine-5-cpp-soulslike-10weeks · Tuần 05 · Bài 15: 🔴 Phần C: Combat Vertical Slice v1.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{15, 16, 17};
    int total = 0; for (const int value : values) total += value;
    std::cout << "15 - 🔴 Phần C: Combat Vertical Slice v1: " << total << '\n';
}
