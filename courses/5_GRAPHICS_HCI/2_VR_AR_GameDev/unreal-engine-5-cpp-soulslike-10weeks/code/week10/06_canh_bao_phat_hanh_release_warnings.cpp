// unreal-engine-5-cpp-soulslike-10weeks · Tuần 10 · Bài 06: Cảnh Báo Phát Hành / Release Warnings.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{6, 7, 8};
    int total = 0; for (const int value : values) total += value;
    std::cout << "06 - Cảnh Báo Phát Hành / Release Warnings: " << total << '\n';
}
