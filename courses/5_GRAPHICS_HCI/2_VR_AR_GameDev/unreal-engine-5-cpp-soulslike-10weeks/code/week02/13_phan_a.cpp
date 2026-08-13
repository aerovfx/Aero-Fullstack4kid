// unreal-engine-5-cpp-soulslike-10weeks · Tuần 02 · Bài 13: 🟢 Phần A.
#include <array>
#include <iostream>
#include <string>
int main() {
    const std::array<int, 3> values{13, 14, 15};
    int total = 0; for (const int value : values) total += value;
    std::cout << "13 - 🟢 Phần A: " << total << '\n';
}
