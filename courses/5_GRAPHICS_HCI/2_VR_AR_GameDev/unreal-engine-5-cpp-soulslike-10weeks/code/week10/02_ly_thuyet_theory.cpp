// unreal-engine-5-cpp-soulslike-10weeks · Tuần 10 · Bài 02: Lý Thuyết / Theory.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{2, 3, 4};
    int total = 0; for (const int value : values) total += value;
    std::cout << "02 - Lý Thuyết / Theory: " << total << '\n';
}
