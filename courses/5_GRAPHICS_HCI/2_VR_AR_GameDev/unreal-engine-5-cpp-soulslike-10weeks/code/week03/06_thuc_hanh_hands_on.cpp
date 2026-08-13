// unreal-engine-5-cpp-soulslike-10weeks · Tuần 03 · Bài 06: Thực Hành / Hands-On.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{6, 7, 8};
    int total = 0; for (const int value : values) total += value;
    std::cout << "06 - Thực Hành / Hands-On: " << total << '\n';
}
