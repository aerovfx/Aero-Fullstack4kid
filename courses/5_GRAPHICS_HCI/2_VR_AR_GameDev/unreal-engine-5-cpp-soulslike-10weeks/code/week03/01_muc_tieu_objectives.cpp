// unreal-engine-5-cpp-soulslike-10weeks · Tuần 03 · Bài 01: Mục Tiêu / Objectives.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{1, 2, 3};
    int total = 0; for (const int value : values) total += value;
    std::cout << "01 - Mục Tiêu / Objectives: " << total << '\n';
}
