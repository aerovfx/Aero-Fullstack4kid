// unreal-engine-5-cpp-soulslike-10weeks · Tuần 10 · Bài 17: 🔴 Phần C: Final Project.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{17, 18, 19};
    int total = 0; for (const int value : values) total += value;
    std::cout << "17 - 🔴 Phần C: Final Project: " << total << '\n';
}
