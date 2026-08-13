// unreal-engine-5-cpp-soulslike-10weeks · Tuần 02 · Bài 06: Cảnh Báo Kỹ Thuật / Technical Warnings.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{6, 7, 8};
    int total = 0; for (const int value : values) total += value;
    std::cout << "06 - Cảnh Báo Kỹ Thuật / Technical Warnings: " << total << '\n';
}
