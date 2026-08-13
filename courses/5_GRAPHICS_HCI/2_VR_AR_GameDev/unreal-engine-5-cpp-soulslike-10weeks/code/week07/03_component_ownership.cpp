// unreal-engine-5-cpp-soulslike-10weeks · Tuần 07 · Bài 03: Component ownership.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{3, 4, 5};
    int total = 0; for (const int value : values) total += value;
    std::cout << "03 - Component ownership: " << total << '\n';
}
