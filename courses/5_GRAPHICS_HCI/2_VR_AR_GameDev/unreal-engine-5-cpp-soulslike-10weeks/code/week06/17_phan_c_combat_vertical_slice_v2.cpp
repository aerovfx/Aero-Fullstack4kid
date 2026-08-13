// unreal-engine-5-cpp-soulslike-10weeks · Tuần 06 · Bài 17: 🔴 Phần C: Combat Vertical Slice v2.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - 🔴 Phần C: Combat Vertical Slice v2: " << total << '\n';
}
