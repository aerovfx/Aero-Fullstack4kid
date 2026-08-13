// unreal-engine-5-cpp-soulslike-10weeks · Tuần 01 · Bài 05: Hướng đối tượng.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{5, 6, 7};
    int total = 0; for (const int value : values) total += value;
    std::cout << "05 - Hướng đối tượng: " << total << '\n';
}
